local function readFile(fileName)
  local file = io.open(fileName, "r")
  if not file then
    return nil
  end
  local content = file:read("a")
  file:close()
  return content
end

local fileName = "./simple.txt"
local data = readFile(fileName)
if not data then
  error("file does not exist", 5)
end

local sum = 0

local mulRegex = "mul%((%d+),(%d+)%)"
local onRegex = "do()"
local offRegex = "don't()"


