-- "Asynchronous" programming with coroutines in Lua
local function asyncTask(name, delay)
    print(name .. " called")
    for i = 1, 3 do
        print(name .. " working...")
        coroutine.yield(i)
        os.execute("sleep " .. delay) -- Simulate an asynchronous task
    end
    print(name .. " completed.")
end

local coroutine1 = coroutine.create(function()
    asyncTask("Task 1", 1)
end)

local coroutine2 = coroutine.create(function()
    asyncTask("Task 2", 3)
end)

function noerror(status)
    if status then return "true (no error)" else return "false (errored)" end
end

local status, value

-- Resuming coroutines in an interleaved manner
for i = 1, 4 do
    status, value = coroutine.resume(coroutine1)
    print(" - Task 1: " .. noerror(status) .. " and returned " .. tostring(value))
    status, value = coroutine.resume(coroutine2)
    print(" - Task 2: " .. noerror(status) .. " and returned " .. tostring(value))
end
