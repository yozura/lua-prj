-- Define function 1
function add(a, b)
    return a + b
end

-- Define function 2 (Variable)
local sub = function(a, b)
    return a - b
end

-- Define function 3
local function multiply(a, b)
    return a * b
end

-- Define function 4 (Argument)
local function operation(func, a, b)
    return func(a, b)
end

-- Call function
local c = add(10, 20)   -- 30
print(add(c, 50))       -- 80

local d = sub(10, 20)
print(d)                -- -10

local f = operation(multiply, c, d)
print(f)                -- -300
