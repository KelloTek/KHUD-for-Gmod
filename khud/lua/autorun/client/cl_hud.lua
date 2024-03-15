surface.CreateFont("DefaultHud", {
    font = "Arial",
    size = ScrW() * 0.02,
    weight = 500,
    antialiasing = true
})

hook.Add("Initialize", "Initialize", function()
    hook.Remove("HUDPaint", "FPP_HUDPaint")
end)

hook.Add("HUDPaint", "khud", function()
    local health = LocalPlayer():Health()
    local armor = LocalPlayer():Armor()
    local energy = LocalPlayer():getDarkRPVar("Energy")

    if !LocalPlayer():Alive() then return end

    if not IsValid(LocalPlayer():GetActiveWeapon()) then return end
    if LocalPlayer():GetActiveWeapon():Clip1() ~= -1 then
        draw.RoundedBox(5, ScrW() * 0.88, ScrH() * 0.93, ScrW() * 0.11, ScrH() * 0.05, Color(27, 27, 29, 230))
        draw.SimpleText(LocalPlayer():GetActiveWeapon():Clip1().. "/" ..LocalPlayer():GetAmmoCount(LocalPlayer():GetActiveWeapon():GetPrimaryAmmoType()), "DefaultHud", ScrW() * 0.95, ScrH() * 0.937, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
        surface.SetDrawColor(Color(255, 255, 255, 255))
        surface.SetMaterial(Material("materials/khud/ammo.png"))
        surface.DrawTexturedRect(ScrW() * 0.884, ScrH() * 0.935, ScrW() * 0.03, ScrH() * 0.045)
    end

    if (health > 999) then
        health = "999+"
    end

    if (armor > 999) then
        armor = "999+"
    end

    draw.RoundedBox(5, ScrW() * -0.01, ScrH() * 0.93, ScrW() * 0.23, ScrH() * 0.08, Color(27, 27, 29, 230))

    surface.SetDrawColor(Color(255, 255, 255, 255))
    surface.SetMaterial(Material("materials/khud/health.png"))
    surface.DrawTexturedRect(ScrW() * 0.005, ScrH() * 0.94, ScrW() * 0.03, ScrH() * 0.06)
    draw.SimpleText(health, "DefaultHud", ScrW() * 0.04, ScrH() * 0.95, Color(255, 255, 255, 255))
    surface.SetMaterial(Material("materials/khud/armor.png"))
    surface.DrawTexturedRect(ScrW() * 0.08, ScrH() * 0.942, ScrW() * 0.03, ScrH() * 0.05)
    draw.SimpleText(armor, "DefaultHud", ScrW() * 0.11, ScrH() * 0.95, Color(255, 255, 255, 255))
    surface.SetMaterial(Material("materials/khud/food.png"))
    surface.DrawTexturedRect(ScrW() * 0.148, ScrH() * 0.94, ScrW() * 0.033, ScrH() * 0.06)
    draw.SimpleText(energy, "DefaultHud", ScrW() * 0.185, ScrH() * 0.95, Color(255, 255, 255, 255))

end)

local HideElement = {
    ["CHudHealth"] = true,
    ["CHudBattery"] = true,
    ["CHudAmmo"] = true,
    ["CHudSecondaryAmmo"] = true,

    ["DarkRP_HUD"] = true,
    ["DarkRP_EntityDisplay"] = true,
    ["DarkRP_LocalPlayerHUD"] = true,
    ["DarkRP_Hungermod"] = true,
    ["DarkRP_Agenda"] = true,
    ["DarkRP_LockdownHUD"] = true,
    ["DarkRP_ArrestedHUD"] = true,
    ["DarkRP_ChatReceivers"] = true,
}

hook.Add("HUDShouldDraw", "ShouldDraw", function(name)
    if HideElement[name] then return false end
end)