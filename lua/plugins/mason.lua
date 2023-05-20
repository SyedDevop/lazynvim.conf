return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = { eslint = {}, pyright = {}, sourcery = {} },
      setup = {
        eslint = function()
          require("lazyvim.util").on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      }, -- end of eslint
    },
  },
}
