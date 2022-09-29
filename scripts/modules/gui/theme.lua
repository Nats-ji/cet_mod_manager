-- CyberEngineTWeaks Mod Manager is a mod manager for Cyber Engine Tweaks based mods

-- Copyright (C) 2021 Mingming Cui
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.
local CETMM = require("modules/CETMM")
local options = CETMM.GetOptions()

---@class theme_default
local theme_default  =           {
	Text                                =           { 1   , 0.44, 0.4 , 1    },
	TextDisabled                        =           { 0.48, 0.39, 0.40, 1    },
	WindowBg                            =           { 0.06, 0.04, 0.06, 0.9  },
	ChildBg                             =           { 0.06, 0.04, 0.06, 0.9  },
	PopupBg                             =           { 0.06, 0.04, 0.06, 0.9  },
	Border                              =           { 0.3 , 0.07, 0.08, 1    },
	BorderShadow                        =           { 0   , 0   , 0   , 0    },
	FrameBg                             =           { 0.57, 0.17, 0.16, 1    },
	FrameBgHovered                      =           { 0.32, 0.09, 0.11, 1    },
	FrameBgActive                       =           { 0.1 , 0.05, 0.05, 1    },
	FrameBgDisabled                     =           { 0.48, 0.39, 0.40, 1    },
	FrameBgHoveredDisabled              =           { 0.48, 0.39, 0.40, 1    },
	FrameBgActiveDisabled               =           { 0.48, 0.39, 0.40, 1    },
	TitleBg                             =           { 0.06, 0.04, 0.06, 0.9  },
	TitleBgActive                       =           { 0.06, 0.04, 0.06, 0.9  },
	TitleBgCollapsed                    =           { 0.06, 0.04, 0.06, 0.9  },
	MenuBarBg                           =           { 0   , 0   , 0   , 0    },
	ScrollbarBg                         =           { 0.06, 0.04, 0.06, 0    },
	ScrollbarGrab                       =           { 0.57, 0.17, 0.16, 1    },
	ScrollbarGrabHovered                =           { 0.57, 0.17, 0.16, 1    },
	ScrollbarGrabActive                 =           { 0.57, 0.17, 0.16, 1    },
	CheckMark                           =           { 1   , 0.44, 0.4 , 1    },
	CheckMarkTrueDisabled               =           { 0.34, 0.22, 0.24, 1    },
	CheckMarkFalseDisabled              =           { 0.48, 0.39, 0.40, 1    },
	SliderGrab                          =           { 0   , 0   , 0   , 0    },
	SliderGrabActive                    =           { 0   , 0   , 0   , 0    },
	Button                              =           { 0.57, 0.17, 0.16, 1    },
	ButtonHovered                       =           { 0.45, 0.13, 0.14, 1    },
	ButtonActive                        =           { 0.57, 0.17, 0.16, 1    },
	Header                              =           { 0.22, 0.64, 0.69, 0.2  },
	HeaderHovered                       =           { 0.22, 0.64, 0.69, 0.3  },
	HeaderActive                        =           { 0.22, 0.64, 0.69, 0.5  },
	Separator                           =           { 0.3 , 0.07, 0.08, 1    },
	SeparatorHovered                    =           { 0.29, 0.77, 0.79, 1    },
	SeparatorActive                     =           { 0.29, 0.77, 0.79, 1    },
	ResizeGrip                          =           { 0.06, 0.04, 0.06, 1    },
	ResizeGripHovered                   =           { 1   , 0.44, 0.4 , 1    },
	ResizeGripActive                    =           { 1   , 0.44, 0.4 , 1    },
	Tab                                 =           { 0   , 0   , 0   , 0    },
	TabHovered                          =           { 0   , 0   , 0   , 0    },
	TabActive                           =           { 0   , 0   , 0   , 0    },
	TabUnfocused                        =           { 0   , 0   , 0   , 0    },
	TabUnfocusedActive                  =           { 0   , 0   , 0   , 0    },
	DockingPreview                      =           { 0   , 0   , 0   , 0    },
	DockingEmptyBg                      =           { 0   , 0   , 0   , 0    },
	PlotLines                           =           { 0   , 0   , 0   , 0    },
	PlotLinesHovered                    =           { 0   , 0   , 0   , 0    },
	PlotHistogram                       =           { 0   , 0   , 0   , 0    },
	PlotHistogramHovered                =           { 0   , 0   , 0   , 0    },
	TextSelectedBg                      =           { 0   , 0   , 0   , 0    },
	DragDropTarget                      =           { 0   , 0   , 0   , 0    },
	NavHighlight                        =           { 0   , 0   , 0   , 0    },
	NavWindowingHighlight               =           { 0   , 0   , 0   , 0    },
	NavWindowingDimBg                   =           { 0   , 0   , 0   , 0    },
	ModalWindowDimBg                    =           { 0   , 0   , 0   , 0    },
	ModalWindowDarkening                =           { 0   , 0   , 0   , 0    },
	COUNT                               =           { 0   , 0   , 0   , 0    },
	CustomToggleOn                      =           { 0.29, 0.77, 0.79, 1    },
	CustomToggleOnHovered               =           { 0.20, 0.56, 0.59, 1    },
	CustomToggleOnActive                =           { 0.29, 0.77, 0.79, 1    },
	CustomToggleOnText                  =           { 0   , 0   , 0   , 1    },
	CustomToggleOnDisable               =           { 0.04, 0.11, 0.12, 1    },
	CustomToggleOnDisableHovered        =           { 0.05, 0.16, 0.16, 1    },
	CustomToggleOnDisableText           =           { 0.06, 0.18, 0.2 , 1    },
	CustomToggleOff                     =           { 0.57, 0.18, 0.16, 1    },
	CustomToggleOffHovered              =           { 0.45, 0.13, 0.14, 1    },
	CustomToggleOffText                 =           { 1   , 0.44, 0.4 , 1    },
	CustomToggleOffDisable              =           { 0.1 , 0.04, 0.07, 1    },
	CustomToggleOffDisableHovered       =           { 0.16, 0.06, 0.07, 1    },
	CustomToggleOffDisableText          =           { 0.22, 0.07, 0.07, 1    },
	AltText                             =           { 0.29, 0.77, 0.79, 1    },
	Hidden                              =           { 0   , 0   , 0   , 0    },
}

---@class theme_ua_special
local theme_ua_special =           {
	Text                                =           { 0.96, 0.81, 0.00, 1    },
	TextDisabled                        =           { 0.48, 0.39, 0.40, 1    },
	WindowBg                            =           { 0.05, 0.11, 0.18, 0.9  },
	ChildBg                             =           { 0.05, 0.11, 0.18, 0.9  },
	PopupBg                             =           { 0.05, 0.11, 0.18, 0.9  },
	Border                              =           { 0.60, 0.51, 0.00, 1    },
	BorderShadow                        =           { 0   , 0   , 0   , 0    },
	FrameBg                             =           { 0.00, 0.35, 0.71, 1    },
	FrameBgHovered                      =           { 0.00, 0.44, 0.90, 1    },
	FrameBgActive                       =           { 0.00, 0.35, 0.71, 1    },
	FrameBgDisabled                     =           { 0.48, 0.39, 0.40, 1    },
	FrameBgHoveredDisabled              =           { 0.48, 0.39, 0.40, 1    },
	FrameBgActiveDisabled               =           { 0.48, 0.39, 0.40, 1    },
	TitleBg                             =           { 0.05, 0.11, 0.18, 0.9  },
	TitleBgActive                       =           { 0.05, 0.11, 0.18, 0.9  },
	TitleBgCollapsed                    =           { 0.05, 0.11, 0.18, 0.9  },
	MenuBarBg                           =           { 0.05, 0.11, 0.18, 0.9  },
	ScrollbarBg                         =           { 0.06, 0.04, 0.06, 0    },
	ScrollbarGrab                       =           { 0.00, 0.35, 0.71, 1    },
	ScrollbarGrabHovered                =           { 0.00, 0.44, 0.90, 1    },
	ScrollbarGrabActive                 =           { 0.00, 0.35, 0.71, 1    },
	CheckMark                           =           { 0.96, 0.81, 0.00, 1    },
	CheckMarkTrueDisabled               =           { 0.34, 0.22, 0.24, 1    },
	CheckMarkFalseDisabled              =           { 0.48, 0.39, 0.40, 1    },
	SliderGrab                          =           { 0   , 0   , 0   , 0    },
	SliderGrabActive                    =           { 0   , 0   , 0   , 0    },
	Button                              =           { 0.00, 0.35, 0.71, 1    },
	ButtonHovered                       =           { 0.00, 0.44, 0.90, 1    },
	ButtonActive                        =           { 0.00, 0.35, 0.71, 1    },
	Header                              =           { 0.00, 0.21, 0.43, 0.6 },
	HeaderHovered                       =           { 0.00, 0.21, 0.43, 0.9 },
	HeaderActive                        =           { 0.00, 0.21, 0.43, 0.9  },
	Separator                           =           { 0.60, 0.51, 0.00, 0.5  },
	SeparatorHovered                    =           { 0.29, 0.77, 0.79, 1    },
	SeparatorActive                     =           { 0.29, 0.77, 0.79, 1    },
	ResizeGrip                          =           { 0.05, 0.11, 0.18, 1    },
	ResizeGripHovered                   =           { 0.96, 0.81, 0.00, 1    },
	ResizeGripActive                    =           { 0.96, 0.81, 0.00, 1    },
	Tab                                 =           { 0   , 0   , 0   , 0    },
	TabHovered                          =           { 0   , 0   , 0   , 0    },
	TabActive                           =           { 0   , 0   , 0   , 0    },
	TabUnfocused                        =           { 0   , 0   , 0   , 0    },
	TabUnfocusedActive                  =           { 0   , 0   , 0   , 0    },
	DockingPreview                      =           { 0   , 0   , 0   , 0    },
	DockingEmptyBg                      =           { 0   , 0   , 0   , 0    },
	PlotLines                           =           { 0   , 0   , 0   , 0    },
	PlotLinesHovered                    =           { 0   , 0   , 0   , 0    },
	PlotHistogram                       =           { 0   , 0   , 0   , 0    },
	PlotHistogramHovered                =           { 0   , 0   , 0   , 0    },
	TextSelectedBg                      =           { 0   , 0   , 0   , 0    },
	DragDropTarget                      =           { 0   , 0   , 0   , 0    },
	NavHighlight                        =           { 0   , 0   , 0   , 0    },
	NavWindowingHighlight               =           { 0   , 0   , 0   , 0    },
	NavWindowingDimBg                   =           { 0   , 0   , 0   , 0    },
	ModalWindowDimBg                    =           { 0   , 0   , 0   , 0    },
	ModalWindowDarkening                =           { 0   , 0   , 0   , 0    },
	COUNT                               =           { 0   , 0   , 0   , 0    },
	CustomToggleOn                      =           { 0.96, 0.81, 0.00, 1    },
	CustomToggleOnHovered               =           { 0.81, 0.67, 0.00, 1    },
	CustomToggleOnActive                =           { 0.96, 0.81, 0.00, 1    },
	CustomToggleOnText                  =           { 0.00, 0.44, 0.90, 1    },
	CustomToggleOnDisable               =           { 0.04, 0.11, 0.12, 1    },
	CustomToggleOnDisableHovered        =           { 0.05, 0.16, 0.16, 1    },
	CustomToggleOnDisableText           =           { 0.06, 0.18, 0.2 , 1    },
	CustomToggleOff                     =           { 0.57, 0.18, 0.16, 1    },
	CustomToggleOffHovered              =           { 0.45, 0.13, 0.14, 1    },
	CustomToggleOffText                 =           { 0.96, 0.81, 0.00, 1    },
	CustomToggleOffDisable              =           { 0.1 , 0.04, 0.07, 1    },
	CustomToggleOffDisableHovered       =           { 0.16, 0.06, 0.07, 1    },
	CustomToggleOffDisableText          =           { 0.22, 0.07, 0.07, 1    },
	AltText                             =           { 0.00, 0.44, 0.90, 1    },
	Hidden                              =           { 0   , 0   , 0   , 0    },
}


---@class theme:theme_default
local theme = {}

local function load_impl(aTheme)
	for key, value in pairs(aTheme) do
		theme[key] = value
	end
end


function theme.Load()
	if options.m_theme == "ua_special" then
		load_impl(theme_ua_special)
	else
		load_impl(theme_default)
	end
end

theme.Load()

print("theme loadded...")

return theme
