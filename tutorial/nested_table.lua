local school = {
    name = "Central High School",
    classes = {
        {
            name = "Math",
            teacher = "Mrs. Smith",
            students = {"Alice", "Bob", "Charlie"}
        },
        {
            name = "History",
            teacher = "Mr. Johnson",
            students = {"David", "Emily", "Frank"}
        }
    }
}

-- Add Element
table.insert(school.classes[1].students, "Grace")

-- Access Element
print(school.classes[1].name) -- Math

-- Traversing the nested table
for _, class in ipairs(school.classes) do
    print("Class:", class.name)
    print("Teacher:", class.teacher)
    for _, student in ipairs(class.students) do
        print("Student:", student)
    end
    print()
end
