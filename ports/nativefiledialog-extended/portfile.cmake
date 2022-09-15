vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO btzy/nativefiledialog-extended
    REF d4df2b6ad5420f5300c00f418bf28d86291fa675 # nativefiledialog-extended-1.0.0
    SHA512 164bea794e38401fbcfb1a20077e3420e7e2195f4bf18c39adc94e394004531dc3d506b266f5318e9e3ab02a92d99b3c373c40ef5b5f60765fdd03570d91dded
    HEAD_REF master
)

set(NFDE_SHARED OFF)
if(VCPKG_LIBRARY_LINKAGE STREQUAL "dynamic")
	set(NFDE_SHARED ON)
endif()

set(ALSOFT_REQUIRE_LINUX OFF)


vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_SHARED_LIBS=${NFDE_SHARED}
		-DNFD_PORTAL=${VCPKG_TARGET_IS_LINUX}
)

vcpkg_cmake_install()
#vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/OpenAL")

#foreach(HEADER al.h alc.h)
#    file(READ "${CURRENT_PACKAGES_DIR}/include/AL/${HEADER}" AL_H)
#    if(VCPKG_LIBRARY_LINKAGE STREQUAL "static")
#        string(REPLACE "defined(AL_LIBTYPE_STATIC)" "1" AL_H "${AL_H}")
#    else()
#        # Normally we would say:
#        # string(REPLACE "defined(AL_LIBTYPE_STATIC)" "0" AL_H "${AL_H}")
#        # but we are leaving these undefined macros alone in support of
#        # https://github.com/microsoft/vcpkg/issues/18098
#    endif()
#    file(WRITE "${CURRENT_PACKAGES_DIR}/include/AL/${HEADER}" "${AL_H}")
#endforeach()

#vcpkg_fixup_pkgconfig()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
#file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

#vcpkg_copy_pdbs()
