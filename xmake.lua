set_languages("cxx20")
set_arch("x64")
add_rules("mode.debug", "mode.release")
add_requires("spdlog 1.10.*", "nlohmann_json 3.11.*", "fmt 9.1.*")

add_defines("RED4EXT_STATIC_LIB")

target("RED4ext.SDK")
    set_default(false)
    set_kind("static")
    set_group("vendor")
    add_files("vendor/RED4ext.SDK/src/**.cpp")
    add_headerfiles("vendor/RED4ext.SDK/include/**.hpp")
    add_includedirs("vendor/RED4ext.SDK/include/", { public = true })

target("cet_mod_manager")
    set_kind("shared")
    set_filename("cet_mod_manager.dll")
    add_packages("spdlog", "nlohmann_json", "fmt")
    add_defines("UNICODE", "WIN32_LEAN_AND_MEAN")
    add_files("src/**.cpp")
    add_headerfiles("src/**.h")
    -- set_pcxxheader("src/pch.h")
    add_includedirs("src/", "src/embeds/")
    add_syslinks("Dwrite", "Shell32")
    add_deps("RED4ext.SDK")
    on_package(function (target)
        import("build")
        build.Package(target)
    end)
    on_install(function ()
        import("build")
        build.Install()
    end)

    after_clean(function ()
        import("build")
        build.Clean()
    end)

option("installpath")
    set_showmenu(true)
    set_description("Set the path to Cyberpunk 2077 root directory.", "e.g.", format("\t-xmake f --installpath=%s", [["C:\Program Files (x86)\Steam\steamapps\common\Cyberpunk 2077"]]))

task("run")
    on_run(function ()
        import("core.project.config")
        config.load()
        local install_path = config.get("installpath")
        print("Launching Cyberpunk 2077 ...")
        os.cd(path.join(install_path, "bin", "x64"))
        os.run("Cyberpunk2077.exe")
    end)
    set_menu { usage = "xmake run", description = "Launch Cyberpunk 2077"}

task("embed")
    on_run(function ()
        import("build")
        build.GenerateEmbeds()
    end)
    set_menu { usage = "xmake embed", description = "Generate embed files"}

task("install-lua")
    on_run(function ()
        import("build")
        build.InstallScripts()
    end)
    set_menu { usage = "xmake install-lua", description = "Only Package and install CET Mod Manager scripts"}