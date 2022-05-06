# QTile configuration
# Author: El Paiche

import os
import subprocess

from typing import List  # noqa: F401

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Match, Key, EzKey, KeyChord, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

from colors import colors_list

# --------------------------------------------------------------------------- #
# COLORS
# --------------------------------------------------------------------------- #

# colors_list = {
#     'paleta': {
#         'background': '#0B1D2B',
#         'dark':       '#4B525D',
#         'light':      '#898F9A',
#         'foreground': '#CCD2DD',
#         'gray01':     '#0B1D2B',
#         'gray02':     '#232E39',
#         'gray03':     '#373F4A',
#         'gray04':     '#4B525D',
#         'gray05':     '#5F6670',
#         'gray06':     '#747A85',
#         'gray07':     '#898F9A',
#         'gray08':     '#9FA5B0',
#         'gray09':     '#B5BBC6',
#         'gray10':     '#CCD2DD',
#         'primary':    '#437CA9',
#         'secondary':  '#64802D',
#         'contrary':   '#A9645E',
#         'alert':      '#D385B4',
#         'caution':    '#D28B86',
#         'ok':         '#8BA75D',
#         }
#     }

colors = colors_list["deus"]

# --------------------------------------------------------------------------- #
# HOOKS
# --------------------------------------------------------------------------- #

# Autostart some programs
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])

# --------------------------------------------------------------------------- #
# KEY BINDINGS
# --------------------------------------------------------------------------- #

mod = "mod4"
terminal = guess_terminal()

keys = [

    # ----------------------------------------------------------------------- #
    # Tile manager

    # Manage layout
    EzKey("M-<space>", lazy.next_layout()),
    EzKey("M-S-<space>", lazy.prev_layout()),

    # Switch between groups (workspaces)
    EzKey("M-<Right>", lazy.screen.next_group()),
    EzKey("M-<Left>", lazy.screen.prev_group()),
    EzKey("M-<Up>", lazy.screen.toggle_group()),
    EzKey("M-<Down>", lazy.screen.toggle_group()),

    # Switch between windows in current stack pane
    EzKey("M-j", lazy.layout.down()),
    EzKey("M-k", lazy.layout.up()),
    EzKey("M-<Tab>", lazy.layout.up()),

    # Move windows up or down in current stack
    EzKey("M-S-j", lazy.layout.shuffle_down()),
    EzKey("M-S-k", lazy.layout.shuffle_up()),

    # Switch window focus to other pane(s) of stack
    EzKey("A-<Tab>", lazy.layout.next()),

    # Swap panes of split stack
    EzKey("M-S-<Tab>", lazy.layout.rotate()),

    # Change window to float or fullscreen
    EzKey("M-f", lazy.window.toggle_floating()),
    EzKey("M-e", lazy.window.toggle_fullscreen()),

    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with multiple stack panes
    EzKey("M-C-<Return>", lazy.layout.toggle_split()),

    # Kill focused window
    EzKey("M-x", lazy.window.kill()),

    # Restart qtile
    EzKey("M-S-r", lazy.restart()),

    # Shutdown qtile
    EzKey("M-S-q", lazy.shutdown()),

    # Change size of window with a mode
    KeyChord(
        [mod], "z", [
            Key([], "g", lazy.layout.grow()),
            Key([], "s", lazy.layout.shrink()),
            Key([], "n", lazy.layout.normalize()),
            Key([], "m", lazy.layout.maximize())
            ],
        mode = "Windows"
        ),

    # ----------------------------------------------------------------------- #
    # System

    # Volume
    EzKey("<XF86AudioRaiseVolume>", lazy.spawn("amixer -D pulse sset Master 3%+")),
    EzKey("<XF86AudioLowerVolume>", lazy.spawn("amixer -D pulse sset Master 3%-")),
    EzKey("<XF86AudioMute>", lazy.spawn("amixer -D pulse set Master toggle")),

    # Brightness
    EzKey("<XF86MonBrightnessUp>", lazy.spawn("light -A 5")),
    EzKey("<XF86MonBrightnessDown>", lazy.spawn("light -U 5")),

    # Brigthness with a mode
    KeyChord(
        [mod], "b", [
                Key([], "u", lazy.spawn("light -A 5")),
                Key([], "d", lazy.spawn("light -U 5")),
            ],
        mode = "Brightness"
        ),

    # Music
    EzKey("<XF86AudioNext>", lazy.spawn("cmus-remote -n")),
    EzKey("<XF86AudioPrev>", lazy.spawn("cmus-remote -r")),
    EzKey("<XF86AudioPlay>", lazy.spawn("cmus-remote -u")),

    # ----------------------------------------------------------------------- #
    # Programs

    # Terminal
    EzKey("M-S-<Return>", lazy.spawn(terminal)),

    # File manager
    EzKey("M-S-e", lazy.spawn("alacritty -e ranger")),
    EzKey("M-C-e", lazy.spawn("pcmanfm")),

    # Music player
    EzKey("M-S-m", lazy.spawn("alacritty -e cmus")),
    EzKey("M-C-m", lazy.spawn("/opt/deadbeef/bin/deadbeef")),

    # Launching NeoVim
    EzKey("M-S-t", lazy.spawn("alacritty -e nvim")),

    # Internet explorer
    EzKey("M-S-i", lazy.spawn("firefox")),
    EzKey("M-C-i", lazy.spawn("qutebrowser")),

    # Launching Telegram
    EzKey("M-S-c", lazy.spawn("/home/paiche/Librerias/Telegram/Telegram")),

    # Launcher
    EzKey("M-r", lazy.spawncmd()),
    EzKey("M-p", lazy.spawn("rofi -show run")),

    # Screenshot
    EzKey("M-S-s", lazy.spawn("scrot '%Y-%m-%d_$wx$h_full.png' -e 'mv $f ~/Imágenes'")),
    EzKey("M-C-s", lazy.spawn("scrot -u '%Y-%m-%d_$wx$h_sel.png' -e 'mv $f ~/Imágenes'")),

]

# --------------------------------------------------------------------------- #
# GROUPS - WORKSPACES
# --------------------------------------------------------------------------- #

workspaces = [
    { "name": " ", "layout": "monadtall", "matches": None },
    { "name": " ", "layout": "monadtall", "matches": None },
    { "name": " ", "layout": "monadtall", "matches": None },
    { "name": " ", "layout": "treetab", "matches": [Match(wm_class = ["Zathura"]), Match(wm_class = ["Soffice"]), Match(wm_class = ["Pcmanfm"])] },
    { "name": " ", "layout": "max", "matches": [Match(wm_class = ["qutebrowser"]), Match(wm_class = ["Firefox"])] },
    { "name": " ", "layout": "treetab", "matches": [Match(wm_class = ["whatsdesk"]), Match(wm_class = ["TelegramDesktop"]), Match(wm_class = ["discord"])] },
    { "name": " ", "layout": "monadtall", "matches": [Match(wm_class = ["Deadbeef"])] },
    { "name": " ", "layout": "monadtall", "matches": [Match(wm_class = ["zoom"])] },
    { "name": " ", "layout": "monadtall", "matches": None }
    ]

groups = [Group(**kwargs) for kwargs in workspaces]
icount = 1

for work in workspaces:

    # Switch to group and move focused window
    keys.extend([
        # Key([mod], work["label"], lazy.group[work["name"]].toscreen(toggle = False)),
        # Key([mod, "shift"], work["label"], lazy.window.togroup(work["name"], switch_group = True)),
        Key([mod], str(icount), lazy.group[work["name"]].toscreen(toggle = False)),
        Key([mod, "shift"], str(icount), lazy.window.togroup(work["name"], switch_group = True)),
    ])

    icount = icount + 1

# --------------------------------------------------------------------------- #
# LAYOUTS
# --------------------------------------------------------------------------- #

layout_theme = {
    "border_width": 2,
    "max_border_width": 2,
    "fullscreen_border_width": 0,
    "margin": 4,
    "border_focus": colors["high"],
    "border_normal": colors["dark"]
    }

layouts = [
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.Max(**layout_theme),
    # layout.Stack(**layout_theme, num_stacks = 1),
    layout.TreeTab(**layout_theme),
    # layout.Zoomy(**layout_theme),
    # layout.Floating(**layout_theme),
    # layout.Bsp(),
    # layout.Columns(**layout_theme, num_columns = 1),
    # layout.Matrix(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.VerticalTile(),
]

# --------------------------------------------------------------------------- #
# BAR
# --------------------------------------------------------------------------- #

widget_defaults = dict(
    font = 'UbuntuMono Nerd Font',
    fontsize = 13,
    padding = 3
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(

        # Polybar?

        # bottom = bar.Gap(21)
        # left = bar.Gap(24),
        top = bar.Gap(21),

        # Default

        # top = bar.Bar(
        #     [
        #         widget.QuickExit(
        #             countdown_format = "({})",
        #             default_text = "    ",
        #             background = colors["gray01"],
        #             foreground = colors["alert"]
        #             ),
        #         widget.TextBox(
        #             text = "  ",
        #             fontsize = 35,
        #             padding = -10,
        #             foreground = colors["gray01"],
        #             background = colors["gray02"]
        #             ),
        #         widget.GroupBox(
        #             background = colors["gray02"],
        #             active = colors["gray10"],
        #             block_highlight_text_color = colors["gray10"],
        #             foreground = colors["gray10"],
        #             highlight_color = colors["gray02"],
        #             inactive = colors["gray03"],
        #             this_current_screen_border = colors["primary"],
        #             this_screen_border = colors["contrary"],
        #             urgent_border = colors["alert"],
        #             highlight_method = "line",
        #             urgent_alert_method = "line",
        #             disable_drag = True,
        #             borderwidth = 2,
        #             spacing = 6,
        #             margin_y = 5,
        #             margin_x = 0,
        #             ),
        #         widget.Spacer(),
        #         widget.WindowName(),
        #         widget.Spacer(),
        #         widget.Chord(
        #             background = colors["gray02"],
        #             foreground = colors["primary"]
        #             ),
        #         # widget.Volume(),
        #         widget.Backlight(
        #             backlight_name = "amdgpu_bl0",
        #             format = "    {percent:2.0%}",
        #             background = colors["gray02"],
        #             foreground = colors["gray10"]
        #             ),
        #         widget.Memory(
        #             format = "    {MemUsed}M",
        #             background = colors["gray02"],
        #             foreground = colors["gray10"]
        #             ),
        #         widget.CPU(
        #             format = "    {load_percent}%",
        #             background = colors["gray02"],
        #             foreground = colors["gray10"]
        #             ),
        #         widget.TextBox(
        #             text = "  ",
        #             background = colors["gray02"],
        #             foreground = colors["gray10"]
        #             ),
        #         widget.ThermalSensor(
        #             threshold = 60,
        #             background = colors["gray02"],
        #             foreground = colors["gray10"],
        #             foreground_alert = colors["alert"]
        #             ),
        #         # widget.Battery(
        #         #     update_interval = 30,
        #         #     low_percentage = 0.2,
        #         #     show_short_text = False,
        #         #     charge_char = "",
        #         #     discharge_char = "",
        #         #     full_char = "",
        #         #     format = "{char} {percent:2.0%}",
        #         #     background = colors["dark"],
        #         #     foreground = colors["foreground"],
        #         #     low_foreground = colors["alert"]
        #         #     ),
        #         widget.Clock(
        #             format="    %Y-%m-%d %H:%M",
        #             background = colors["gray02"],
        #             foreground = colors["gray10"]
        #             ),
        #         widget.TextBox(
        #             text = " ",
        #             fontsize = 45,
        #             padding = 1,
        #             background = colors["gray02"],
        #             foreground = colors["gray01"]
        #             ),
        #         widget.Systray(background = colors["gray01"]),
        #         widget.CurrentLayoutIcon(
        #             background = colors["gray01"],
        #             foreground = colors["gray10"],
        #             scale = 0.8,
        #             ),
        #         ],
        #     20,
        #     background = colors["gray02"],
        #     margin = [0,0,0,0],
        #     opacity = 1.00,
        #     ),

        ),
    ]

# --------------------------------------------------------------------------- #
# MOUSE
# --------------------------------------------------------------------------- #

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

# --------------------------------------------------------------------------- #
# OTROS
# --------------------------------------------------------------------------- #

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        # {'wmclass': 'confirm'},
        # {'wmclass': 'dialog'},
        # {'wmclass': 'download'},
        # {'wmclass': 'error'},
        # {'wmclass': 'file_progress'},
        # {'wmclass': 'notification'},
        # {'wmclass': 'splash'},
        # {'wmclass': 'toolbar'},
        # {'wmclass': 'confirmreset'},  # gitk
        # {'wmclass': 'makebranch'},  # gitk
        # {'wmclass': 'maketag'},  # gitk
        # {'wname': 'branchdialog'},  # gitk
        # {'wname': 'pinentry'},  # GPG key password entry
        # {'wmclass': 'ssh-askpass'},  # ssh-askpass
        ],
    **layout_theme
    )
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
