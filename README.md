# ⚡️ replace-words-lazyvim
This plugin replaces the word under the cursor and changes it throughout the current file.
It's just using `:%s/word_to_replace/word_that_want_to_replace`, though. But I made it more convenient.

![watchers](https://custom-icon-badges.demolab.com/github/watchers/abilityjlr/replace-words-lazyvim?logo=eye&style=social&logoColor=black)
![](https://custom-icon-badges.demolab.com/github/stars/abilityjlr/replace-words-lazyvim?logo=star&style=social&logoColor=black)
![license](https://custom-icon-badges.demolab.com/github/license/abilityjlr/replace-words-lazyvim?logo=law&logoColor=white)
![](https://custom-icon-badges.demolab.com/github/issues-pr-closed/abilityjlr/replace-words-lazyvim?color=purple&logo=git-pull-request&logoColor=white)
![](https://custom-icon-badges.demolab.com/github/issues-raw/abilityjlr/replace-words-lazyvim?logo=issue)
![](https://custom-icon-badges.demolab.com/github/v/tag/abilityjlr/replace-words-lazyvim?logo=tag&logoColor=white)

## 📖 Table of Contents 
- [Demo](#demo) 👨🏻‍💻
- [Installation](#installation) 🛠️
- [Usage](#usage) 🚀
- [License](#license) ⚖️

## 👨🏻‍💻 Demo 

![replace-demo](https://github.com/AbilityJLR/replace-words-lazyvim/assets/71693169/f7b95e9f-b44f-4017-833c-12c069ae6af7)

## 🛠️ Installation 

   Navigate to the directory:<br>
   `cd ~/.config/nvim/lua`<br>
   `touch plugins.lua`

   Then, copy 
   ```
   return {
    { "AbilityJLR/replace-words-lazyvim" }
   }
   ```
   and paste the code into `plugins.lua`
   
## 🚀 Usage 

Press `<leader>cw` in normal mode over the word that you want to change.

<!-- will add this below function later -->
<!-- Alternatively, you can modify this line at the very bottom of the `/lua/replace-words.lua` file:
`vim.keymap.set("n", "<leader>cw", function()` to change any key you want. -->

## ⚖️ License 

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
