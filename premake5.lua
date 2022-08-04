workspace "Clip"

    configurations { "Static32", "Static64" }
    
    filter "Static32"
        architecture "x86"
        targetsuffix "32"
    filter "Static64"
        architecture "x86_64"
        targetsuffix "64"
    filter {}
    
    targetdir "build/bin/%{cfg.buildcfg}"
    objdir "build/obj/%{cfg.buildcfg}/%{prj.name}"
    
    project "ClipLib"
        targetname "clip"
        kind "StaticLib"
        language "C++"
        cppdialect "C++17"
        warnings "Off"
        symbols "Off"
        optimize "On"
        files { "clip/clip.cpp", "clip/image.cpp" }
        files {
            "clip/clip.h",
            "clip/clip_common.h",
            "clip/clip_lock_impl.h"
        }
        
        filter "system:Windows"
            files { "clip/clip_win.cpp", "clip/clip_win_wic.h" }
            links { "shlwapi.lib" }
        filter {}
        
        postbuildcommands {
			"{MKDIR} %{cfg.buildtarget.directory}/include",
			"{COPY} clip/clip.h %{cfg.buildtarget.directory}/include/"
		}
