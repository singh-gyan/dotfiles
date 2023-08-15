lvim.autocommands = {

  { "ModeChanged",
    {
      pattern = "[vV\x16]*:*",

      command = "BlamerShow"

    } },
  {
    "ModeChanged",
    {
      pattern = "*:[vV\x16]*",
      command = "BlamerHide"
    },
  },
}
