# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_xtensorstack_xtensor-src"
  "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_xtensorstack_xtensor-build"
  "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_xtensorstack_xtensor-subbuild/com_xtensorstack_xtensor-populate-prefix"
  "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_xtensorstack_xtensor-subbuild/com_xtensorstack_xtensor-populate-prefix/tmp"
  "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_xtensorstack_xtensor-subbuild/com_xtensorstack_xtensor-populate-prefix/src/com_xtensorstack_xtensor-populate-stamp"
  "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_xtensorstack_xtensor-subbuild/com_xtensorstack_xtensor-populate-prefix/src"
  "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_xtensorstack_xtensor-subbuild/com_xtensorstack_xtensor-populate-prefix/src/com_xtensorstack_xtensor-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_xtensorstack_xtensor-subbuild/com_xtensorstack_xtensor-populate-prefix/src/com_xtensorstack_xtensor-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_xtensorstack_xtensor-subbuild/com_xtensorstack_xtensor-populate-prefix/src/com_xtensorstack_xtensor-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
