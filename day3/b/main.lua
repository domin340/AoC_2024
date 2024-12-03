-- OUTPUT = 63013756

--- reads whole file and return its content or nil on error
local function readFile(fileName)
  local file = io.open(fileName, "r")
  if not file then
    return nil
  end
  local content = file:read("a")
  file:close()
  return content
end

-- all regex needed to complete the challenge
local mulRegex = "mul%((%d+),(%d+)%)"
local onRegex = "do()%("
local offRegex = "don't()%("

--- finds first do() inside a text from startPos
local function findOn(text, startPos)
  local _, last = string.find(text, onRegex, startPos)
  return last
end

-- handle IO operations with the file
local fileName = "./sample.txt"
local data = readFile(fileName)
if not data then
  error("file does not exist", 5)
end

local sum = 0

local on = true
local lastIndex = 0

while true do
  -- if the ignoring is off continue finding matches else find first do() function and update index
  if on then
    -- find match position if nil return to avoid unnecessary iterations
    local matchPos, _ = string.find(data, mulRegex, lastIndex)
    if not matchPos then
      break
    end
    local offPos = string.find(data, offRegex, lastIndex)
    -- compare the positions if the switch off is found first then turn on ignoring
    if offPos and offPos < matchPos then
      on = false
      lastIndex = offPos + 1
    else
      -- handle match
      lastIndex = matchPos + 1
      local first, last = string.match(data, mulRegex, matchPos)
      sum = sum + first * last
    end
  else
    -- find first do() function
    local onPos = findOn(data, lastIndex)
    if not onPos then
      break
    end
    on = true
    lastIndex = onPos
  end
end

print(sum)
