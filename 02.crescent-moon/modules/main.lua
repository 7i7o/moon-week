-- Main script: main.lua

local MathOps = require("mathOps")

local resultAdd = MathOps.add(5, 3)
local resultSubtract = MathOps.subtract(10, 4)

print("Addition result:", resultAdd)
print("Subtraction result:", resultSubtract)

--[[ Output:
    Addition result: 8
    Subtraction result: 6
]]
