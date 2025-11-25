
if (NOT DEFINED CCUCTS_DEFINITION_PROCESS)
  message(FATAL_ERROR "include _import_me.cmake")
endif()

# todo: develop this function better
function(ccucts_detect_cpu_os cpu_var os_var posix_var)
  set(${cpu_var} "x86_64" )
  set(${os_var} "linux-gnu" )
  set(${posix_var} TRUE )
  return(PROPAGATE ${cpu_var} ${os_var} ${posix_var})
endfunction()
