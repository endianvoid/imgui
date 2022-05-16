project "ImGui"
	kind "StaticLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"imconfig.h",
		"imgui.h",
		"imgui.cpp",
		"imgui_draw.cpp",
		"imgui_internal.h",
		"imgui_widgets.cpp",
		"imstb_rectpack.h",
		"imstb_textedit.h",
		"imstb_truetype.h",
		"imgui_demo.cpp"
	}

    configuration "target-emscripten"
        if _OPTIONS['em-debug'] then
            buildoptions{"-fPIC -pthread", "-s NO_DISABLE_EXCEPTION_CATCHING", "--profiling"};
            linkoptions{"-fPIC -pthread", "-s NO_DISABLE_EXCEPTION_CATCHING", "--profiling"};
	    else
            buildoptions{"-fPIC -pthread -O3"};
            linkoptions{"-fPIC -pthread -O3"};
	    end
	
	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "off"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
