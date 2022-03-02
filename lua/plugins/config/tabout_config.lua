local tabout = require('tabout')

tabout.setup {
  completion = true,
  ignore_beginning = true,
  act_as_tab = true,
  act_as_shift_tab = true,
  tabkey = '<Tab>',
  backwards_tabkey = '<S-Tab>',
  tabouts = {
    {open = "'", close = "'"},
    {open = "(", close = ")"},
    {open = "[", close = "]"},
    {open = "{", close = "}"},
    {open = "<", close = ">"},
    {open = '"', close = '"'},
    {open = "`", close = "`"},
  }
}
