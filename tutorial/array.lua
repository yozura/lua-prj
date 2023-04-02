local fruits = {"apple", "banana", "kiwi"}

-- Add Element
table.insert(fruits, "grape")

-- Access Element
print(fruits[1]) -- apple

-- Length of Array
print(#fruits) -- 4

-- Traversing the Array
for i, fruit in ipairs(fruits) do
    print(i, fruit)
end
