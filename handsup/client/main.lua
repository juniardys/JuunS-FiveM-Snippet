RegisterKeyMapping('+handsup', 'Angkat Tangan', 'keyboard', 'X')
RegisterCommand('+handsup', function() 
    local playerPed = PlayerPedId()
    if DoesEntityExist(playerPed) 
        then Citizen.CreateThread(function()  
            RequestAnimDict("random@mugging3")  
            while not HasAnimDictLoaded("random@mugging3") do 
                Citizen.Wait(100) 
            end
            TaskPlayAnim(playerPed, "random@mugging3", "handsup_standing_base", 8.0, -8, -1, 49, 0, 0, 0, 0) 
        end) 
    end 
end, false)

RegisterCommand('-handsup', function() 
    local playerPed = PlayerPedId()
    ClearPedSecondaryTask(playerPed)
end, false)