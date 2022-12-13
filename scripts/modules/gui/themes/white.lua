local baseTheme = require("modules/gui/themes/baseTheme")

---@class themeWhite : baseTheme
local themeWhite = baseTheme("white")

themeWhite.states = {}

themeWhite.def_colors = {
	Text                                =           { 1   , 1   , 1   , 1    },
	TextDisabled                        =           { 1   , 1   , 1   , 1    },
	WindowBg                            =           { 1   , 1   , 1   , 1    },
	ChildBg                             =           { 1   , 1   , 1   , 1    },
	PopupBg                             =           { 1   , 1   , 1   , 1    },
	Border                              =           { 1   , 1   , 1   , 1    },
	BorderShadow                        =           { 1   , 1   , 1   , 1    },
	FrameBg                             =           { 1   , 1   , 1   , 1    },
	FrameBgHovered                      =           { 1   , 1   , 1   , 1    },
	FrameBgActive                       =           { 1   , 1   , 1   , 1    },
	FrameBgDisabled                     =           { 1   , 1   , 1   , 1    },
	FrameBgHoveredDisabled              =           { 1   , 1   , 1   , 1    },
	FrameBgActiveDisabled               =           { 1   , 1   , 1   , 1    },
	TitleBg                             =           { 1   , 1   , 1   , 1    },
	TitleBgActive                       =           { 1   , 1   , 1   , 1    },
	TitleBgCollapsed                    =           { 1   , 1   , 1   , 1    },
	MenuBarBg                           =           { 1   , 1   , 1   , 1    },
	ScrollbarBg                         =           { 1   , 1   , 1   , 1    },
	ScrollbarGrab                       =           { 1   , 1   , 1   , 1    },
	ScrollbarGrabHovered                =           { 1   , 1   , 1   , 1    },
	ScrollbarGrabActive                 =           { 1   , 1   , 1   , 1    },
	CheckMark                           =           { 1   , 1   , 1   , 1    },
	CheckMarkTrueDisabled               =           { 1   , 1   , 1   , 1    },
	CheckMarkFalseDisabled              =           { 1   , 1   , 1   , 1    },
	SliderGrab                          =           { 1   , 1   , 1   , 1    },
	SliderGrabActive                    =           { 1   , 1   , 1   , 1    },
	Button                              =           { 1   , 1   , 1   , 1    },
	ButtonHovered                       =           { 1   , 1   , 1   , 1    },
	ButtonActive                        =           { 1   , 1   , 1   , 1    },
	Header                              =           { 1   , 1   , 1   , 1    },
	HeaderHovered                       =           { 1   , 1   , 1   , 1    },
	HeaderActive                        =           { 1   , 1   , 1   , 1    },
	Separator                           =           { 1   , 1   , 1   , 1    },
	SeparatorHovered                    =           { 1   , 1   , 1   , 1    },
	SeparatorActive                     =           { 1   , 1   , 1   , 1    },
	ResizeGrip                          =           { 1   , 1   , 1   , 1    },
	ResizeGripHovered                   =           { 1   , 1   , 1   , 1    },
	ResizeGripActive                    =           { 1   , 1   , 1   , 1    },
	Tab                                 =           { 1   , 1   , 1   , 1    },
	TabHovered                          =           { 1   , 1   , 1   , 1    },
	TabActive                           =           { 1   , 1   , 1   , 1    },
	TabUnfocused                        =           { 1   , 1   , 1   , 1    },
	TabUnfocusedActive                  =           { 1   , 1   , 1   , 1    },
	DockingPreview                      =           { 1   , 1   , 1   , 1    },
	DockingEmptyBg                      =           { 1   , 1   , 1   , 1    },
	PlotLines                           =           { 1   , 1   , 1   , 1    },
	PlotLinesHovered                    =           { 1   , 1   , 1   , 1    },
	PlotHistogram                       =           { 1   , 1   , 1   , 1    },
	PlotHistogramHovered                =           { 1   , 1   , 1   , 1    },
	TextSelectedBg                      =           { 1   , 1   , 1   , 1    },
	DragDropTarget                      =           { 1   , 1   , 1   , 1    },
	NavHighlight                        =           { 1   , 1   , 1   , 1    },
	NavWindowingHighlight               =           { 1   , 1   , 1   , 1    },
	NavWindowingDimBg                   =           { 1   , 1   , 1   , 1    },
	ModalWindowDimBg                    =           { 1   , 1   , 1   , 1    },
	ModalWindowDarkening                =           { 1   , 1   , 1   , 1    },
	COUNT                               =           { 1   , 1   , 1   , 1    },
	CustomToggleOn                      =           { 1   , 1   , 1   , 1    },
	CustomToggleOnHovered               =           { 1   , 1   , 1   , 1    },
	CustomToggleOnActive                =           { 1   , 1   , 1   , 1    },
	CustomToggleOnText                  =           { 1   , 1   , 1   , 1    },
	CustomToggleOnDisable               =           { 1   , 1   , 1   , 1    },
	CustomToggleOnDisableHovered        =           { 1   , 1   , 1   , 1    },
	CustomToggleOnDisableText           =           { 1   , 1   , 1   , 1    },
	CustomToggleOff                     =           { 1   , 1   , 1   , 1    },
	CustomToggleOffHovered              =           { 1   , 1   , 1   , 1    },
	CustomToggleOffDisable              =           { 1   , 1   , 1   , 1    },
	CustomToggleOffDisableHovered       =           { 1   , 1   , 1   , 1    },
	CustomToggleOffDisableText          =           { 1   , 1   , 1   , 1    },
	AltText                             =           { 1   , 1   , 1   , 1    },
	Hidden                              =           { 1   , 1   , 1   , 1    },
}

themeWhite.hvr_colors = {
	Text                                =           { 0.20, 0.20, 0.20, 1    },
	TextDisabled                        =           { 0.48, 0.39, 0.40, 1    },
	WindowBg                            =           { 1   , 1   , 1   , 0.9  },
	ChildBg                             =           { 1   , 1   , 1   , 0.9  },
	PopupBg                             =           { 1   , 1   , 1   , 0.9  },
	Border                              =           { 0.5 , 0.5 , 0.5 , 1    },
	BorderShadow                        =           { 0   , 0   , 0   , 0    },
	FrameBg                             =           { 1   , 1   , 1   , 1    },
	FrameBgHovered                      =           { 0.80, 0.80, 0.80, 1    },
	FrameBgActive                       =           { 1   , 1   , 1   , 1    },
	FrameBgDisabled                     =           { 0.48, 0.39, 0.40, 1    },
	FrameBgHoveredDisabled              =           { 0.48, 0.39, 0.40, 1    },
	FrameBgActiveDisabled               =           { 0.48, 0.39, 0.40, 1    },
	TitleBg                             =           { 1   , 1   , 1   , 0.9  },
	TitleBgActive                       =           { 1   , 1   , 1   , 0.9  },
	TitleBgCollapsed                    =           { 1   , 1   , 1   , 0.9  },
	MenuBarBg                           =           { 1   , 1   , 1   , 0.9  },
	ScrollbarBg                         =           { 0.06, 0.04, 0.06, 0    },
	ScrollbarGrab                       =           { 1   , 1   , 1   , 1    },
	ScrollbarGrabHovered                =           { 0.80, 0.80, 0.80, 1    },
	ScrollbarGrabActive                 =           { 1   , 1   , 1   , 1    },
	CheckMark                           =           { 0.20, 0.20, 0.20, 1    },
	CheckMarkTrueDisabled               =           { 0.20, 0.20, 0.20, 1    },
	CheckMarkFalseDisabled              =           { 0.20, 0.20, 0.20, 1    },
	SliderGrab                          =           { 0   , 0   , 0   , 0    },
	SliderGrabActive                    =           { 0   , 0   , 0   , 0    },
	Button                              =           { 1   , 1   , 1   , 1    },
	ButtonHovered                       =           { 0.80, 0.80, 0.80, 1    },
	ButtonActive                        =           { 1   , 1   , 1   , 1    },
	Header                              =           { 0.80, 0.80, 0.80, 0.6  },
	HeaderHovered                       =           { 0.80, 0.80, 0.80, 0.9  },
	HeaderActive                        =           { 0.80, 0.80, 0.80, 0.9  },
	Separator                           =           { 0.5 , 0.5 , 0.5 , 1    },
	SeparatorHovered                    =           { 0.5 , 0.5 , 0.5 , 1    },
	SeparatorActive                     =           { 0.5 , 0.5 , 0.5 , 1    },
	ResizeGrip                          =           { 0.80, 0.80, 0.80, 1    },
	ResizeGripHovered                   =           { 0.70, 0.70, 0.70, 1    },
	ResizeGripActive                    =           { 0.70, 0.70, 0.70, 1    },
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
	CustomToggleOn                      =           { 0.80, 0.80, 0.80, 1    },
	CustomToggleOnHovered               =           { 0.70, 0.70, 0.70, 1    },
	CustomToggleOnActive                =           { 0.80, 0.80, 0.80, 1    },
	CustomToggleOnText                  =           { 0.20, 0.20, 0.20, 1    },
	CustomToggleOnDisable               =           { 0.04, 0.11, 0.12, 1    },
	CustomToggleOnDisableHovered        =           { 0.05, 0.16, 0.16, 1    },
	CustomToggleOnDisableText           =           { 0.06, 0.18, 0.2 , 1    },
	CustomToggleOff                     =           { 0.57, 0.18, 0.16, 1    },
	CustomToggleOffHovered              =           { 0.45, 0.13, 0.14, 1    },
	CustomToggleOffDisable              =           { 0.1 , 0.04, 0.07, 1    },
	CustomToggleOffDisableHovered       =           { 0.16, 0.06, 0.07, 1    },
	CustomToggleOffDisableText          =           { 0.22, 0.07, 0.07, 1    },
	AltText                             =           { 0.80, 0.80, 0.80, 1    },
	Hidden                              =           { 0   , 0   , 0   , 0    },
}

---@param self themeWhite
---@param aGuiColor string
---@return float[]
function themeWhite.GetStyleColor(self, aGuiColor)
	for window, hovering in pairs(self.states) do
		if hovering then
			return self.hvr_colors[aGuiColor]
		end
	end
    return self.def_colors[aGuiColor]
end

---@param aWindow string
function themeWhite.GetHoverState(self, aWindow)
	self.states[aWindow] = ImGui.IsWindowHovered(bit32.bor(ImGuiHoveredFlags.RootAndChildWindows, ImGuiHoveredFlags.AllowWhenBlockedByActiveItem, ImGuiHoveredFlags.AllowWhenBlockedByPopup))
end

return themeWhite