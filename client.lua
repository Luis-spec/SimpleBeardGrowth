
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.minutes * 60000)
        TriggerEvent('skinchanger:getSkin', function(skinData)
            if skinData ~= nil then
                if skinData['beard_2'] > 0 and skinData['beard_2'] < 10 then
                    skinData['beard_2'] = skinData['beard_2'] + 1
                    TriggerEvent('skinchanger:loadSkin', skinData)
                    TriggerServerEvent('esx_skin:save', skinData)
                end
            end
        end)
    end
end)

RegisterNetEvent('SimpleBeardGrowth:shave')
AddEventHandler('SimpleBeardGrowth:shave', function()
    TriggerEvent('skinchanger:getSkin', function(skinData)
        if skinData ~= nil then
            if skinData['beard_2'] > 1 and skinData['beard_2'] < 10 then
                skinData['beard_2'] = 1
                TriggerEvent('skinchanger:loadSkin', skinData)
                TriggerServerEvent('esx_skin:save', skinData)
            end
        end
    end)
end)