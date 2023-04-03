local person = {
    name = "John",
    age = 25,
    job = "Developer"
}

-- Add Element
person.country = "USA"

-- Access Element
print(person.name)
print(person["age"])

-- Remove Element
person.age = nil

-- Traversing of dictionary
for key, value in pairs(person) do
    print(key, value)
end

--[[
    name        john
    job         Developer
    country     USA
]]
