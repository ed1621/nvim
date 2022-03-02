local shebang = function()
  print("#!/bin/bash")
end

local dir = function()
  print('$( cd "$( dirname \"${BASH_SOURCE[0]}\" )" &> /dev/null && pwd )')
end

