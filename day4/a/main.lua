--- returns all lines inside a file in a table
--- @return table
--- @param fileName string
local function readLines(fileName)
  local lines = {}
  for line in io.lines(fileName) do
    table.insert(lines, line)
  end
  return lines
end

--- returns the char of a string of provided index
--- @return string
--- @param str string
--- @param index number | integer
local function getChar(str, index)
  return string.char(string.byte(str, index))
end

local fileName = "./sample.txt"
local lines = readLines(fileName)
local width, height = #lines[1], #lines

-- horizontal = matrix[line_i][i]
-- vertical = matrix[i][line_i]
-- main diagonal = matrix[line_i][line_i] (outside second loop)
-- anti diagonal right = matrix[i + line_i][i]
-- anti diagonal left = matrix[i][i + line_i]
