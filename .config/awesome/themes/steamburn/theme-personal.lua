--[[

     Steamburn Awesome WM theme 3.0
     github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.zenburn_dir                               = require("awful.util").get_themes_dir() .. "zenburn"
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/steamburn"
theme.wallpaper                                 = "home/zharfanfw/Downloads/Wallpaper/wall2.png"

theme.font                                      = "Hack Nerd Fotn 12"
theme.fg_normal                                 = "#bbbbbb"
theme.fg_focus                                  = "#ffffff"
theme.fg_urgent                                 = "#ffffff"

theme.bg_normal                                 = "#121212"
theme.bg_focus                                  = "#1a1a1a"
theme.bg_urgent                                 = "#ff5555"

theme.border_width                              = dpi(3.5)
theme.border_normal                             = "#333333"
theme.border_focus                              = "#E2A528"
theme.border_marked                             = "#ff0000"

theme.taglist_fg_focus                          = "#d88166"
theme.tasklist_bg_focus                         = "#140c0b"
theme.tasklist_fg_focus                         = "#d88166"
-- theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
-- theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"

theme.menu_height                               = dpi(16)
theme.menu_width                                = dpi(140)

theme.awesome_icon                              = theme.dir .."/icons/awesome.png"
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"

theme.layout_txt_tile                           = "[t]"
theme.layout_txt_tileleft                       = "[l]"
theme.layout_txt_tilebottom                     = "[b]"
theme.layout_txt_tiletop                        = "[tt]"
theme.layout_txt_fairv                          = "[fv]"
theme.layout_txt_fairh                          = "[fh]"
theme.layout_txt_spiral                         = "[s]"
theme.layout_txt_dwindle                        = "[d]"
theme.layout_txt_max                            = "[m]"
theme.layout_txt_fullscreen                     = "[F]"
theme.layout_txt_magnifier                      = "[M]"
theme.layout_txt_floating                       = "[|]"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true

theme.useless_gap                               = dpi(5)

theme.titlebar_close_button_normal              = theme.zenburn_dir.."/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.zenburn_dir.."/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal           = theme.zenburn_dir.."/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme.zenburn_dir.."/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive     = theme.zenburn_dir.."/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.zenburn_dir.."/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.zenburn_dir.."/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.zenburn_dir.."/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive    = theme.zenburn_dir.."/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.zenburn_dir.."/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.zenburn_dir.."/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.zenburn_dir.."/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive  = theme.zenburn_dir.."/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme.zenburn_dir.."/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme.zenburn_dir.."/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.zenburn_dir.."/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.zenburn_dir.."/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.zenburn_dir.."/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.zenburn_dir.."/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.zenburn_dir.."/titlebar/maximized_focus_active.png"

-- lain related
theme.layout_txt_termfair                       = "[termfair]"
theme.layout_txt_centerfair                     = "[centerfair]"

local markup = lain.util.markup
local gray   = "#94928F"

-- Textclock
local myclock = wibox.widget.textclock(" %H:%M ")
myclock.font = "Hack Nerd Font 12"


-- Date
local mydate = wibox.widget.textclock(" %a, %d %B %Y ")
mydate.font = "Hack Nerd Font 11.5"


-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { mytextclock },
    notification_preset = {
        font = "Terminus 11",
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})

-- Mail IMAP check
--[[ to be set before use
theme.mail = lain.widget.imap({
    timeout  = 180,
    server   = "server",
    mail     = "mail",
    password = "keyring get mail",
    settings = function()
        mail  = ""
        count = ""

        if mailcount > 0 then
            mail = "Mail "
            count = mailcount .. " "
        end

        widget:set_markup(markup(gray, mail) .. count)
    end
})
--]]

-- MPD
theme.mpd = lain.widget.mpd({
    settings = function()
        artist = mpd_now.artist .. " "
        title  = mpd_now.title  .. " "

        if mpd_now.state == "pause" then
            artist = "mpd "
            title  = "paused "
        elseif mpd_now.state == "stop" then
            artist = ""
            title  = ""
        end

        widget:set_markup(markup.font(theme.font, markup(gray, artist) .. title))
    end
})


-- /home fs
--[[ commented because it needs Gio/Glib >= 2.54
theme.fs = lain.widget.fs({
    partition = "/home",
    notification_preset = { fg = theme.fg_normal, bg = theme.bg_normal, font = "Terminus 10.5" },
})
--]]

-- Battery
local bat = lain.widget.bat({
    settings = function()
        local perc = bat_now.perc
        if bat_now.ac_status == 1 then perc = perc .. " Plug" end
        widget:set_markup(markup.font(theme.font, markup(gray, " Bat ") .. perc .. " "))
    end
})


-- Net checker
local net = lain.widget.net({
    settings = function()
        if net_now.state == "up" then net_state = "On"
        else net_state = "Off" end
        widget:set_markup(markup.font(theme.font, markup(gray, " Net ") .. net_state .. " "))
    end
})


-- ALSA volume
theme.volume = lain.widget.alsa({
    settings = function()
        header = " Vol "
        vlevel  = volume_now.level

        if volume_now.status == "off" then
            vlevel = vlevel .. "M "
        else
            vlevel = vlevel .. " "
        end

        widget:set_markup(markup.font(theme.font, markup(gray, header) .. vlevel))
    end
})


-- Separators
local spr = wibox.widget {
    {
        widget = wibox.widget.textbox,
        text = "|",
        font = "JetBrainsMono Nerd Font 15",
    },
    widget = wibox.container.background,
    fg = "#E2A528"
}



-- Gatau apa
local function update_txt_layoutbox(s)
    -- Writes a string representation of the current layout in a textbox widget
    local txt_l = theme["layout_txt_" .. awful.layout.getname(awful.layout.get(s))] or ""
    s.mytxtlayoutbox:set_text(txt_l)
end


-- Power Menu
local power_button = wibox.widget {
    widget = wibox.widget.textbox,
    font = "JetBrainsMono Nerd Font 14",
    markup = "⏻ ",  -- Power icon
    align = "center",
    valign = "center"
}

-- Event klik (klik kiri untuk buka power menu)
power_button:buttons(gears.table.join(
    awful.button({}, 1, function()  -- 1 itu artinya klik kiri
        awful.spawn("/home/zharfanfw/.config/rofi/powermenu/type-6/powermenu.sh")
    end)
))


-- Function Screen
function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Textual layoutbox
    -- s.mytxtlayoutbox = wibox.widget.textbox(theme["layout_txt_" .. awful.layout.getname(awful.layout.get(s))])
    -- awful.tag.attached_connect_signal(s, "property::selected", function () update_txt_layoutbox(s) end)
    -- awful.tag.attached_connect_signal(s, "property::layout", function () update_txt_layoutbox(s) end)
    -- s.mytxtlayoutbox:buttons(my_table.join(
    --                        awful.button({}, 1, function() awful.layout.inc(1) end),
    --                        awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
    --                        awful.button({}, 3, function() awful.layout.inc(-1) end),
    --                        awful.button({}, 4, function() awful.layout.inc(1) end),
    --                        awful.button({}, 5, function() awful.layout.inc(-1) end)))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = awful.util.taglist_buttons,
        layout  = {
            spacing = dpi(6),
            layout  = wibox.layout.fixed.horizontal,
        },
        widget_template = {
            {
                id     = "icon_role",
                widget = wibox.widget.textbox,
                font   = "JetBrainsMono Nerd Font 14",
                align  = "center",
            },
            id     = "background_container",
            widget = wibox.container.background,
        
            create_callback = function(self, tag, index, _)
                local icon = (#tag:clients() > 0) and "  " or "  "
                local icon_widget = self:get_children_by_id("icon_role")[1]
        
                if tag.selected then
                    icon_widget.markup = "<span foreground='#E2A528'>" .. icon .. "</span>"  -- Focus color
                else
                    icon_widget.markup = "<span foreground='#cccccc'>" .. icon .. "</span>"  -- Normal color
                end
        
                self:get_children_by_id("background_container")[1].bg = "#140c0b" -- Bar background color
            end,
        
            update_callback = function(self, tag, index, _)
                local icon = (#tag:clients() > 0) and "  " or "  "
                local icon_widget = self:get_children_by_id("icon_role")[1]
        
                if tag.selected then
                    icon_widget.markup = "<span foreground='#E2A528'>" .. icon .. "</span>" -- Focus color
                else
                    icon_widget.markup = "<span foreground='#cccccc'>" .. icon .. "</span>" -- Normal color
                end
        
                self:get_children_by_id("background_container")[1].bg = "#140c0b" -- Bar background
            end,
        }
        
}
    
    
    
    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    awful.screen.connect_for_each_screen(function(s)
        -- Add padding to top of the screen
        s.padding = {
            top = dpi(40),   -- Set this to match your wibox's y + height
            bottom = 0,
            left = 0,
            right = 0
        }
    
        -- Create your floating wibox here
        local mywibox = wibox({
            screen = s,
            width = dpi(1900),
            height = dpi(35),
            x = dpi(10),
            y = dpi(7),
            ontop = true,
            visible = true,
            bg = "#0d0d0d",
            shape = gears.shape.rounded_rect,
        })
    
        mywibox:setup {
            layout = wibox.layout.align.horizontal,
            { -- LEFT
                layout = wibox.layout.fixed.horizontal,
                wibox.container.margin(power_button, dpi(15), dpi(5), 0, 0),
                spr,
                wibox.container.margin(mydate, dpi(5), dpi(5), 0, 0),
                spr,
                wibox.container.margin(myclock, dpi(5), dpi(5), 0, 0),
            },
            {
                layout = wibox.layout.align.horizontal,
                expand = "none",
                nil,
                s.mytaglist,  -- this is your centered taglist
                nil,
            },
            

            -- wibox.container.place(s.mytaglist, "center"), -- CENTER
            
            { -- RIGHT
                layout = wibox.layout.fixed.horizontal,
                wibox.container.margin(wibox.widget.systray(), dpi(5), dpi(5), dpi(5), dpi(5)),
                spr,
                wibox.container.margin(bat.widget, dpi(5), dpi(10), 0, 0),
            },
        }
        s.mywibox = mywibox
    end)
    
end

return theme
