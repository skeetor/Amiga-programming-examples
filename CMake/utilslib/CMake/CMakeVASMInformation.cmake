
set(ASM_DIALECT "VASM")

set(CMAKE_${ASM_DIALECT}_FLAGS "-esc -kick1hunks -Fhunk -chklabels -nocase -quiet")
set(CMAKE_${ASM_DIALECT}_FLAGS_DEBUG "${CMAKE_ASM_FLAGS} -dwarf")
set(CMAKE_${ASM_DIALECT}_FLAGS_RELEASE "${CMAKE_ASM_FLAGS} -nosym")

if(NOT CMAKE_${ASM_DIALECT}_COMPILE_OBJECT)
	message(STATUS "Enable ${ASM_DIALECT}")
	set(CMAKE_${ASM_DIALECT}_COMPILE_OBJECT "<CMAKE_${ASM_DIALECT}_COMPILER> ${CMAKE_VASM_FLAGS} -o <OBJECT> <SOURCE>")
endif()

if(NOT CMAKE_${ASM_DIALECT}_CREATE_STATIC_LIBRARY)
  set(CMAKE_${ASM_DIALECT}_CREATE_STATIC_LIBRARY
      "<CMAKE_AR> cr <TARGET> <LINK_FLAGS> <OBJECTS> "
      "<CMAKE_RANLIB> <TARGET> ")
endif()

if(NOT CMAKE_${ASM_DIALECT}_LINK_EXECUTABLE)
	set(CMAKE_LINKER "${AMIGA_M68K_ASSEMBLER_PATH}${AMIGA_LINKER_NAME}")
	set(CMAKE_${ASM_DIALECT}_EXE_LINKER_FLAGS "-b amigahunk -Bstatic -nostdlib")
	set(CMAKE_LINKER_FLAGS_DEBUG "${CMAKE_EXE_LINKER_FLAGS}")
	set(CMAKE_LINKER_FLAGS_RELEASE "${CMAKE_EXE_LINKER_FLAGS} -S -s")
	set(CMAKE_VASM_LINK_EXECUTABLE "${CMAKE_VASM_LINKER} ${CMAKE_VASM_EXE_LINKER_FLAGS} <OBJECTS> -o <TARGET> <LINK_LIBRARIES>")
endif()

set(CMAKE_${ASM_DIALECT}_INFORMATION_LOADED 1)
			   
set(ASM_DIALECT)