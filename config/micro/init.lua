local micro = import("micro")
local config = import("micro/config")
local shell = import("micro/shell")

function format(bp)
    local file = bp.Buf.Path
    local config_file = os.getenv("HOME") .. "/.config/clang/format"

    bp:Save()

    local output, err = shell.RunCommand(
        "clang-format -i --style=file:" .. config_file .. " " .. file
    )

    if err ~= nil then
        micro.InfoBar():Error("clang-format: " .. tostring(err))
        return
    end

    bp:ReOpen()
    micro.InfoBar():Message("Formatted!")
end

function init()
    config.TryBindKey("Ctrl-f", "lua:initlua.format", true)
end
