-------------------------------
--  "Zenburn" awesome theme  --
--    By Adrian C. (anrxc)   --
-------------------------------

-- Alternative icon sets and widget icons:
--  * http://awesome.naquadah.org/wiki/Nice_Icons

-- {{{ Main
theme = {}
theme.wallpaper = "~/.config/awesome/themes/apporc/bg.jpg"
-- }}}

-- {{{ Styles
theme.font      = "ubuntu mono 14"

-- {{{ Colors
theme.fg_normal  = "#DCDCCC"
theme.fg_focus   = "#F0DFAF"
theme.fg_urgent  = "#CC9393"
theme.bg_normal  = "#3F3F3F"
theme.bg_focus   = "#1E2320"
theme.bg_urgent  = "#3F3F3F"
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.border_width  = 2
theme.border_normal = "#3F3F3F"
theme.border_focus  = "#6F6F6F"
theme.border_marked = "#CC9393"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#3F3F3F"
theme.titlebar_bg_normal = "#3F3F3F"
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = 18
theme.menu_width  = 100
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = "~/.config/awesome/themes/apporc/taglist/squarefz.png"
theme.taglist_squares_unsel = "~/.config/awesome/themes/apporc/taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = "~/.config/awesome/themes/apporc/angel_of_death.png"
theme.menu_submenu_icon      = "~/.config/awesome/themes/default/submenu.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = "~/.config/awesome/themes/apporc/layouts/tile.png"
theme.layout_tileleft   = "~/.config/awesome/themes/apporc/layouts/tileleft.png"
theme.layout_tilebottom = "~/.config/awesome/themes/apporc/layouts/tilebottom.png"
theme.layout_tiletop    = "~/.config/awesome/themes/apporc/layouts/tiletop.png"
theme.layout_fairv      = "~/.config/awesome/themes/apporc/layouts/fairv.png"
theme.layout_fairh      = "~/.config/awesome/themes/apporc/layouts/fairh.png"
theme.layout_spiral     = "~/.config/awesome/themes/apporc/layouts/spiral.png"
theme.layout_dwindle    = "~/.config/awesome/themes/apporc/layouts/dwindle.png"
theme.layout_max        = "~/.config/awesome/themes/apporc/layouts/max.png"
theme.layout_fullscreen = "~/.config/awesome/themes/apporc/layouts/fullscreen.png"
theme.layout_magnifier  = "~/.config/awesome/themes/apporc/layouts/magnifier.png"
theme.layout_floating   = "~/.config/awesome/themes/apporc/layouts/floating.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = "~/.config/awesome/themes/apporc/titlebar/close_focus.png"
theme.titlebar_close_button_normal = "~/.config/awesome/themes/apporc/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = "~/.config/awesome/themes/apporc/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = "~/.config/awesome/themes/apporc/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = "~/.config/awesome/themes/apporc/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = "~/.config/awesome/themes/apporc/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = "~/.config/awesome/themes/apporc/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = "~/.config/awesome/themes/apporc/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = "~/.config/awesome/themes/apporc/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = "~/.config/awesome/themes/apporc/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = "~/.config/awesome/themes/apporc/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = "~/.config/awesome/themes/apporc/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = "~/.config/awesome/themes/apporc/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = "~/.config/awesome/themes/apporc/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = "~/.config/awesome/themes/apporc/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = "~/.config/awesome/themes/apporc/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = "~/.config/awesome/themes/apporc/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = "~/.config/awesome/themes/apporc/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

return theme
