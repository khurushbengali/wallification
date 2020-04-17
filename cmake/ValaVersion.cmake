##
include(ParseArguments)
find_package(Vala REQUIRED)

##
# Ensure a certain valac version is available
#
# The initial argument is the version to check for
# 
# It may be followed by a optional parameter to specifiy a version range. The
# following options are valid:
# 
# EXACT
#   Vala needs to be available in the exact version given
# 
# MINIMUM
#   The provided version is the minimum version. Therefore Vala needs to be
#   available in the given version or any higher version
#
# MAXIMUM
#   The provided version is the maximum. Therefore Vala needs to be available
#   in the given version or any version older than this
#
# If no option is specified the version will be treated as a minimal version.
##
macro(ensure_vala_version version)
    parse_arguments(ARGS "" "MINIMUM;MAXIMUM;EXACT" ${ARGN})
	set(compare_message "")
	set(error_message "")
	if(ARGS_MINIMUM)
		set(compare_message "a minimum ")
		set(error_message "or greater ")
	elseif(ARGS_MAXIMUM)
		set(compare_message "a maximum ")
		set(error_message "or less ")
	endif(ARGS_MINIMUM)
	
	message(STATUS 
		"checking for ${compare_message}Vala version of ${version}"
	)

	unset(version_accepted)
	
	# MINIMUM is the default if no option is specified
	if(ARGS_EXACT)
		if(${VALA_VERSION} VERSION_EQUAL ${version} )
			set(version_accepted TRUE)	
		endif(${VALA_VERSION} VERSION_EQUAL ${version})
	elseif(ARGS_MAXIMUM)
		if(${VALA_VERSION} VERSION_LESS ${version} OR ${VALA_VERSION} VERSION_EQUAL ${version})
			set(version_accepted TRUE)	
		endif(${VALA_VERSION} VERSION_LESS ${version} OR ${VALA_VERSION} VERSION_EQUAL ${version})
	else(ARGS_MAXIMUM)
		if(${VALA_VERSION} VERSION_GREATER ${version} OR ${VALA_VERSION} VERSION_EQUAL ${version})
			set(version_accepted TRUE)	
		endif(${VALA_VERSION} VERSION_GREATER ${version} OR ${VALA_VERSION} VERSION_EQUAL ${version})
	endif(ARGS_EXACT)

	if (NOT version_accepted)
		message(FATAL_ERROR 
			"Vala version ${version} ${error_message}is required."
		)
	endif(NOT version_accepted)

	message(STATUS
		"  found Vala, version ${VALA_VERSION}"
	)
endmacro(ensure_vala_version)
