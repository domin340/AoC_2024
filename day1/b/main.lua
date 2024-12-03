-- OUTPUT = 17191599

local leftTable = {}
local rightTable = {}

-- read whole file in order to split it into 2 lists
for line in io.lines("./sample.txt") do
  for left, right in string.gmatch(line, "(%d+)%s+(%d+)") do
    table.insert(leftTable, tonumber(left))
    table.insert(rightTable, tonumber(right))
  end
end

local sum = 0;
for i = 1, #leftTable do
  local occurrences = 0;
  local curItem = leftTable[i]
  -- find all ocurrences of left table item in right table
  for j = 1, #rightTable do
    if curItem == rightTable[j] then
      occurrences = occurrences + 1
    end
  end
  sum = sum + curItem * occurrences
end

print(sum)
