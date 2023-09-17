require('onedark').setup {


 transparent = true,
 style = 'deep',
     colors = {
    Black = "#282c34",    -- define a new color
    White = '#abb2bf',
    Light_red = '#e06c75',
    Dark_red = '#be5046',
    Green = '#8bcd5b',
    Light_yellow = '#e5c07b',
    Dark_yellow = '#fff',
    Blue = '#3785c8',
    Magenta = '#c678dd',
    Cyan = '#56b6c2',
    Grey = '#4b5263',
    Comment_grey = '#5c6370'
  },
  highlights = {
    ["@function"] = {fg = '$Magenta', },
    ["@include"] = {fg = '$Light_red'},
    ["@tag"] = {fg = '$Light_red'},
    ["@tag.delimiter"] = {fg ='$White'},
    ["@constructor"] = {fg = '$Blue', fmt = "bold"},
    ["@keyword.function"] = {fg = '$Light_red', fmt = "bold"},
    ["@keyword.operator"] = {fg = '$Magenta'},
    ["@keyword"] = {fg = '$Light_red'}
  }

}
require('onedark').load()
