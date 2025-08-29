# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file LICENSE.rst or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION ${CMAKE_VERSION}) # this file comes with cmake

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/protocolbuffers_protobuf-src")
  file(MAKE_DIRECTORY "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/protocolbuffers_protobuf-src")
endif()
file(MAKE_DIRECTORY
  "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/protocolbuffers_protobuf-build"
  "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/protocolbuffers_protobuf-subbuild/protocolbuffers_protobuf-populate-prefix"
  "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/protocolbuffers_protobuf-subbuild/protocolbuffers_protobuf-populate-prefix/tmp"
  "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/protocolbuffers_protobuf-subbuild/protocolbuffers_protobuf-populate-prefix/src/protocolbuffers_protobuf-populate-stamp"
  "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/protocolbuffers_protobuf-subbuild/protocolbuffers_protobuf-populate-prefix/src"
  "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/protocolbuffers_protobuf-subbuild/protocolbuffers_protobuf-populate-prefix/src/protocolbuffers_protobuf-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/protocolbuffers_protobuf-subbuild/protocolbuffers_protobuf-populate-prefix/src/protocolbuffers_protobuf-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/protocolbuffers_protobuf-subbuild/protocolbuffers_protobuf-populate-prefix/src/protocolbuffers_protobuf-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
