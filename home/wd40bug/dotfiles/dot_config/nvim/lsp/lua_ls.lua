return {
  settings = {
    Lua = {
      workspace = {
        checkThirdParty = false,
        -- REMOVE 'ignoreDir' or set it to an empty table
        ignoreDir = {},
      },
      format = {
        enable = true,
        defaultConfig = {
          quote_style = 'single'
        }
      },
      completion = {
        enable = true,
        callSnippet = 'Both'
      }
    }
  }
}
