# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_xtensorstack_xtl-src"
  "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_xtensorstack_xtl-build"
  "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_xtensorstack_xtl-subbuild/com_xtensorstack_xtl-populate-prefix"
  "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_xtensorstack_xtl-subbuild/com_xtensorstack_xtl-populate-prefix/tmp"
  "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_xtensorstack_xtl-subbuild/com_xtensorstack_xtl-populate-prefix/src/com_xtensorstack_xtl-populate-stamp"
  "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_xtensorstack_xtl-subbuild/com_xtensorstack_xtl-populate-prefix/src"
  "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_xtensorstack_xtl-subbuild/com_xtensorstack_xtl-populate-prefix/src/com_xtensorstack_xtl-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_xtensorstack_xtl-subbuild/com_xtensorstack_xtl-populate-prefix/src/com_xtensorstack_xtl-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_xtensorstack_xtl-subbuild/com_xtensorstack_xtl-populate-prefix/src/com_xtensorstack_xtl-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
