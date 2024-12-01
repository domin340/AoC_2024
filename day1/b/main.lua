local leftTable = {}
local rightTable = {}

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
  for j = 1, #rightTable do
    if curItem == rightTable[j] then
      occurrences = occurrences + 1
    end
  end
  sum = sum + curItem * occurrences
end

print(sum)
