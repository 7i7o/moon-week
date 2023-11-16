-- Error handling in Lua with pcall
local function errorFn()
    error("This is a deliberate error.")
end

local status, result = pcall(errorFn)

if status then
    print("No error occurred.")
else
    print("Error:", result)
end


local function noErrorFn()
    return 42
end

local status, result = pcall(noErrorFn)

if status then
    print("No error occurred. Result: ", result)
else
    print("Error:", result)
end
