local function driveLetter()
  local partition_letters = {}
  local handle = io.popen("wmic logicaldisk get caption")
  if handle == nil then
    return nil
  end
  for line in handle:lines() do
    print(line)
    local partition_letter = line:match("^([A-Z]:)")
    if partition_letter then
      table.insert(partition_letters, partition_letter)
    end
  end
  handle:close()
  return partition_letters
end

local function selectOption(options)
  if options == nil then
    return nil
  end
  local choice = vim.fn.inputlist(options)
  if choice < 1 or choice > #options then
    return nil
  end
  return options[choice]
end
return { driveLetter = driveLetter, selectOption = selectOption }
