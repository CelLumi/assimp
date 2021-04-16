project "assimp"
	kind "StaticLib"
    language "C++"
    
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	includedirs {
		
		"../assimp/", 
		"include/",
		"code/",
		"code/Common/",
		"contrib/pugixml/src/",
		"contrib/zlib/",
		"contrib/zlib/contrib/minizip/"
	
	}

	files {

		-- Dependencies
		"contrib/unzip/**.cpp",
		"contrib/unzip/**.h",
		"contrib/irrXML/**.cpp",
		"contrib/irrXML/**.h",
		"contrib/zlib/*.cpp",
		"contrib/zlib/*.h",
		"contrib/pugixml/**.hpp",
		-- Common
		"code/Common/**.cpp",
		"code/Common/**.h",
		"code/PostProcessing/**.cpp",
		"code/PostProcessing/**.h",
		"code/Material/**.cpp",
		"code/Material/**.h",
		"code/CApi/**.cpp",
		"code/CApi/**.h",
		-- Importers
		"code/AssetLib/Collada/**.cpp",
		"code/AssetLib/Collada/**.h",
		"code/AssetLib/Obj/**.cpp",
		"code/AssetLib/Obj/**.h",
		"code/AssetLib/Blender/**.cpp",
		"code/AssetLib/Blender/**.h",
		-- "assimp/contrib/poly2tri/poly2tri/**",
		"code/AssetLib/FBX/**.cpp",
		"code/AssetLib/FBX/**.h",
		-- "assimp/code/glTF2/**",
		-- "assimp/code/glTF/**",
		"code/AssetLib/Assbin/**.cpp", -- For caching
		"code/AssetLib/Assbin/**.h"

	}

	-- Importers
	defines {

		"ASSIMP_BUILD_NO_3D_IMPORTER",
		"ASSIMP_BUILD_NO_3DS_IMPORTER",
		"ASSIMP_BUILD_NO_3MF_IMPORTER",
		"ASSIMP_BUILD_NO_AC_IMPORTER",
		"ASSIMP_BUILD_NO_AMF_IMPORTER",
		"ASSIMP_BUILD_NO_ASE_IMPORTER",
		-- "ASSIMP_BUILD_NO_ASSBIN_IMPORTER"
		"ASSIMP_BUILD_NO_B3D_IMPORTER",
		-- "ASSIMP_BUILD_NO_BLEND_IMPORTER",
		"ASSIMP_BUILD_NO_BVH_IMPORTER",
		"ASSIMP_BUILD_NO_C4D_IMPORTER",
		"ASSIMP_BUILD_NO_COB_IMPORTER",
		-- "ASSIMP_BUILD_NO_COLLADA_IMPORTER",
		"ASSIMP_BUILD_NO_CSM_IMPORTER",
		"ASSIMP_BUILD_NO_DXF_IMPORTER",
		-- "ASSIMP_BUILD_NO_FBX_IMPORTER",
		"ASSIMP_BUILD_NO_GLTF_IMPORTER",
		"ASSIMP_BUILD_NO_HMP_IMPORTER",
		"ASSIMP_BUILD_NO_IFC_IMPORTER",
		"ASSIMP_BUILD_NO_IRR_IMPORTER",
		"ASSIMP_BUILD_NO_IRRMESH_IMPORTER",
		"ASSIMP_BUILD_NO_LWO_IMPORTER",
		"ASSIMP_BUILD_NO_LWS_IMPORTER",
		"ASSIMP_BUILD_NO_M3D_IMPORTER",
		"ASSIMP_BUILD_NO_MD2_IMPORTER",
		"ASSIMP_BUILD_NO_MD3_IMPORTER",
		"ASSIMP_BUILD_NO_MD5_IMPORTER",
		"ASSIMP_BUILD_NO_MDC_IMPORTER",
		"ASSIMP_BUILD_NO_MDL_IMPORTER",
		"ASSIMP_BUILD_NO_MMD_IMPORTER",
		"ASSIMP_BUILD_NO_MS3D_IMPORTER",
		"ASSIMP_BUILD_NO_NDO_IMPORTER",
		"ASSIMP_BUILD_NO_NFF_IMPORTER",
		-- "ASSIMP_BUILD_NO_OBJ_IMPORTER",
		"ASSIMP_BUILD_NO_OFF_IMPORTER",
		"ASSIMP_BUILD_NO_OGRE_IMPORTER",
		"ASSIMP_BUILD_NO_OPENGEX_IMPORTER",
		"ASSIMP_BUILD_NO_PLY_IMPORTER",
		"ASSIMP_BUILD_NO_Q3BSP_IMPORTER",
		"ASSIMP_BUILD_NO_Q3D_IMPORTER",
		"ASSIMP_BUILD_NO_RAW_IMPORTER",
		"ASSIMP_BUILD_NO_SIB_IMPORTER",
		"ASSIMP_BUILD_NO_SMD_IMPORTER",
		"ASSIMP_BUILD_NO_STEP_IMPORTER",
		"ASSIMP_BUILD_NO_STL_IMPORTER",
		"ASSIMP_BUILD_NO_TERRAGEN_IMPORTER",
		"ASSIMP_BUILD_NO_X_IMPORTER",
		"ASSIMP_BUILD_NO_X3D_IMPORTER",
		"ASSIMP_BUILD_NO_XGL_IMPORTER"

	}

	-- Exporters
	defines {

		"ASSIMP_BUILD_NO_COLLADA_EXPORTER",
		"ASSIMP_BUILD_NO_X_EXPORTER",
		"ASSIMP_BUILD_NO_STEP_EXPORTER",
		"ASSIMP_BUILD_NO_OBJ_EXPORTER",
		"ASSIMP_BUILD_NO_STL_EXPORTER",
		"ASSIMP_BUILD_NO_PLY_EXPORTER",
		"ASSIMP_BUILD_NO_3DS_EXPORTER",
		"ASSIMP_BUILD_NO_GLTF_EXPORTER",
		-- "ASSIMP_BUILD_NO_ASSBIN_EXPORTER",
		"ASSIMP_BUILD_NO_ASSXML_EXPORTER",
		"ASSIMP_BUILD_NO_X3D_EXPORTER",
		"ASSIMP_BUILD_NO_FBX_EXPORTER",
		"ASSIMP_BUILD_NO_M3D_EXPORTER",
		"ASSIMP_BUILD_NO_3MF_EXPORTER",
		"ASSIMP_BUILD_NO_ASSJSON_EXPORTER"

	}

	-- Use double precision
	defines {
		"ASSIMP_DOUBLE_PRECISION"
	}

	-- Supresses floating point conversion warnings in VS
	-- For debugging FPVs, remove or comment this block
	disablewarnings {
		"4244"
	}

    filter "system:windows"
			systemversion "latest"
			staticruntime "On"

					-- Convert config files from templates to headers

            		prebuildcommands {
                		("copy \"$(SolutionDir)EngTest\\externals\\assimp\\include\\assimp\\config.h.in\" \"$(SolutionDir)EngTest\\externals\\assimp\\include\\assimp\\config.h\" /Y"),
						("copy \"$(SolutionDir)EngTest\\externals\\assimp\\contrib\\zlib\\zconf.h.in\" \"$(SolutionDir)EngTest\\externals\\assimp\\contrib\\zlib\\zconf.h\" /Y"),
						("copy \"$(SolutionDir)EngTest\\externals\\assimp\\revision.h.in\" \"$(SolutionDir)EngTest\\externals\\assimp\\revision.h\" /Y")
            		}


		filter "configurations:Debug"
			runtime "Debug"
			symbols "on"

		filter "configurations:Release"
			runtime "Release"
			optimize "on"

