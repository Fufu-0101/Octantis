workspace "Octantis"  
    architecture "x64"
    configurations 
    {
         "Debug", 
         "Release" 
    }

outputdir= "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Octantis"  
    location "Octantis"
    kind "SharedLib"   
    language "C++"   
    
    targetdir ("bin/"..outputdir.."/%{prj.name}")
    objdir ("bin-int/"..outputdir.."/%{prj.name}")

    files 
    { 
        "%{prj.name}/src/**.hpp",
        "%{prj.name}/src/**.cpp" 
    }

    includedirs
    {
        "%{prj.name}/vendor/spdlog/include"-- spdlog
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"
        defines 
        {
            "OCT_PLATFORM_WINDOWS";
            "OCT_BUILD_DLL";
        }  

        postbuildcommands
        {
            ("{copy} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
        }

    filter "configurations:Debug"
        defines "OCT_DEBUG"
        symbols "On"
    filter "configurations:Release"
        defines "OCT_RELEASE"
        symbols "On"
    filter "configurations:Dist"
        defines "OCT_DIST"
        symbols "On"


project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"

    targetdir("bin/"..outputdir.."/%{prj.name}")
    objdir("bin-int/"..outputdir.."/%{prj.name}")

    files 
    { 
        "%{prj.name}/src/**.hpp",
        "%{prj.name}/src/**.cpp" 
    }
    includedirs
    {
        "Octantis/vendor/spdlog/include",-- spdlog
        "Octantis/src"--OctantisEngine
    }
    links
    {
        "Octantis"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"
        defines 
        {
            "OCT_PLATFORM_WINDOWS";
        }  
    filter "configurations:Debug"
        defines "OCT_DEBUG"
        symbols "On"
    filter "configurations:Release"
        defines "OCT_RELEASE"
        symbols "On"
    filter "configurations:Dist"
        defines "OCT_DIST"
        symbols "On"


        