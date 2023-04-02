local person = {
    name = "John",
    age = 25,
    job = "Developer"
}

-- Add Element
person.country = "USA"

-- Access Element
print(person.name)

-- Traversing of dictionary
for key, value in pairs(person) do
    print(key, value)
end
