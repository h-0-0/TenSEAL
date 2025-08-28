import os
import sys
import platform
import subprocess
import re
import setuptools

from setuptools import setup, Extension
from setuptools.command.build_ext import build_ext
from distutils.version import LooseVersion


def read(fname):
    return open(os.path.join(os.path.dirname(__file__), fname)).read()


def find_version():
    version_file = read("tenseal/version.py")
    version_re = r"__version__\s*=\s*\"(?P<version>[^\"]+)\""
    m = re.search(version_re, version_file)
    if not m:
        raise RuntimeError("Failed to parse __version__ from tenseal/version.py")
    return m.group("version")


class CMakeExtension(Extension):
    def __init__(self, name, sourcedir=""):
        Extension.__init__(self, name, sources=[])
        self.sourcedir = os.path.abspath(sourcedir)


class CMakeBuild(build_ext):
    def run(self):
        try:
            out = subprocess.check_output(["cmake", "--version"])
        except OSError:
            raise RuntimeError(
                "CMake must be installed to build the following extensions: "
                + ", ".join(e.name for e in self.extensions)
            )

        if platform.system() == "Windows":
            m = re.search(r"version\s*([\d.]+)", out.decode())
            if not m:
                raise RuntimeError("Failed to parse CMake version from output")
            cmake_version = LooseVersion(m.group(1))
            if cmake_version < "3.1.0":
                raise RuntimeError("CMake >= 3.1.0 is required on Windows")

        for ext in self.extensions:
            self.build_extension(ext)

    def build_extension(self, ext):
        extdir = os.path.abspath(os.path.dirname(self.get_ext_fullpath(ext.name)))
        hexl = "OFF"
        cmake_args = [
            "-DSEAL_USE_INTEL_HEXL=" + hexl,
            "-DCMAKE_LIBRARY_OUTPUT_DIRECTORY=" + extdir,
            "-DPYTHON_EXECUTABLE=" + sys.executable,
        ]

        cfg = "Debug" if self.debug else "Release"
        build_args = ["--config", cfg]

        env = os.environ.copy()

        if platform.system() == "Darwin":
            # Ensure CMake builds the architecture requested by cibuildwheel
            archflags = env.get("ARCHFLAGS", "")
            arch_list = re.findall(r"-arch\s+(\S+)", archflags)
            if arch_list:
                cmake_args += [f"-DCMAKE_OSX_ARCHITECTURES={';'.join(arch_list)}"]
            # Set deployment target per-arch if not explicitly provided
            deployment_target = env.get("MACOSX_DEPLOYMENT_TARGET")
            if not deployment_target:
                if "arm64" in arch_list:
                    deployment_target = "11.0"
                elif "x86_64" in arch_list:
                    deployment_target = "10.12"
            # Enforce minimums required by dependencies
            def _ver_tuple(v: str):
                return tuple(int(x) for x in v.split("."))
            if deployment_target:
                if "arm64" in arch_list and _ver_tuple(deployment_target) < _ver_tuple("11.0"):
                    deployment_target = "11.0"
                if "x86_64" in arch_list and _ver_tuple(deployment_target) < _ver_tuple("10.13"):
                    deployment_target = "10.13"
            if deployment_target:
                cmake_args += [f"-DCMAKE_OSX_DEPLOYMENT_TARGET={deployment_target}"]
            # Prefer Ninja on macOS for consistent generator behavior
            cmake_args += ["-G", "Ninja", "-DCMAKE_VERBOSE_MAKEFILE=ON", "-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=OFF"]
        else:
            # Increase CMake verbosity on non-macOS as well
            cmake_args += ["-DCMAKE_VERBOSE_MAKEFILE=ON"]

        if platform.system() == "Windows":
            cmake_args += [f"-DCMAKE_LIBRARY_OUTPUT_DIRECTORY_{cfg.upper()}={extdir}"]
            if sys.maxsize > 2**32:
                cmake_args += ["-A", "x64"]
            build_args += ["--", "/m", "/p:TrackFileAccess=false"]
        else:
            cmake_args += ["-DCMAKE_BUILD_TYPE=" + cfg]

        # Use CMake's cross-generator parallel level instead of "-- -j"
        env.setdefault("CMAKE_BUILD_PARALLEL_LEVEL", str(os.cpu_count() or 2))

        env["CXXFLAGS"] = '{} -DVERSION_INFO=\\"{}\\"'.format(
            env.get("CXXFLAGS", ""), self.distribution.get_version()
        )
        if not os.path.exists(self.build_temp):
            os.makedirs(self.build_temp)
        subprocess.check_call(["cmake", ext.sourcedir] + cmake_args, cwd=self.build_temp, env=env)
        subprocess.check_call(["cmake", "--build", "."] + build_args, cwd=self.build_temp)


setuptools.setup(
    name="tenseal",
    version=find_version(),
    author="OpenMined",
    author_email="info@openmined.org",
    description="A Library for Homomorphic Encryption Operations on Tensors",
    license="Apache-2.0",
    keywords="homomorphic encryption tensor deep learning privacy secure",
    long_description=read("README.md"),
    long_description_content_type="text/markdown",
    url="https://github.com/OpenMined/TenSEAL",
    packages=setuptools.find_packages(include=["tenseal", "tenseal.*"]),
    classifiers=[
        "Programming Language :: C++",
        "Programming Language :: Python :: 3",
        "Operating System :: OS Independent",
        "Topic :: Security :: Cryptography",
    ],
    ext_modules=[CMakeExtension("_tenseal_cpp")],
    cmdclass=dict(build_ext=CMakeBuild),
    zip_safe=False,
)
