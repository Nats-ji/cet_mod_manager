-- Copyright 2021 Mingming Cui
--
-- This file is part of CyberEngineTWeaks Mod Manager.
--
-- CyberEngineTWeaks Mod Manager is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- CyberEngineTWeaks Mod Manager is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Foobar.  If not, see <https://www.gnu.org/licenses/>.


rootPath = {
	Require = "./plugins/cyber_engine_tweaks/mods/cet_mod_manager/",
	ModsIO = "./",
	IO = "./cet_mod_manager/",
	Execute = ".\\"
}

i18n = require(rootPath.Require.."i18n")

function scan_mods()
	local i = 0
	local mod_names = {}
	local dir_list = io.popen("dir "..rootPath.Execute.." /b /ad")
	for dir in dir_list:lines() do
		i = i + 1
		mod_names[i] = dir
	end
	dir_list:close()
	return mod_names
end

function scan_dofiles()
	local dofile_names = {}
	local dofile_list = io.popen("dir "..rootPath.Execute.."cet_mod_manager\\dofiles\\ /b /a-d")
	for lua in dofile_list:lines() do
		if lua:match("(.+)%.lua$") then
			table.insert(dofile_names, lua)
		end
	end
	dofile_list:close()
	return dofile_names
end

function check_mod_state(mod)
	local modpath = rootPath.ModsIO..mod.."/init.lua"
	local disabled_modpath = rootPath.ModsIO..mod.."/init.lua_disabled"
	if file_exists(modpath) then
		return true
	elseif not file_exists(modpath) and file_exists(disabled_modpath) then
		return false
	else
		return nil
	end
end

function get_mods_data()
	local mods_data = {}
	local modList = scan_mods()
	for i in pairs(modList) do
		local mod_entry = {}
		mod_entry.name = modList[i]
		mod_entry.state = check_mod_state(modList[i])
		table.insert(mods_data, mod_entry)
	end
	return mods_data
end

function draw_mod_list(mods_data)
	for i in pairs(mods_data) do
		ImGui.Spacing()
		ImGui.PushID(i)
		if mods_data[i].name == "cet_mod_manager" then
			pushstylecolor(ImGuiCol.Text, theme.TextDisabled)
			pushstylecolor(ImGuiCol.FrameBg, theme.FrameBgDisabled)
			pushstylecolor(ImGuiCol.FrameBgHovered, theme.FrameBgHoveredDisabled)
			pushstylecolor(ImGuiCol.FrameBgActive, theme.FrameBgActiveDisabled)
			pushstylecolor(ImGuiCol.CheckMark, theme.CheckMarkTrueDisabled)
			ImGui.Checkbox(i18n("window_title"), true)
			ImGui.PopStyleColor(5)
		elseif mods_data[i].state == true then
			mods_data[i].state, mods_data[i].pressed = ImGui.Checkbox(modNameConvert(mods_data[i].name), mods_data[i].state)
		elseif mods_data[i].state == false then
			mods_data[i].state, mods_data[i].pressed = ImGui.Checkbox(modNameConvert(mods_data[i].name), mods_data[i].state)
		else
			pushstylecolor(ImGuiCol.Text, theme.TextDisabled)
			pushstylecolor(ImGuiCol.FrameBg, theme.FrameBgDisabled)
			pushstylecolor(ImGuiCol.FrameBgHovered, theme.FrameBgHoveredDisabled)
			pushstylecolor(ImGuiCol.FrameBgActive, theme.FrameBgActiveDisabled)
			pushstylecolor(ImGuiCol.CheckMark, theme.CheckMarkFalseDisabled)
			ImGui.Checkbox(modNameConvert(mods_data[i].name), false)
			ImGui.PopStyleColor(5)
		end
		ImGui.PopID()
	end
end

function draw_dofile_list(dofile_names)
	local btnRun = {}
	for i in pairs(dofile_names) do
		ImGui.Spacing()
		ImGui.PushID(i)
		pushstylecolor(ImGuiCol.Text, theme.CustomToggleOnText)
		pushstylecolor(ImGuiCol.Button, theme.CustomToggleOn)
		pushstylecolor(ImGuiCol.ButtonHovered, theme.CustomToggleOnHovered)
		pushstylecolor(ImGuiCol.ButtonActive, theme.CustomToggleOn)
		btnRun[i] = ImGui.Button(i18n("button_dofile_run"), 40*fontscale, 20*fontscale)
		ImGui.PopStyleColor(4)
		ImGui.PopID()
		ImGui.SameLine()
		ImGui.PushID(i)
		pushstylecolor(ImGuiCol.Text, theme.Separator)
		ImGui.Text(modNameConvert(dofile_names[i]:match("(.+)%.lua$")))
		ImGui.PopStyleColor(1)
		ImGui.PopID()
	end
	return btnRun
end

function toggleMod(mod, enable)
	if enable then
		local ok = os.rename(rootPath.ModsIO..mod.."/init.lua_disabled", rootPath.ModsIO..mod.."/init.lua")
		if ok then
			print(i18n("console_msg_mod_enable", { modname = modNameConvert(mod) }))
		else
			print(i18n("console_msg_mod_enable_error", { modname = modNameConvert(mod) }))
		end
	elseif not enable then
		local ok = os.rename(rootPath.ModsIO..mod.."/init.lua", rootPath.ModsIO..mod.."/init.lua_disabled")
		if ok then
			print(i18n("console_msg_mod_disable", { modname = modNameConvert(mod) }))
		else
			print(i18n("console_msg_mod_enable_error", { modname = modNameConvert(mod) }))
		end
	end
end


function print_table(tble)
	for i in pairs(tble) do
		if type(tble[i])=="table" then
			for t in pairs(tble[i]) do
				print(tble[i][t])
			end
		else
			print(tble[i])
		end
	end
end

function pushstylecolor(style, color)
	ImGui.PushStyleColor(style, color[1], color[2], color[3], color[4])
end

function setThemeBegin()
	pushstylecolor(ImGuiCol.TitleBg,				theme.TitleBg)
	pushstylecolor(ImGuiCol.TitleBgCollapsed,		theme.TitleBgCollapsed)
	pushstylecolor(ImGuiCol.TitleBgActive,			theme.TitleBgActive)
	pushstylecolor(ImGuiCol.Border,					theme.Border)
	pushstylecolor(ImGuiCol.WindowBg,				theme.WindowBg)
	pushstylecolor(ImGuiCol.ScrollbarBg,			theme.ScrollbarBg)
	pushstylecolor(ImGuiCol.ScrollbarGrab,			theme.ScrollbarGrab)
	pushstylecolor(ImGuiCol.ScrollbarGrabHovered,	theme.ScrollbarGrabHovered)
	pushstylecolor(ImGuiCol.ScrollbarGrabActive,	theme.ScrollbarGrabActive)
	pushstylecolor(ImGuiCol.ResizeGrip, 			theme.ResizeGrip)
	pushstylecolor(ImGuiCol.ResizeGripHovered, 		theme.ResizeGripHovered)
	pushstylecolor(ImGuiCol.ResizeGripActive,		theme.ResizeGripActive)
	pushstylecolor(ImGuiCol.Text,					theme.Text)
	pushstylecolor(ImGuiCol.Header,					theme.Header)
	pushstylecolor(ImGuiCol.HeaderHovered,			theme.HeaderHovered)
	pushstylecolor(ImGuiCol.HeaderActive,			theme.HeaderActive)
	pushstylecolor(ImGuiCol.CheckMark,				theme.CheckMark)
	pushstylecolor(ImGuiCol.FrameBg,				theme.FrameBg)
	pushstylecolor(ImGuiCol.FrameBgHovered,			theme.FrameBgHovered)
	pushstylecolor(ImGuiCol.FrameBgActive,			theme.FrameBgActive)
	pushstylecolor(ImGuiCol.Button,					theme.Button)
	pushstylecolor(ImGuiCol.ButtonHovered,			theme.ButtonHovered)
	pushstylecolor(ImGuiCol.ButtonActive,			theme.ButtonActive)
	pushstylecolor(ImGuiCol.Separator,				theme.Separator)
	ImGui.PushStyleVar(ImGuiStyleVar.WindowPadding, 6*fontscale, 6*fontscale)
	ImGui.PushStyleVar(ImGuiStyleVar.WindowRounding, 0)
end

function setThemeEnd()
	ImGui.PopStyleVar(2)
	ImGui.PopStyleColor(24)
end

function modNameConvert(name)
	if string.find(name, "_") then
		return string.gsub(" "..string.gsub(name, "_" , " "), "%W%l", string.upper):sub(2)
	elseif string.find(name, "-") then
		return string.gsub(" "..string.gsub(name, "-" , " "), "%W%l", string.upper):sub(2)
	else
		return string.gsub(" "..name, "%W%l", string.upper):sub(2)
	end
end

function btnToggle(onname, offname, state, width, height)
	if onname ~= nil and offname ~= nil and state ~= nil then
		if type(width) == "number" and type(height) == "number" then
			if state then
				return ImGui.Button(onname, width, height)
			else
				return ImGui.Button(offname, width, height)
			end
		else
			if state then
				return ImGui.Button(onname)
			else
				return ImGui.Button(offname)
			end
		end
	end
end

function btnToggleStyleBegin(state)
	if state then
		pushstylecolor(ImGuiCol.Button, theme.CustomToggleOn)
		pushstylecolor(ImGuiCol.ButtonHovered, theme.CustomToggleOnHovered)
		pushstylecolor(ImGuiCol.Text, theme.CustomToggleOnText)
	else
		pushstylecolor(ImGuiCol.Button, theme.Button)
		pushstylecolor(ImGuiCol.ButtonHovered, theme.ButtonHovered)
		pushstylecolor(ImGuiCol.Text, theme.Text)
	end
end

function btnToggleStyleEnd()
	ImGui.PopStyleColor(3)
end

function readRootPath()
  if file_exists("./bin/x64/plugins/cyber_engine_tweaks/mods/cet_mod_manager/init.lua") then
    rootPath.ModsIO = "./bin/x64/plugins/cyber_engine_tweaks/mods/"
    rootPath.IO = "./bin/x64/plugins/cyber_engine_tweaks/mods/cet_mod_manager/"
    rootPath.Execute = ".\\bin\\x64\\plugins\\cyber_engine_tweaks\\mods\\"
  elseif file_exists("./plugins/cyber_engine_tweaks/mods/cet_mod_manager/init.lua") then
    rootPath.ModsIO = "./plugins/cyber_engine_tweaks/mods/"
    rootPath.IO = "./plugins/cyber_engine_tweaks/mods/cet_mod_manager/"
    rootPath.Execute = ".\\plugins\\cyber_engine_tweaks\\mods\\"
  elseif  file_exists("./cet_mod_manager/init.lua") then
    rootPath.ModsIO = "./"
    rootPath.IO = "./cet_mod_manager/"
    rootPath.Execute = ".\\"
  end
end

function file_exists(name)
   local f=io.open(name,"r")
   if (f~=nil) then io.close(f) return true else return false end
end

function saveConfig(name, config)
	local file = io.open(name, "w")
	io.output(file)
	local jconfig = json.encode(config)
	io.write(jconfig)
	file:close()
end

function loadConfig(name)
	if file_exists(name) then
		local file = io.open(name, "r")
		io.input(file)
		local config = json.decode(io.read("*a"))
		file:close()
			if type(config.autoscan) ~= "boolean" then
				config.autoscan = false
			end
			if config.lang ~= "en_us" and config.lang ~= "zh_cn" and config.lang ~= "zh_tw" and config.lang ~= "ja_jp" then
				config.lang = "en_us"
			end
		saveConfig(name, config)
		return config
	else
		config = { autoscan = false, lang = "en_us" }
		saveConfig(name, config)
		return config
	end
end

function applyConfig(config)
	if config.autoscan then
		mods_data = get_mods_data()
		dofile_names = scan_dofiles()
		scanned = true
	end
	i18n.loadFile(rootPath.IO.."lang/"..config.lang..".lua")
	i18n.setLocale(config.lang)
end

function setLang(lang)
	i18n.loadFile(rootPath.IO.."lang/"..lang..".lua")
	i18n.setLocale(lang)
	config.lang = lang
	saveConfig(rootPath.IO.."config.json", config)
end

config = loadConfig(rootPath.IO.."config.json")

applyConfig(config)

registerForEvent("onInit", function()
	readRootPath()
	draw = true
	scanned = false
	showHelp = false
	showDofileMods = false
	wWidth, wHeight = GetDisplayResolution()
	theme = require(rootPath.Require.."theme")
	fontscale = ImGui.GetFontSize()/13
	ry2 = 0
	print(i18n("console_msg_loaded1"))
	print(i18n("console_msg_loaded2"))
	print(i18n("console_msg_loaded3"))
	print(i18n("console_msg_loaded4"))
	print(i18n("console_msg_loaded5"))
end)

registerHotkey("mod_manager_interface", i18n("hotkey_manager"), function()
	draw = not draw
	showDofileMods = false
end)

registerHotkey("dofile_interface", i18n("hotkey_dofiles"), function()
	draw = not draw
	showDofileMods = true
end)

registerForEvent("onUpdate", function()
	if btnScan then
		mods_data = get_mods_data()
		dofile_names = scan_dofiles()
		scanned = true
		print(i18n("console_msg_scan"))
	end
	if btnOpenMods then
		os.execute("start explorer "..rootPath.Execute)
	end
	if btnOpenDofiles then
		os.execute("start explorer "..rootPath.Execute.."cet_mod_manager\\dofiles")
	end
	if btnAutoScan then
		config.autoscan = not config.autoscan
		saveConfig(rootPath.IO.."config.json", config)
		if config.autoscan then print(i18n("console_msg_autoscan_on")) else print(i18n("console_msg_autoscan_off")) end
	end
	if btnDofiles then
		showDofileMods = not showDofileMods
	end
	if btnHelp then
		showHelp = not showHelp
	end
	if btnRun ~= nil then
		for i in pairs(btnRun) do
			if btnRun[i] then
				print(i18n("console_msg_dofile_run", { dofilename = modNameConvert(dofile_names[i]:match("(.+)%.lua$")) }))
				dofile(rootPath.IO.."dofiles/"..dofile_names[i])
				print(i18n("console_msg_dofile_done"))
			end
		end
	end
	if scanned then
		for i in pairs(mods_data) do
			if mods_data[i].pressed then
				toggleMod(mods_data[i].name, mods_data[i].state)
			end
		end
	end
	if selLangEN then
		setLang("en_us")
		selLangEN = false
	end
	if selLangZHCN then
		setLang("zh_cn")
		selLangZHCN = false
	end
	if selLangZHTW then
		setLang("zh_tw")
		selLangZHTW = false
	end
	if selLangJP then
		setLang("ja_jp")
		selLangJP = false
	end
end)
registerForEvent("onDraw", function()
    if draw then
		setThemeBegin()
		draw = ImGui.Begin(i18n("window_title"), true , ImGuiWindowFlags.NoResize)
		ImGui.SetWindowPos(wWidth/2-210*fontscale, wHeight/2-320*fontscale, ImGuiCond.FirstUseEver)
		if 600*fontscale > wHeight*0.8 then
			ImGui.SetWindowSize(420*fontscale, wHeight*0.8, ImGuiCond.Always)
		else
			ImGui.SetWindowSize(420*fontscale, 640*fontscale, ImGuiCond.Always)
		end
		ImGui.BeginGroup()
		ImGui.Spacing()
		local cursorbtnX, cursorbtnY = ImGui.GetCursorPos()
		local cabtnx, cabtny = ImGui.GetContentRegionAvail()
		btnToggleStyleBegin(showDofileMods)
		btnDofiles = ImGui.Button(i18n("button_dofiles"), ImGui.CalcTextSize(i18n("button_dofiles"))+20*fontscale, 25*fontscale)
		btnToggleStyleEnd()
		ImGui.SetCursorPos(cursorbtnX + cabtnx - 65*fontscale - (ImGui.CalcTextSize(i18n("button_autoscan_off"))+20*fontscale) - (ImGui.CalcTextSize(i18n("button_scan"))+20*fontscale), cursorbtnY)
		btnScan = ImGui.Button(i18n("button_scan"), ImGui.CalcTextSize(i18n("button_scan"))+20*fontscale, 25*fontscale)
		ImGui.SetCursorPos(cursorbtnX + cabtnx - 60*fontscale - (ImGui.CalcTextSize(i18n("button_autoscan_off"))+20*fontscale), cursorbtnY)
		btnToggleStyleBegin(config.autoscan)
		btnAutoScan = btnToggle(i18n("button_autoscan_on"), i18n("button_autoscan_off"), config.autoscan, ImGui.CalcTextSize(i18n("button_autoscan_off"))+20*fontscale, 25*fontscale)
		btnToggleStyleEnd()
		ImGui.SetCursorPos(cursorbtnX + cabtnx - 55*fontscale, cursorbtnY)
		if ImGui.Button("A", 25*fontscale, 25*fontscale) then
			ImGui.OpenPopup("Select Language")
		end
		if ImGui.IsItemHovered() then
			ImGui.SetTooltip(i18n("tooltip_btn_language"))
		end
		ImGui.SetCursorPos(cursorbtnX + cabtnx - 25*fontscale, cursorbtnY)
		btnToggleStyleBegin(showHelp)
		btnHelp = ImGui.Button("?", 25*fontscale, 25*fontscale)
		btnToggleStyleEnd()
		if ImGui.IsItemHovered() then
			ImGui.SetTooltip(i18n("tooltip_btn_help"))
		end
		ImGui.Spacing()
		ImGui.EndGroup()
		if ImGui.BeginPopup("Select Language", ImGuiWindowFlags.NoMove) then
			ImGui.Spacing()
      ImGui.Text(i18n("text_select_lang"))
			ImGui.Spacing()
			ImGui.PushStyleVar(ImGuiStyleVar.SelectableTextAlign, 0, 0.5)
      selLangEN = ImGui.Selectable("English", false, ImGuiSelectableFlags.None, 0, 22*fontscale)
			selLangZHCN = ImGui.Selectable("简体中文 (Simplified Chinese)", false, ImGuiSelectableFlags.None, 0, 22*fontscale)
			selLangZHTW = ImGui.Selectable("正體中文 (Traditional Chinese)", false, ImGuiSelectableFlags.None, 0, 22*fontscale)
			selLangJP = ImGui.Selectable("日本語 (Japanese)", false, ImGuiSelectableFlags.None, 0, 22*fontscale)
			ImGui.PopStyleVar(1)
      ImGui.EndPopup()
    end

		cax, cay = ImGui.GetContentRegionAvail()
		ImGui.BeginChild("Mod List", cax, cay-ry2-5)

		if showHelp then
			if not showDofileMods then
				pushstylecolor(ImGuiCol.Text, theme.Separator)
				ImGui.TextWrapped(i18n("text_help_manager_1"))
				ImGui.Spacing()
				ImGui.TextWrapped(i18n("text_help_manager_2"))
				ImGui.Spacing()
				ImGui.TextWrapped(i18n("text_help_manager_3"))
				ImGui.Spacing()
				ImGui.TextWrapped(i18n("text_help_manager_4"))
				ImGui.Spacing()
				ImGui.TextWrapped(i18n("text_help_manager_5"))
				ImGui.PopStyleColor(1)
			else
				ImGui.TextWrapped(i18n("text_help_dofiles_1"))
				ImGui.Spacing()
				ImGui.TextWrapped(i18n("text_help_dofiles_2"))
				ImGui.Spacing()
				ImGui.TextWrapped(i18n("text_help_dofiles_3"))
				ImGui.Spacing()
				ImGui.TextWrapped(i18n("text_help_dofiles_4"))
				ImGui.Spacing()
				ImGui.TextWrapped(i18n("text_help_dofiles_5"))
			end
			ImGui.Spacing()
		end

		if showLang then
				pushstylecolor(ImGuiCol.Text, theme.Separator)
				ImGui.TextWrapped(i18n("text_help_manager_1"))
				ImGui.Spacing()
				ImGui.TextWrapped(i18n("text_help_manager_2"))
				ImGui.Spacing()
				ImGui.TextWrapped(i18n("text_help_manager_3"))
				ImGui.Spacing()
				ImGui.TextWrapped(i18n("text_help_manager_4"))
				ImGui.Spacing()
				ImGui.TextWrapped(i18n("text_help_manager_5"))
				ImGui.PopStyleColor(1)
			ImGui.Spacing()
		end

		if scanned then
			if showDofileMods then
				if dofile_names[1] ~= nil then
					btnRun = draw_dofile_list(dofile_names)
				else
					ImGui.Spacing()
					ImGui.Text(i18n("text_no_dofiles"))
				end
			else
				draw_mod_list(mods_data)
			end
		else
			ImGui.Spacing()
			if showDofileMods then
				pushstylecolor(ImGuiCol.Text, theme.Separator)
				ImGui.Text(i18n("text_please_scan"))
				ImGui.PopStyleColor(1)
			else
				ImGui.Text(i18n("text_please_scan"))
			end
		end

		ImGui.EndChild()
		ImGui.BeginGroup()
		ImGui.Spacing()
		btnOpenMods = ImGui.Button(i18n("button_mods_folder"), ImGui.CalcTextSize(i18n("button_mods_folder"))+20*fontscale, 25*fontscale)
		ImGui.SameLine()
		btnOpenDofiles = ImGui.Button(i18n("button_dofile_folder"), ImGui.CalcTextSize(i18n("button_dofile_folder"))+20*fontscale, 25*fontscale)
		ImGui.EndGroup()
		rx2, ry2 = ImGui.GetItemRectSize()
		ImGui.End()
		setThemeEnd()
    end
end)
