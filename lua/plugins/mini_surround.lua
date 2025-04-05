---@type LazyPluginSpec
return {
  "echasnovski/mini.surround",
  opts = function(_, opts)
    opts.custom_surroundings = {
      h = {
        input = { "%b<>", "^<().-()%s*>.*</.->$" },
        output = function()
          local tag = MiniSurround.user_input("Enter HTML tag: ")
          if tag == nil then
            return nil
          end
          return { left = "<" .. tag .. ">", right = "</" .. tag .. ">" }
        end,
      },
    }
  end,
}
