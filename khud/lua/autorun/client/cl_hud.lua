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
    local maxHealth = LocalPlayer():GetMaxHealth()
    local healthPercentage = health / maxHealth

    local armor = LocalPlayer():Armor()
    local maxArmor = LocalPlayer():GetMaxArmor()
    local armorPercentage = armor / maxArmor

    if !LocalPlayer():Alive() then return end

    if not IsValid(LocalPlayer():GetActiveWeapon()) then return end
    if LocalPlayer():GetActiveWeapon():Clip1() ~= -1 then
        draw.SimpleText(LocalPlayer():GetActiveWeapon():Clip1().. "/" ..LocalPlayer():GetAmmoCount(LocalPlayer():GetActiveWeapon():GetPrimaryAmmoType()), "DefaultHud", ScrW() * 0.95, ScrH() * 0.937, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
    end

    if (health >= 101) then
        healthPercentage = 1
    end

    if (armor >= 101) then
        armorPercentage = 1
    end

    if not DarkRP.disabledDefaults["modules"]["hungermod"] then
        local energy = LocalPlayer():getDarkRPVar("Energy")
        local maxEnergy = 100
        local energyPercentage = energy / maxEnergy

        if (energy >= 101) then
            energyPercentage = 1
        end

        draw.RoundedBox(0, ScrW() * 0.01, ScrH() * 0.955, ScrW() * 0.073, ScrH() * 0.015, Color(0, 0, 0, 200))
        draw.RoundedBox(0, ScrW() * 0.0115, ScrH() * 0.958, ScrW() * 0.07, ScrH() * 0.01, Color(0, 110, 42))
        draw.RoundedBox(0, ScrW() * 0.0115, ScrH() * 0.958, ScrW() * 0.07 * healthPercentage, ScrH() * 0.01, Color(0, 255, 106))

        draw.RoundedBox(0, ScrW() * 0.085, ScrH() * 0.955, ScrW() * 0.073, ScrH() * 0.015, Color(0, 0, 0, 200))
        draw.RoundedBox(0, ScrW() * 0.0865, ScrH() * 0.958, ScrW() * 0.07, ScrH() * 0.01, Color(0, 97, 223))
        draw.RoundedBox(0, ScrW() * 0.0865, ScrH() * 0.958, ScrW() * 0.07 * armorPercentage, ScrH() * 0.01, Color(0, 132, 255))

        draw.RoundedBox(0, ScrW() * 0.01, ScrH() * 0.975, ScrW() * 0.148, ScrH() * 0.015, Color(0, 0, 0, 200))
        draw.RoundedBox(0, ScrW() * 0.0115, ScrH() * 0.978, ScrW() * 0.145, ScrH() * 0.01, Color(211, 172, 0))
        draw.RoundedBox(0, ScrW() * 0.0115, ScrH() * 0.978, ScrW() * 0.145 * energyPercentage, ScrH() * 0.01, Color(255, 217, 0))
    else
        draw.RoundedBox(0, ScrW() * 0.01, ScrH() * 0.975, ScrW() * 0.073, ScrH() * 0.015, Color(0, 0, 0, 200))
        draw.RoundedBox(0, ScrW() * 0.0115, ScrH() * 0.978, ScrW() * 0.07, ScrH() * 0.01, Color(0, 110, 42))
        draw.RoundedBox(0, ScrW() * 0.0115, ScrH() * 0.978, ScrW() * 0.07 * healthPercentage, ScrH() * 0.01, Color(0, 255, 106))

        draw.RoundedBox(0, ScrW() * 0.085, ScrH() * 0.975, ScrW() * 0.073, ScrH() * 0.015, Color(0, 0, 0, 200))
        draw.RoundedBox(0, ScrW() * 0.0865, ScrH() * 0.978, ScrW() * 0.07, ScrH() * 0.01, Color(0, 97, 223))
        draw.RoundedBox(0, ScrW() * 0.0865, ScrH() * 0.978, ScrW() * 0.07 * armorPercentage, ScrH() * 0.01, Color(0, 132, 255))
    end
    
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