local Players = game:GetService("Players")
local lp = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() and Players.LocalPlayer
local mouse = lp:GetMouse()

local function gettarget(instance)
   for i,v in next, Players:GetPlayers() do
      if v.Character and (instance == v.Character or instance:IsDescendantOf(v.Character)) then
         return true
      end
   end
end

local con = game:GetService("RunService").Heartbeat:Connect(function()
   if gettarget(mouse.Target) then
      mouse1press()
      task.wait()
      mouse1release()
   end
end)

getgenv().disable = function()
   getgenv().disable = nil
   warn("Disconnecting:",con)
   con:Disconnect()
end
