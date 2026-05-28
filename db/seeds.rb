# ---------------------------------------------------
# CLEAR EXISTING DATA
# ---------------------------------------------------
puts "🌱 Clearing existing data..."
Question.destroy_all
Practice.destroy_all
Student.destroy_all
User.destroy_all
Level.destroy_all
Topic.destroy_all
YearGroup.destroy_all

puts "✅ Existing data cleared"

# ---------------------------------------------------
# YEAR GROUPS (keeping Year 2 from before, adding Year 5 from sheet)
# ---------------------------------------------------
year2 = YearGroup.create!(name: "Year 2")
year3 = YearGroup.create!(name: "Year 3")
year4 = YearGroup.create!(name: "Year 4")
year5 = YearGroup.create!(name: "Year 5")

puts "✅ Year groups created"

# ---------------------------------------------------
# TOPICS
# ---------------------------------------------------

# Year 3 Topics
t1  = Topic.create!(name: "Number and Place Value",      year_group: year3)
t2  = Topic.create!(name: "Addition and Subtraction",    year_group: year3)
t3  = Topic.create!(name: "Multiplication and Division", year_group: year3)
t4  = Topic.create!(name: "Fractions",                   year_group: year3)

# Year 4 Topics
t5  = Topic.create!(name: "Number and Place Value",      year_group: year4)
t6  = Topic.create!(name: "Addition and Subtraction",    year_group: year4)
t7  = Topic.create!(name: "Multiplication and Division", year_group: year4)
t8  = Topic.create!(name: "Fractions and Decimals",      year_group: year4)

# Year 5 Topics
t9  = Topic.create!(name: "Number and Place Value",      year_group: year5)
t10 = Topic.create!(name: "Operations",                  year_group: year5)
t11 = Topic.create!(name: "Fractions",                   year_group: year5)
t12 = Topic.create!(name: "Decimals and Percentages",    year_group: year5)

puts "✅ Topics created"

# ---------------------------------------------------
# LEVELS (Learning Objectives)
# ---------------------------------------------------

# Topic 1 — Year 3: Number and Place Value
Level.create!(name: "Read and write numbers up to 10,000",     topic: t1)
Level.create!(name: "Compare and order four-digit numbers",    topic: t1)
Level.create!(name: "Partition numbers using place value",     topic: t1)
Level.create!(name: "Count in 10s, 100s and 1000s",            topic: t1)
Level.create!(name: "Round numbers to the nearest 10 and 100", topic: t1)

# Topic 2 — Year 3: Addition and Subtraction
Level.create!(name: "Add two-digit and three-digit numbers",      topic: t2)
Level.create!(name: "Subtract two-digit and three-digit numbers", topic: t2)
Level.create!(name: "Solve addition word problems",               topic: t2)
Level.create!(name: "Solve subtraction word problems",            topic: t2)
Level.create!(name: "Use inverse operations to check answers",    topic: t2)

# Topic 3 — Year 3: Multiplication and Division
Level.create!(name: "Recall 2, 5 and 10 times tables",                 topic: t3)
Level.create!(name: "Recall 3 and 4 times tables",                     topic: t3)
Level.create!(name: "Multiply one-digit numbers by two-digit numbers", topic: t3)
Level.create!(name: "Divide numbers using equal groups",               topic: t3)
Level.create!(name: "Solve multiplication and division word problems", topic: t3)

puts "✅ Levels created"

# ---------------------------------------------------
# USER
# ---------------------------------------------------
user = User.create!(
  username: "Smith",
  email: "Smith@brainstreak.com",
  password: "12345"
)

puts "✅ User created"

# ---------------------------------------------------
# STUDENT
# ---------------------------------------------------
student = Student.create!(name: "Alice", user: user, year_group: year2)

puts "✅ Student created"

# ---------------------------------------------------
# PRACTICES + QUESTIONS
# ---------------------------------------------------

# Practice 1 — 9 correct, 1 incorrect
practice1 = Practice.create!(student: student, score: 9, status: true)

9.times { Question.create!(practice: practice1, question: "What is 3 + 4?",  correct_answer: 7.0,  status: true)  }
1.times { Question.create!(practice: practice1, question: "What is 10 - 6?", correct_answer: 4.0,  status: false) }

# Practice 2 — 7 correct, 3 incorrect
practice2 = Practice.create!(student: student, score: 7, status: true)

7.times { Question.create!(practice: practice2, question: "What is 2 x 5?",  correct_answer: 10.0, status: true)  }
3.times { Question.create!(practice: practice2, question: "What is 12 / 4?", correct_answer: 3.0,  status: false) }

puts "✅ Practices and questions created"
puts "🌱 Seeding complete!"
