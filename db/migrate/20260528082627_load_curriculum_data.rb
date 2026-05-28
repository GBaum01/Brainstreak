class LoadCurriculumData < ActiveRecord::Migration[8.1]
  def up
    # ---------------------------------------------------
    # YEAR GROUPS
    # ---------------------------------------------------
    year2 = YearGroup.create!(name: "Year 2")
    year3 = YearGroup.create!(name: "Year 3")
    year4 = YearGroup.create!(name: "Year 4")
    year5 = YearGroup.create!(name: "Year 5")

    # ---------------------------------------------------
    # TOPICS
    # ---------------------------------------------------

    # Year 3
    t1  = Topic.create!(name: "Number and Place Value",      year_group: year3)
    t2  = Topic.create!(name: "Addition and Subtraction",    year_group: year3)
    t3  = Topic.create!(name: "Multiplication and Division", year_group: year3)
    t4  = Topic.create!(name: "Fractions",                   year_group: year3)

    # Year 4
    t5  = Topic.create!(name: "Number and Place Value",      year_group: year4)
    t6  = Topic.create!(name: "Addition and Subtraction",    year_group: year4)
    t7  = Topic.create!(name: "Multiplication and Division", year_group: year4)
    t8  = Topic.create!(name: "Fractions and Decimals",      year_group: year4)

    # Year 5
    t9  = Topic.create!(name: "Number and Place Value",      year_group: year5)
    t10 = Topic.create!(name: "Operations",                  year_group: year5)
    t11 = Topic.create!(name: "Fractions",                   year_group: year5)
    t12 = Topic.create!(name: "Decimals and Percentages",    year_group: year5)

    # ---------------------------------------------------
    # LEVELS
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
  end

  def down
    # Rolls back if migration is reversed
    Level.destroy_all
    Topic.destroy_all
    YearGroup.destroy_all
  end
end
