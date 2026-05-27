# ---------------------------------------------------
# CLEAR EXISTING DATA
# ---------------------------------------------------

YearGroup.destroy_all

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
