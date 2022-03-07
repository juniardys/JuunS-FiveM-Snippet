local currentWalkingStyle
local crouched = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local ped = PlayerPedId()
        if (DoesEntityExist(ped) and not IsEntityDead(ped)) then
            DisableControlAction(0, 36, true) -- INPUT_DUCK 
            if (not IsPauseMenuActive()) then
                if (IsDisabledControlJustPressed(0, 36)) then
                    RequestAnimSet("move_ped_crouched")
                    while (not HasAnimSetLoaded("move_ped_crouched")) do
                        Citizen.Wait(100)
                    end
                    if (crouched == true) then
                        if currentWalkingStyle then
                            ResetPedMovementClipset(ped, 0)
                            RequestAnimSet(currentWalkingStyle)
                            while not HasAnimSetLoaded(currentWalkingStyle) do
                                Citizen.Wait(100)
                            end
                            SetPedMovementClipset(ped, currentWalkingStyle, 0.2)
                        else
                            ResetPedMovementClipset(ped, 0)
                        end
                        crouched = false
                    elseif (crouched == false) then
                        SetPedMovementClipset(ped, "move_ped_crouched", 0.25)
                        crouched = true
                    end
                end
            end
        end
    end
end)
