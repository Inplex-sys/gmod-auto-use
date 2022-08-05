surface.CreateFont("Staff_Font", {
    font = "Arial",
    extended = false,
    size = 16,
    weight = 500,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = true,
    strikeout = false,
    symbol = false,
    rotary = false,
    shadow = true,
    additive = false,
    outline = false,
})

_G['autoUse'] = true

hook.Add("CreateMove", "auto_use", function(cl_cmd)
    if input.IsKeyDown(KEY_J) then
        if _G['autoUse'] == true then
            _G['autoUse'] = false
        else
            _G['autoUse'] = true
        end
    end
end)

hook.Add("HUDPaint", "DrawAutoUse", function()
    status = ""
    if _G['autoUse'] == true then
        status = "enabled"
    else
        status = "disabled"
    end
    draw.DrawText("The Auto-Use is " .. status, "Staff_Font", ScrW() - ScrW() + 200, ScrH() - ScrH() + 24, Color(255, 255, 255, 255), 1)
end)

timer.Create("auto_use_timer", .5, 0, function()
    if _G['autoUse'] == true then
        RunConsoleCommand("+use")
        timer.Simple(.5, function()
            RunConsoleCommand("-use")
        end)
    end
end)
