--- method to split string on space
local function splitSentence(str, middleware)
  local words = {}
  for word in string.gmatch(str, "%w+") do
    table.insert(words, middleware(word))
  end
  return words
end

--- checks if the value ranges in range
local function hasRange(distance, range)
  return distance >= 0 and distance <= range
end

--- determines whenever the report is safe
local function isSafe(tbl)
  -- if the size is less or equal to 2 then it's surely ordered
  if #tbl <= 2 then
    return true
  end
  -- check if the distance ranges in range
  local firstDistance = tbl[2] - tbl[1]
  local absFirstDistance = math.abs(firstDistance)
  if not hasRange(absFirstDistance, 3) then
    return false
  end
  -- returns 1 on ascending and -1 on descending
  local isAscending = firstDistance / math.abs(firstDistance)
  for i = 1, #tbl - 1 do
    local distance = tbl[i + 1] - tbl[i]
    local absDistance = math.abs(distance)
    -- validation if the order is still the same and the value ranges in range
    if
      distance / absDistance ~= isAscending or
      not hasRange(absDistance, 3)
    then
      return false
    end
  end
  return true
end

-- define where the input file is
local fileName = "sample.txt"

--- creates shallow copy of a table
local function copyTable(tbl)
  local copy = {}
  for i = 1, #tbl do
    table.insert(copy, tbl[i])
  end
  return copy
end

-- output
local safeReports = 0

for line in io.lines(fileName) do
  local nums = splitSentence(line, tonumber)
  if isSafe(nums) then
    safeReports = safeReports + 1
  else
    -- check for any possibility
    for i = 1, #nums do
      -- check if copied table is safe without a value of index
      local copy = copyTable(nums)
      table.remove(copy, i)
      if isSafe(copy) then
        safeReports = safeReports + 1
        break
      end
    end
  end
end

print(safeReports)
