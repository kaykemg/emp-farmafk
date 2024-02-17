local Tunnel = module('vrp', 'lib/Tunnel')
local Proxy = module('vrp', 'lib/Proxy')
vRP = Proxy.getInterface('vRP')
emp = Tunnel.getInterface(GetCurrentResourceName(), emp)

------------------------------------
local emprego = false
local acabou = false
------------------------------------
Citizen.CreateThread(function()
    while true do
        local migon = 1000
        if not emprego then
            local ped = PlayerPedId()
            local x,y,z = table.unpack(GetEntityCoords(ped))

            for k, v in pairs(Config.start) do
                if Vdist(x,y,z,v.x,v.y,v.z) <= 30.0 then
                    migon = 1
                    DrawMarker(27, v.x, v.y, v.z - 0.99, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 255, 0, 0, 150, 0, 0, 0, 1)
                    if Vdist(x,y,z,v.x,v.y,v.z) <= 0.5 then
                        showAlert(Config.message[1])
                        if IsControlJustPressed(0, 38) then
                            emprego = true
                            FreezeEntityPosition(ped, true)
                            emp.barra()
                            TriggerEvent('Notify', 'aviso', Config.message[2], 5000)
                            TriggerEvent('Notify', 'aviso', Config.message[3], 5000)
                        end
                    end
                end
            end
        end
        Citizen.Wait(migon)
    end
end)
------------------------------------
Citizen.CreateThread(function()
    while not acabou do
        local migon = 1000
        if emprego then
            local ped = PlayerPedId()
            local time = GetGameTimer() + Config.time

            while GetGameTimer() < time do
                Citizen.Wait(0)
            end

            emprego = false
            acabou = true
            FreezeEntityPosition(ped, false)
            emp.CheckPayment()
            ResetJob()
        end
        Citizen.Wait(migon)
    end
end)
------------------------------------

function drawTxt(text, font, x, y, scale, r, g, b, a)
    SetTextFont(font)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextOutline()
    SetTextCentre(1)
    SetTextEntry('STRING')
    AddTextComponentString(text)
    DrawText(x, y)
end

function showAlert(message)
    SetTextComponentFormat("STRING")
    AddTextComponentString(message)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function ResetJob()
    emprego = false
    acabou = false
end
