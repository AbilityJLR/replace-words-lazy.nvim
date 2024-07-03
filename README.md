# ⚡️ replace-words-lazy.nvim
This plugin replaces the word under the cursor and changes it throughout the current file.
It's just using `:%s/word_to_replace/word_that_want_to_replace`, though. But I made it more convenient.

![watchers](https://custom-icon-badges.demolab.com/github/watchers/AbilityJLR/replace-words-lazyvim?logo=eye&style=social&logoColor=black)
![](https://custom-icon-badges.demolab.com/github/stars/AbilityJLR/replace-words-lazyvim?logo=star&style=social&logoColor=black)
![license](https://custom-icon-badges.demolab.com/github/license/AbilityJLR/replace-words-lazyvim?logo=law&logoColor=white)
![](https://custom-icon-badges.demolab.com/github/issues-pr-closed/AbilityJLR/replace-words-lazyvim?color=purple&logo=git-pull-request&logoColor=white)
![](https://custom-icon-badges.demolab.com/github/issues-raw/AbilityJLR/replace-words-lazyvim?logo=issue)
![](https://custom-icon-badges.demolab.com/github/v/tag/AbilityJLR/replace-words-lazyvim?logo=tag&logoColor=white)

## 📖 Table of Contents 
- [Demo](#demo) 👨🏻‍💻
- [Installation](#installation) 🛠️
- [Usage](#usage) 🚀
- [License](#license) ⚖️

## 👨🏻‍💻 Demo 

![demo2](https://github.com/AbilityJLR/replace-words-lazy.nvim/assets/71693169/48e15ab9-6c28-47fc-91a6-aacfc23544d4)

## 🛠️ Installation 
   ### ⚠️ Use just one of the following methods:
   
   1. Install with Bash Script
         - Open the terminal
         - Copy the bash code below
           
            ```
               mkdir -p ~/.config/nvim/lua/plugins/replace-words && echo 'return { { "AbilityJLR/replace-words-lazy.nvim" } }' > ~/.config/nvim/lua/plugins/replace-words/init.lua
            ```
         - Paste it into your terminal
         - Press Enter
           
   ### Or Alternatively
   
   2. Install Manually<br>
      Navigate to the directory:<br>
   `cd ~/.config/nvim/lua/plugins`<br>
   Create the `replace-words` folder:<br>
   `mkdir replace-words`<br>
   Create the `init.lua` file:<br>
   `touch replace-words/init.lua`
      Then, copy
      
      ```
         return {
          { "AbilityJLR/replace-words-lazy.nvim" }
         }
      ```
      and paste the code into `replace-words/init.lua`
   
## 🚀 Usage 

Press `<leader>cw` in normal mode over the word that you want to change.

<!-- will add this below function later -->
<!-- Alternatively, you can modify this line at the very bottom of the `/lua/replace-words.lua` file:
`vim.keymap.set("n", "<leader>cw", function()` to change any key you want. -->

## ⚖️ License 

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
