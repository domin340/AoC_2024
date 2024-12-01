--[[
  FIRST PROTOTYPE
  1. Read sample.txt
  2. Split it into 2 tables of {LEFT, RIGHT}
  3. Sort each one
  4. calculate the difference from subtracting max and min value
  5. sum up
]]

-- OUTPUT = 1970720

local leftTable = {}
local rightTable = {}

for line in io.lines("./sample.txt") do
  for left, right in string.gmatch(line, "(%d+)%s+(%d+)") do
    table.insert(leftTable, left)
    table.insert(rightTable, right)
  end
end

table.sort(leftTable)
table.sort(rightTable)

local sum = 0;
for i = 1, #leftTable do
  local leftItem = leftTable[i]
  local rightItem = rightTable[i]
  sum = sum + (math.max(rightItem, leftItem) - math.min(leftItem, rightItem))
end

print(sum)