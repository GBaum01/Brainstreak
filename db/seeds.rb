# ---------------------------------------------------
# CLEAR EXISTING DATA
# ---------------------------------------------------

YearGroup.destroy_all
User.destroy_all
Student.destroy_all

puts "✅ Existing data cleared"

# ---------------------------------------------------
# YEAR GROUPS
# ---------------------------------------------------

year2 = YearGroup.create!(
  name: "Year 2"
)

year3 = YearGroup.create!(
  name: "Year 3"
)

year4 = YearGroup.create!(
  name: "Year 4"
)

puts "✅ Year groups created"

puts "Creating user..."
gavin = User.create!(email: "gavin@gmail.com", username: "gavin", password: "secret")
puts "User created..."

puts "Creating student..."
Student.create!(
  name: "Johnny",
  year_group: year2,
  user: gavin
)
puts "Student Created..."
