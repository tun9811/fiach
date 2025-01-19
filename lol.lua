local player = game.Players.LocalPlayer

-- Ban duration in hours
local banDuration = 1 

-- Calculate the unban time
local currentTime = os.time()
local unbanTime = currentTime + (banDuration * 60 * 60) -- Convert hours to seconds
local unbanDate = os.date("*t", unbanTime) -- Get date and time of unban

-- Format the kick message
local message = string.format(
    "You are banned until [%04d-%02d-%02d %02d:%02d:%02d].",
    unbanDate.year, unbanDate.month, unbanDate.day, unbanDate.hour, unbanDate.min, unbanDate.sec
)

-- Wait a moment before kicking the player
wait(5)

-- Kick the player with the ban message
player:Kick(message)
