# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_pybind_pybind11-src"
  "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_pybind_pybind11-build"
  "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_pybind_pybind11-subbuild/com_pybind_pybind11-populate-prefix"
  "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_pybind_pybind11-subbuild/com_pybind_pybind11-populate-prefix/tmp"
  "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_pybind_pybind11-subbuild/com_pybind_pybind11-populate-prefix/src/com_pybind_pybind11-populate-stamp"
  "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_pybind_pybind11-subbuild/com_pybind_pybind11-populate-prefix/src"
  "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_pybind_pybind11-subbuild/com_pybind_pybind11-populate-prefix/src/com_pybind_pybind11-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_pybind_pybind11-subbuild/com_pybind_pybind11-populate-prefix/src/com_pybind_pybind11-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_pybind_pybind11-subbuild/com_pybind_pybind11-populate-prefix/src/com_pybind_pybind11-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
