-- Error handling in Lua with pcall
local function printPcallResults(status, result)
    if status then
        print("No error occurred.")
    else
        print("Error:", result)
    end
end

local function errorFn()
    error("This is a deliberate error.")
end

local function noErrorFn()
    return true
end

local status, result = pcall(noErrorFn)
printPcallResults(status, result)

local status, result = pcall(errorFn)
printPcallResults(status, result)
