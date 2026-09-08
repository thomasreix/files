------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "foot"
local fileManager = "dolphin"

-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()
    hl.exec_cmd("swaybg -c '#0f0f0f'")
    hl.exec_cmd("wl-paste --type text --watch cliphist store &")
    hl.exec_cmd("wl-paste --type image --watch cliphist store &")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_THEME", "Adwaita")
hl.env("XCURSOR_SIZE", "24")

hl.env("HYPRCURSOR_THEME", "")
hl.env("HYPRCURSOR_SIZE", "24")


-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in  = -2,
        gaps_out = 0,

        border_size = 4,

        col = {
            active_border   = "#ef934d",
            inactive_border = "#0f0f0fff",
        },

        resize_on_border = false,

        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 0,
        rounding_power = 0,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,
    },

    animations = {
        enabled = false,
    },
})

hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

hl.curve("easy",           { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0,
        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})


hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

cursor = {
    sync_gsettings_theme = true,
}
---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("code"))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("flatpak run org.famistudio.FamiStudio"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("steam"))
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("gimp"))
hl.bind(mainMod .. " + COMMA", hl.dsp.exec_cmd("mumble"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("prismlauncher -l modern"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("prismlauncher"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("prismlauncher -l essential"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("prismlauncher -l babric"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("obs"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("librewolf"))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("librewolf --new-tab https://chatgpt.com/"))
hl.bind(mainMod .. " + U", hl.dsp.exec_cmd("librewolf --new-tab https://lidraughts.org/"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("librewolf --new-tab https://0332846p.index-education.net/pronote/eleve.html?identifiant=TFJ62HQtGK9aNwjD"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("librewolf --new-tab https://www.desmos.com/calculator"))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("librewolf --new-tab https://mail.google.com/mail/u/1/#inbox"))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("librewolf --new-tab https://www.google.com/android/find/?did=OM-eseV2b6UX2CdpGvU_wbqvEU8dXHq0RGkUxKBl1f0%3D"))
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("librewolf --new-tab https://youtube.com"))
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd("librewolf --new-tab https://aternos.org"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("librewolf --new-tab https://mail.tutanota.com/mail/"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("flatpak run org.vinegarhq.Sober"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("flatpak run org.vinegarhq.Vinegar"))
hl.bind(mainMod .. " + J", hl.dsp.exec_cmd("flatpak run org.kde.krita"))
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("flatpak run org.kde.kdenlive"))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("flatpak run com.github.Anuken.Mindustry"))


hl.bind(mainMod .. " + Backspace", hl.dsp.window.close())
hl.bind(mainMod .. " + F1", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))




hl.bind(mainMod .. " + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F5", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + up", hl.dsp.layout("togglesplit"))

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

--------------------
---- SCREENSHOTS ---
--------------------

local directory = os.getenv("HOME") .. "/media/screenshots"

hl.on("hyprland.start", function()
    hl.exec_cmd("mkdir -p " .. directory)
end)

-- Print Screen = whole screen
hl.bind("Print", hl.dsp.exec_cmd(
    "grim " .. directory .. "/$(date +%Y-%m-%d_%H-%M-%S).png"
))

-- Shift + Print Screen = active window
hl.bind("SHIFT + Print", hl.dsp.exec_cmd(
    "grim -g \"$(hyprctl activewindow -j | jq -r '\"\\(.at[0]),\\(.at[1]) \\(.size[0])x\\(.size[1])\"')\" " ..
    directory .. "/$(date +%Y-%m-%d_%H-%M-%S).png"
))

-- Ctrl + Print Screen = selected area
hl.bind("CTRL + Print", hl.dsp.exec_cmd(
    "grim -g \"$(slurp)\" " ..
    directory .. "/$(date +%Y-%m-%d_%H-%M-%S).png"
))

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})
