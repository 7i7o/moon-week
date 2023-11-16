----------
-- Dynamic Variables

-- Lua code
local x = 10
print(x) -- Output: 10

x = "Hello, Lua!"
print(x) -- Output: Hello, Lua!

----------
-- Imperative vs Functional

-- Imperative programming in Lua
function calculateSum(numbers)
    local sum = 0
    for i = 1, #numbers do
        sum = sum + numbers[i]
    end
    return sum
end

local numbers = { 1, 2, 3, 4, 5 }
local result = calculateSum(numbers)
print(result) -- Output: 15

-- Functional programming in Lua
function map(array, func)
    local result = {}
    for i, v in ipairs(array) do
        result[i] = func(v)
    end
    return result
end

function square(x)
    return x * x
end

local numbers = { 1, 2, 3, 4, 5 }
local squaredNumbers = map(numbers, square)
print(table.concat(squaredNumbers, ", ")) -- Output: 1, 4, 9, 16, 25

----------
-- Variables and Data Types

-- Variable and data types in Lua
local message = "Hello, Lua!" -- String
local age = 25                -- Number
local isProgramming = true    -- Boolean

print(message)
print(age)
print(isProgramming)

----------
-- Control Structures

-- Control structures in Lua
local x = 10

if x > 5 then
    print("x is greater than 5")
else
    print("x is less than or equal to 5")
end

for i = 1, 3 do
    print("Iteration " .. i)
end

local count = 0
while count < 3 do
    print("Count: " .. count)
    count = count + 1
end

--[[ Output
    x is greater than 5
    Iteration 1
    Iteration 2
    Iteration 3
    Count: 0
    Count: 1
    Count: 2
]]

----------
-- Logical Operators

-- if-else with logical operators in Lua
local temperature = 25

if temperature > 30 then
    print("It's hot!")
elseif temperature > 20 and temperature <= 30 then
    print("It's warm.")
else
    print("It's cool.")
end

--[[ Output:
    It's warm.
]]

local x = 5
local y = 10

if x ~= y then
    print("x is not equal to y")
else
    print("x is equal to y")
end

--[[ Output:
    x is not equal to y
]]

----------
-- Arrays, for and ipairs()

-- for loop with arrays in Lua
local fruits = { "apple", "banana", "orange" }

for i, fruit in ipairs(fruits) do
    print("Index: " .. i .. ", Fruit: " .. fruit)
end

--[[ Output:
    Index: 1, Fruit: apple
    Index: 2, Fruit: banana
    Index: 3, Fruit: orange
]]

----------
-- while through tables with next()

-- while loop with tables in Lua
local person = { name = "John", age = 30, occupation = "developer" }
local key, value

-- Iterate through table using pairs
while next(person, key) do
    key, value = next(person, key)
    print(key .. ": " .. tostring(value))
end

--[[ Output:
    name: John
    age: 30
    occupation: developer
]]


----------
-- Functions

-- Basic function in Lua
function greet(name)
    return "Hello, " .. name .. "!"
end

local message = greet("Alice")
print(message) -- Output: Hello, Alice!

----------
-- Closures

-- Anonymous function and closure in Lua
local multiplier = function(x)
    local factor = 2
    return x * factor
end

print(multiplier(5)) -- Output: 10

---------
-- Functions as a parameter

-- Function as a parameter in Lua
function operate(a, b, operation)
    return operation(a, b)
end

local result = operate(3, 4, function(x, y)
    return x + y
end)

print(result) -- Output: 7


---------
-- Tables

-- Basic table in Lua
local person = {
    name = "Alice",
    age = 25,
    occupation = "Engineer"
}

print(person.name) -- Output: Alice
print(person.age)  -- Output: 25


-----------
-- Metatables

-- Metatables in Lua
local rectangle = { width = 10, height = 20 }

-- Metatable with a custom __tostring function
local metatable = {
    __tostring = function(rect)
        return "Rectangle: width = " .. rect.width .. ", height = " .. rect.height
    end
}

setmetatable(rectangle, metatable)

-- Now, when we use print on the table, the __tostring function is invoked
print(rectangle) -- Output: Rectangle: width = 10, height = 20


----------
-- Reserved functions in metatables

-- __tostring metatable example
local rectangle = { width = 10, height = 20 }
local metatable = {
    __tostring = function(rect)
        return "Rectangle: width = " .. rect.width .. ", height = " .. rect.height
    end
}
setmetatable(rectangle, metatable)
print(rectangle) -- Output: Rectangle: width = 10, height = 20

-- __index metatable example
local superhero = { name = "Superman" }
local powers = { flight = true, strength = true }

setmetatable(superhero, {
    __index = function(table, key)
        return powers[key]
    end
})

print(superhero.flight) -- Output: true

-- __newindex metatable example
local person = { name = "Alice", age = 25 }
setmetatable(person, {
    __newindex = function(table, key, value)
        print("Assignment not allowed:", key, value)
    end
})

person.salary = 50000 -- Output: Assignment not allowed: salary 50000

-- __call metatable example
local counter = setmetatable({ value = 0 }, {
    __call = function(self, amount)
        self.value = self.value + amount
        return self.value
    end
})

print(counter(5)) -- Output: 5
print(counter(3)) -- Output: 8
