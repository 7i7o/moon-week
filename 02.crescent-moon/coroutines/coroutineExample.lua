-- Creating and resuming coroutines in Lua
local co = coroutine.create(function()
    print("Coroutine started")
    coroutine.yield("First yield")
    print("Coroutine resumed")
    coroutine.yield("Second yield")
    print("Coroutine finished")
end)

print(coroutine.status(co)) -- Output: suspended

-- Resuming the coroutine
local status, value = coroutine.resume(co)
print(status, value)        -- Output: true  First yield

print(coroutine.status(co)) -- Output: suspended

-- Resuming the coroutine again
status, value = coroutine.resume(co)
print(status, value)        -- Output: true  Second yield

print(coroutine.status(co)) -- Output: suspended

-- Resuming the coroutine one last time
status, value = coroutine.resume(co)
print(status, value)        -- Output: true  Coroutine finished

print(coroutine.status(co)) -- Output: dead

status, value = coroutine.resume(co)
print(status, value) -- Output: false  cannot resume dead coroutine
