
if(NOT "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_xtensorstack_xtl-subbuild/com_xtensorstack_xtl-populate-prefix/src/com_xtensorstack_xtl-populate-stamp/com_xtensorstack_xtl-populate-gitinfo.txt" IS_NEWER_THAN "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_xtensorstack_xtl-subbuild/com_xtensorstack_xtl-populate-prefix/src/com_xtensorstack_xtl-populate-stamp/com_xtensorstack_xtl-populate-gitclone-lastrun.txt")
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: '/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_xtensorstack_xtl-subbuild/com_xtensorstack_xtl-populate-prefix/src/com_xtensorstack_xtl-populate-stamp/com_xtensorstack_xtl-populate-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E rm -rf "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_xtensorstack_xtl-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: '/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_xtensorstack_xtl-src'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "/opt/homebrew/bin/git"  clone --no-checkout --config "advice.detachedHead=false" "https://github.com/xtensor-stack/xtl" "com_xtensorstack_xtl-src"
    WORKING_DIRECTORY "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty"
    RESULT_VARIABLE error_code
    )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once:
          ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/xtensor-stack/xtl'")
endif()

execute_process(
  COMMAND "/opt/homebrew/bin/git"  checkout 0.7.2 --
  WORKING_DIRECTORY "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_xtensorstack_xtl-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: '0.7.2'")
endif()

set(init_submodules TRUE)
if(init_submodules)
  execute_process(
    COMMAND "/opt/homebrew/bin/git"  submodule update --recursive --init 
    WORKING_DIRECTORY "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_xtensorstack_xtl-src"
    RESULT_VARIABLE error_code
    )
endif()
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: '/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_xtensorstack_xtl-src'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_xtensorstack_xtl-subbuild/com_xtensorstack_xtl-populate-prefix/src/com_xtensorstack_xtl-populate-stamp/com_xtensorstack_xtl-populate-gitinfo.txt"
    "/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_xtensorstack_xtl-subbuild/com_xtensorstack_xtl-populate-prefix/src/com_xtensorstack_xtl-populate-stamp/com_xtensorstack_xtl-populate-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/Users/jd18380/Documents/TenSEAL/_deps/com_microsoft_seal-build/thirdparty/com_xtensorstack_xtl-subbuild/com_xtensorstack_xtl-populate-prefix/src/com_xtensorstack_xtl-populate-stamp/com_xtensorstack_xtl-populate-gitclone-lastrun.txt'")
endif()

