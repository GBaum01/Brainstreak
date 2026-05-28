# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# ---------------------------------------------------
# CLEAR EXISTING DATA
# ---------------------------------------------------
puts "🌱 Clearing existing data..."
Question.destroy_all
Practice.destroy_all
Student.destroy_all
User.destroy_all
YearGroup.destroy_all

puts "✅ Existing data cleared"

# ---------------------------------------------------
# YEAR GROUPS
# ---------------------------------------------------
year2 = YearGroup.create!(name: "Year 2")
year3 = YearGroup.create!(name: "Year 3")
year4 = YearGroup.create!(name: "Year 4")

puts "✅ Year groups created"

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
