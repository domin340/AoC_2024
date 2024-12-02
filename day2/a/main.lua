-- create a split method to split on space
local function splitSentence(str, middleware)
  local words = {}
  for word in string.gmatch(str, "%w+") do
    table.insert(words, middleware(word))
  end
  return words
end

-- define where the input file is
local fileName = "sample.txt"

-- the output
local safeReports = 0

local function isSequenceValid(isAsc, nums)
  local i = 1;
  repeat
    local next = nums[i + 1]
    local last = nums[i]
    local difference = math.abs(last - next)
    if
      difference > 3 or
      last == next or
      (not isAsc and last < next) or
      (isAsc and last > next)
    then
      return false
    end
    i = i + 1;
  until i > #nums - 1
  return true
end

-- read each file line
for line in io.lines(fileName) do
  -- split the text on space and turn string to number
  local nums = splitSentence(line, tonumber)
  -- check if first the first sequence starts ascendically
  local isAsc = nums[1] < nums[2]
  if isSequenceValid(isAsc, nums) then
    safeReports = safeReports + 1
  end
end

print(safeReports)
