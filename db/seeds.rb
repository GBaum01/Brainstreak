# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Copy the seed file

# db/seeds.rb

puts "🌱 Clearing existing data..."

Question.destroy_all
Practice.destroy_all
Level.destroy_all
Module.destroy_all
Child.destroy_all
year_group_id.destroy_all

puts "✅ Existing data cleared"

# ---------------------------------------------------
# YEAR GROUP
# ---------------------------------------------------

year2 = year_group_id.create!(
  name: "Year 2",
  position: 2
)

puts "✅ Year Group created"

# ---------------------------------------------------
# MODULE
# ---------------------------------------------------

maths_module = Module.create!(
  name: "Year 2 Mathematics",
  position: 1,
  id_year_group: year2.id
)

puts "✅ Module created"

# ---------------------------------------------------
# LEVELS
# ---------------------------------------------------

levels = [
  { level: 1, name: "Easy" },
  { level: 2, name: "Easy-Medium" },
  { level: 3, name: "Medium" },
  { level: 4, name: "Medium-Hard" },
  { level: 5, name: "Hard" }
]

created_levels = []

levels.each do |lvl|
  level = Level.create!(
    id_Modules: maths_module.id,
    id_Practice: nil
  )

  created_levels << {
    record: level,
    metadata: lvl
  }
end

puts "✅ Levels created"

# ---------------------------------------------------
# QUESTION HELPER
# ---------------------------------------------------

def create_question(
  practice:,
  question_text:,
  option_a:,
  option_b:,
  option_c:,
  option_d:,
  correct_answer:,
  explanation:
)

  Question.create!(
    question: question_text,
    option_a: option_a,
    option_b: option_b,
    option_c: option_c,
    option_d: option_d,
    correct_answer: correct_answer,
    id_Practice: practice.id,
    status: "active",
    explanation: explanation
  )
end

# ---------------------------------------------------
# PRACTICE + QUESTIONS
# 3 PRACTICES PER LEVEL
# 10 QUESTIONS EACH
# ---------------------------------------------------

created_levels.each do |lvl_data|

  level_number = lvl_data[:metadata][:level]

  3.times do |practice_index|

    practice = Practice.create!(
      id_Child: nil,
      Score: 0,
      status: "active",
      id_Levels: lvl_data[:record].id
    )

    puts "✅ Practice created for Level #{level_number}"

    # ---------------------------------------------------
    # LEVEL 1 — EASY
    # ---------------------------------------------------

    if level_number == 1

      questions = [
        {
          q: "What is 2 + 3?",
          a: "5",
          b: "4",
          c: "6",
          d: "7",
          correct: "5",
          explanation: "2 + 3 = 5"
        },
        {
          q: "What is 10 - 4?",
          a: "5",
          b: "6",
          c: "7",
          d: "8",
          correct: "6",
          explanation: "10 - 4 = 6"
        },
        {
          q: "How many sides does a triangle have?",
          a: "3",
          b: "4",
          c: "5",
          d: "6",
          correct: "3",
          explanation: "Triangles have 3 sides."
        },
        {
          q: "What is 5 + 5?",
          a: "9",
          b: "8",
          c: "10",
          d: "11",
          correct: "10",
          explanation: "5 + 5 = 10"
        },
        {
          q: "What number comes after 19?",
          a: "18",
          b: "20",
          c: "21",
          d: "17",
          correct: "20",
          explanation: "20 comes after 19."
        },
        {
          q: "What is 7 - 2?",
          a: "5",
          b: "4",
          c: "3",
          d: "6",
          correct: "5",
          explanation: "7 - 2 = 5"
        },
        {
          q: "How many cents in $1?",
          a: "10",
          b: "50",
          c: "100",
          d: "25",
          correct: "100",
          explanation: "$1 equals 100 cents."
        },
        {
          q: "What is double 4?",
          a: "6",
          b: "8",
          c: "10",
          d: "12",
          correct: "8",
          explanation: "Double 4 is 8."
        },
        {
          q: "Which shape is round?",
          a: "Square",
          b: "Triangle",
          c: "Circle",
          d: "Rectangle",
          correct: "Circle",
          explanation: "A circle is round."
        },
        {
          q: "What is 1 more than 14?",
          a: "13",
          b: "14",
          c: "15",
          d: "16",
          correct: "15",
          explanation: "14 + 1 = 15"
        }
      ]

    # ---------------------------------------------------
    # LEVEL 2 — EASY MEDIUM
    # ---------------------------------------------------

    elsif level_number == 2

      questions = [
        {
          q: "What is 14 + 6?",
          a: "18",
          b: "20",
          c: "21",
          d: "22",
          correct: "20",
          explanation: "14 + 6 = 20"
        },
        {
          q: "What is 25 - 9?",
          a: "16",
          b: "15",
          c: "14",
          d: "17",
          correct: "16",
          explanation: "25 - 9 = 16"
        },
        {
          q: "What is 5 groups of 2?",
          a: "7",
          b: "8",
          c: "10",
          d: "12",
          correct: "10",
          explanation: "5 × 2 = 10"
        },
        {
          q: "How many minutes in 1 hour?",
          a: "30",
          b: "60",
          c: "100",
          d: "24",
          correct: "60",
          explanation: "1 hour = 60 minutes"
        },
        {
          q: "What is 30 + 12?",
          a: "40",
          b: "41",
          c: "42",
          d: "43",
          correct: "42",
          explanation: "30 + 12 = 42"
        },
        {
          q: "What is half of 18?",
          a: "8",
          b: "10",
          c: "9",
          d: "11",
          correct: "9",
          explanation: "18 ÷ 2 = 9"
        },
        {
          q: "How many sides does a rectangle have?",
          a: "3",
          b: "4",
          c: "5",
          d: "6",
          correct: "4",
          explanation: "Rectangles have 4 sides."
        },
        {
          q: "What is 45 - 20?",
          a: "20",
          b: "25",
          c: "30",
          d: "35",
          correct: "25",
          explanation: "45 - 20 = 25"
        },
        {
          q: "What coin is worth 50 cents?",
          a: "5c",
          b: "10c",
          c: "20c",
          d: "50c",
          correct: "50c",
          explanation: "The 50c coin is worth 50 cents."
        },
        {
          q: "What is 9 + 8?",
          a: "16",
          b: "17",
          c: "18",
          d: "19",
          correct: "17",
          explanation: "9 + 8 = 17"
        }
      ]

    # ---------------------------------------------------
    # LEVEL 3 — MEDIUM
    # ---------------------------------------------------

    elsif level_number == 3

      questions = [
        {
          q: "What is 34 + 27?",
          a: "61",
          b: "60",
          c: "59",
          d: "62",
          correct: "61",
          explanation: "34 + 27 = 61"
        },
        {
          q: "What is 70 - 26?",
          a: "44",
          b: "45",
          c: "46",
          d: "43",
          correct: "44",
          explanation: "70 - 26 = 44"
        },
        {
          q: "What is 4 × 3?",
          a: "7",
          b: "10",
          c: "12",
          d: "14",
          correct: "12",
          explanation: "4 × 3 = 12"
        },
        {
          q: "How many hours in a day?",
          a: "12",
          b: "18",
          c: "24",
          d: "30",
          correct: "24",
          explanation: "There are 24 hours in a day."
        },
        {
          q: "What is 90 - 45?",
          a: "40",
          b: "45",
          c: "50",
          d: "55",
          correct: "45",
          explanation: "90 - 45 = 45"
        },
        {
          q: "What is 6 + 17?",
          a: "21",
          b: "22",
          c: "23",
          d: "24",
          correct: "23",
          explanation: "6 + 17 = 23"
        },
        {
          q: "Which is heavier?",
          a: "Feather",
          b: "Brick",
          c: "Leaf",
          d: "Paper",
          correct: "Brick",
          explanation: "A brick is heavier."
        },
        {
          q: "What is 100 - 75?",
          a: "20",
          b: "25",
          c: "30",
          d: "35",
          correct: "25",
          explanation: "100 - 75 = 25"
        },
        {
          q: "What is double 15?",
          a: "20",
          b: "25",
          c: "30",
          d: "35",
          correct: "30",
          explanation: "15 × 2 = 30"
        },
        {
          q: "What is 8 × 2?",
          a: "14",
          b: "15",
          c: "16",
          d: "18",
          correct: "16",
          explanation: "8 × 2 = 16"
        }
      ]

    # ---------------------------------------------------
    # LEVEL 4 — MEDIUM HARD
    # ---------------------------------------------------

    elsif level_number == 4

      questions = [
        {
          q: "What is 56 + 29?",
          a: "84",
          b: "85",
          c: "86",
          d: "87",
          correct: "85",
          explanation: "56 + 29 = 85"
        },
        {
          q: "What is 84 - 37?",
          a: "46",
          b: "47",
          c: "48",
          d: "49",
          correct: "47",
          explanation: "84 - 37 = 47"
        },
        {
          q: "What is 7 × 3?",
          a: "18",
          b: "20",
          c: "21",
          d: "24",
          correct: "21",
          explanation: "7 × 3 = 21"
        },
        {
          q: "What is half of 50?",
          a: "20",
          b: "25",
          c: "30",
          d: "35",
          correct: "25",
          explanation: "50 ÷ 2 = 25"
        },
        {
          q: "What is 99 - 18?",
          a: "79",
          b: "80",
          c: "81",
          d: "82",
          correct: "81",
          explanation: "99 - 18 = 81"
        },
        {
          q: "What is 45 + 36?",
          a: "80",
          b: "81",
          c: "82",
          d: "83",
          correct: "81",
          explanation: "45 + 36 = 81"
        },
        {
          q: "What is 6 × 4?",
          a: "20",
          b: "22",
          c: "24",
          d: "26",
          correct: "24",
          explanation: "6 × 4 = 24"
        },
        {
          q: "How many months in a year?",
          a: "10",
          b: "11",
          c: "12",
          d: "13",
          correct: "12",
          explanation: "There are 12 months in a year."
        },
        {
          q: "What is 72 - 19?",
          a: "52",
          b: "53",
          c: "54",
          d: "55",
          correct: "53",
          explanation: "72 - 19 = 53"
        },
        {
          q: "What is 9 × 3?",
          a: "24",
          b: "25",
          c: "26",
          d: "27",
          correct: "27",
          explanation: "9 × 3 = 27"
        }
      ]

    # ---------------------------------------------------
    # LEVEL 5 — HARD
    # ---------------------------------------------------

    else

      questions = [
        {
          q: "What is 123 + 48?",
          a: "169",
          b: "170",
          c: "171",
          d: "172",
          correct: "171",
          explanation: "123 + 48 = 171"
        },
        {
          q: "What is 150 - 67?",
          a: "81",
          b: "82",
          c: "83",
          d: "84",
          correct: "83",
          explanation: "150 - 67 = 83"
        },
        {
          q: "What is 8 × 4?",
          a: "28",
          b: "30",
          c: "32",
          d: "36",
          correct: "32",
          explanation: "8 × 4 = 32"
        },
        {
          q: "What is 60 ÷ 2?",
          a: "20",
          b: "25",
          c: "30",
          d: "35",
          correct: "30",
          explanation: "60 ÷ 2 = 30"
        },
        {
          q: "What is 95 + 27?",
          a: "120",
          b: "121",
          c: "122",
          d: "123",
          correct: "122",
          explanation: "95 + 27 = 122"
        },
        {
          q: "What is 200 - 125?",
          a: "70",
          b: "75",
          c: "80",
          d: "85",
          correct: "75",
          explanation: "200 - 125 = 75"
        },
        {
          q: "What is 7 × 5?",
          a: "30",
          b: "32",
          c: "35",
          d: "40",
          correct: "35",
          explanation: "7 × 5 = 35"
        },
        {
          q: "If a pencil costs 25c, how much do 4 pencils cost?",
          a: "50c",
          b: "75c",
          c: "$1",
          d: "$2",
          correct: "$1",
          explanation: "25c × 4 = 100c = $1"
        },
        {
          q: "What is 11 × 2?",
          a: "20",
          b: "21",
          c: "22",
          d: "24",
          correct: "22",
          explanation: "11 × 2 = 22"
        },
        {
          q: "What is 144 - 88?",
          a: "54",
          b: "55",
          c: "56",
          d: "57",
          correct: "56",
          explanation: "144 - 88 = 56"
        }
      ]

    end

    questions.each do |q|
      create_question(
        practice: practice,
        question_text: q[:q],
        option_a: q[:a],
        option_b: q[:b],
        option_c: q[:c],
        option_d: q[:d],
        correct_answer: q[:correct],
        explanation: q[:explanation]
      )
    end

  end
end

puts "🎉 Seed complete!"
puts "Created:"
puts "- 1 Year Group"
puts "- 1 Maths Module"
puts "- 5 Difficulty Levels"
puts "- 15 Practice Sessions"
puts "- 150 Multiple Choice Questions"
