-- OUTPUT = 1970720

local leftTable = {}
local rightTable = {}

-- read whole file in order to split it into 2 lists
for line in io.lines("./sample.txt") do
  for left, right in string.gmatch(line, "(%d+)%s+(%d+)") do
    table.insert(leftTable, left)
    table.insert(rightTable, right)
  end
end

-- sort them ascendically in order to compare smallest to smallest
table.sort(leftTable)
table.sort(rightTable)

local sum = 0;
for i = 1, #leftTable do
  local leftItem = leftTable[i]
  local rightItem = rightTable[i]
  -- calculate the total distance and sum it up
  sum = sum + math.abs(leftItem - rightItem)
end

print(sum)