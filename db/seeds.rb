# ---------------------------------------------------
# CLEAR EXISTING DATA (only test data, not curriculum)
# ---------------------------------------------------
puts "🌱 Clearing existing data..."
Question.destroy_all
Practice.destroy_all
Student.destroy_all
User.destroy_all

puts "✅ Existing data cleared"

# ---------------------------------------------------
# YEAR GROUPS
# ---------------------------------------------------
year2 = YearGroup.find_or_create_by!(name: "Year 2")
year3 = YearGroup.find_or_create_by!(name: "Year 3")
year4 = YearGroup.find_or_create_by!(name: "Year 4")
year5 = YearGroup.find_or_create_by!(name: "Year 5")

puts "✅ Year groups ready"

# ---------------------------------------------------
# TOPICS
# ---------------------------------------------------

# Year 3 Topics
t1  = Topic.where(name: "Number and Place Value",      year_group_id: year3.id).first_or_create!
t2  = Topic.where(name: "Addition and Subtraction",    year_group_id: year3.id).first_or_create!
t3  = Topic.where(name: "Multiplication and Division", year_group_id: year3.id).first_or_create!
t4  = Topic.where(name: "Fractions",                   year_group_id: year3.id).first_or_create!

# Year 4 Topics
t5  = Topic.where(name: "Number and Place Value",      year_group_id: year4.id).first_or_create!
t6  = Topic.where(name: "Addition and Subtraction",    year_group_id: year4.id).first_or_create!
t7  = Topic.where(name: "Multiplication and Division", year_group_id: year4.id).first_or_create!
t8  = Topic.where(name: "Fractions and Decimals",      year_group_id: year4.id).first_or_create!

# Year 5 Topics
t9  = Topic.where(name: "Number and Place Value",      year_group_id: year5.id).first_or_create!
t10 = Topic.where(name: "Operations",                  year_group_id: year5.id).first_or_create!
t11 = Topic.where(name: "Fractions",                   year_group_id: year5.id).first_or_create!
t12 = Topic.where(name: "Decimals and Percentages",    year_group_id: year5.id).first_or_create!

puts "✅ Topics ready"

# ---------------------------------------------------
# LEVELS
# ---------------------------------------------------

# Topic 1 — Year 3: Number and Place Value
Level.where(name: "Read and write numbers up to 10,000",     topic_id: t1.id).first_or_create!
Level.where(name: "Compare and order four-digit numbers",    topic_id: t1.id).first_or_create!
Level.where(name: "Partition numbers using place value",     topic_id: t1.id).first_or_create!
Level.where(name: "Count in 10s, 100s and 1000s",            topic_id: t1.id).first_or_create!
Level.where(name: "Round numbers to the nearest 10 and 100", topic_id: t1.id).first_or_create!

# Topic 2 — Year 3: Addition and Subtraction
Level.where(name: "Add two-digit and three-digit numbers",      topic_id: t2.id).first_or_create!
Level.where(name: "Subtract two-digit and three-digit numbers", topic_id: t2.id).first_or_create!
Level.where(name: "Solve addition word problems",               topic_id: t2.id).first_or_create!
Level.where(name: "Solve subtraction word problems",            topic_id: t2.id).first_or_create!
Level.where(name: "Use inverse operations to check answers",    topic_id: t2.id).first_or_create!

# Topic 3 — Year 3: Multiplication and Division
Level.where(name: "Recall 2, 5 and 10 times tables",                 topic_id: t3.id).first_or_create!
Level.where(name: "Recall 3 and 4 times tables",                     topic_id: t3.id).first_or_create!
Level.where(name: "Multiply one-digit numbers by two-digit numbers", topic_id: t3.id).first_or_create!
Level.where(name: "Divide numbers using equal groups",               topic_id: t3.id).first_or_create!
Level.where(name: "Solve multiplication and division word problems", topic_id: t3.id).first_or_create!

puts "✅ Levels ready"

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
student = Student.create!(name: "Alice", user: user, year_group: year3)

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
