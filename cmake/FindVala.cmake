
##
# Find module for the Vala compiler (valac)
#
# This module determines wheter a Vala compiler is installed on the current
# system and where its executable is.
#
# Call the module using "find_package(Vala) from within your CMakeLists.txt.
#
# The following variables will be set after an invocation:
#
#  VALA_FOUND       Whether the vala compiler has been found or not
#  VALA_EXECUTABLE  Full path to the valac executable if it has been found
#  VALA_VERSION     Version number of the available valac
##


# Search for the valac executable in the usual system paths.
find_program(VALA_EXECUTABLE
  NAMES valac)

# Handle the QUIETLY and REQUIRED arguments, which may be given to the find call.
# Furthermore set VALA_FOUND to TRUE if Vala has been found (aka.
# VALA_EXECUTABLE is set)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Vala DEFAULT_MSG VALA_EXECUTABLE)

mark_as_advanced(VALA_EXECUTABLE)

# Determine the valac version
if(VALA_FOUND)
    execute_process(COMMAND ${VALA_EXECUTABLE} "--version" 
                    OUTPUT_VARIABLE "VALA_VERSION")
    string(REPLACE "Vala" "" "VALA_VERSION" ${VALA_VERSION})
    string(STRIP ${VALA_VERSION} "VALA_VERSION")
endif(VALA_FOUND)
