Nâu Dotfiles
============
A set of recommended OS and tooling configurations for Nau team.

SublimeText
-------------
Our conventional IDE for Front End development is SubLime Text 3.
Inside this folders are predefined snippets and settings for it:

### JavaScript
The files in this folder can be classified into these categories:

#### Completions Files:
Sublime Text [completions files](http://sublime-text-unofficial-documentation.readthedocs.org/en/latest/reference/completions.html) (.sublime-completions) are dictionaries that keep a set of auto completion texts. 

- __JavaScript.sublime-completions__: Auto completions for vanilla JavaScript language
    Note: We are considering the ST package __JavaScript Completions__ to replace this completion file.
- __jQuery.sublime-completions__: Auto completions for jQuery API

#### Snippets:
[Snippets](http://sublime-text-unofficial-documentation.readthedocs.org/en/latest/extensibility/snippets.html) are like completion files but they deal with single entry and have higher priority when displayed in the completion list.

Some remarkable snippets:

- __console.log()__: Trigger by typing `log`; after it completes the text, you have the chance to switch to `console.info()` or `console.warn()` or `console.error()` by typing the first letter of the method, respectively __i, w, e__
- __[IIFE](http://benalman.com/news/2010/11/immediately-invoked-function-expression/) block__: Trigger `iife`; complete the "immediately invoked function expression" block.
- __[JSHint](http://jshint.com/) by-project config__: Trigger by `jshintrc` in new text file; it will complete the file with Nau's conventional linting rules for JavaScript. Save it to the root of the project.
- __[JSCS](http://jscs.info/) coding style config__: Trigger by `jscsrc` in new text file; it will complete the file with Nau's coding style rules for JavaScript. Save it to the root of the project.
- __[RequireJS](http://requirejs.org/docs/api.html#cjsmodule) Module with Simplified CommonJS Wrapper__: Trigger by `define`. This is our recommended AMD syntax where the dependencies are imported by a `require` function which makes it similar to NodeJS modules and a convenience to add / remove dependencies.

Please check out other snippets in the folder to learn what's available.

### User
Some other general config for ST3:

#### Default Sublime Text Plugin List:
Defined in __Package Control.sublime-settings__. It is our recommended list of ST3 plugins for Front End development; includes:

- [Alignment](https://github.com/wbond/sublime_alignment): Help align code for better readability (especially in long properties list). Shortcut has been switch to `ctrl + shift + a` due to conflicts with SublimeLinter
- [All Autocomplete](https://github.com/alienhard/SublimeAllAutocomplete): List and suggest completion for all the words appeared in opened files
- [Color Highlighter](): is a plugin for the Sublime text 2 and 3, which underlays selected hexadecimal colorcodes (like "#FFFFFF", "rgb(255,255,255)", "white", etc.) with their real color. Also, plugin adds color picker to easily modify colors.
- [CSS3](https://github.com/y0ssar1an/CSS3): The most complete CSS support for Sublime Text 3
- [DocBlockr](https://github.com/spadgos/sublime-jsdocs): Simplifies writing DocBlock comments in Javascript, PHP, CoffeeScript, Actionscript...
- [EditorConfig](https://github.com/sindresorhus/editorconfig-sublime): Helps developers maintain consistent coding styles between different editors. See `.editorconfig` snippet.
- [Emmet](http://emmet.io/): Previously known as Zen Coding. Greatly enhance HTML & CSS workflow.
- [FuzzyFilePath](https://github.com/sagold/FuzzyFilePath): Autocomplete relative or absolute file paths in Sublime Text project folder. Similar to AutoFileName but with fuzzy search capability.
- [GitGutter](http://www.jisaacks.com/gitgutter): A [ST3] plugin to see git diff in gutter
- [Handlebars](https://github.com/daaain/Handlebars/): [ST3] package for Handlebars.js templates
- [Hex to HSL Color Converter](https://github.com/atadams/Hex-to-HSL-Color): plugin to convert CSS Hex colors to HSL
- [HTML-CSS-JS Prettify](https://github.com/victorporof/Sublime-HTMLPrettify): HTML, CSS, JavaScript and JSON code formatter for Sublime Text 2 and 3 via node.js
- [JavaScriptNext - ES6 Syntax](https://github.com/Benvie/JavaScriptNext.tmLanguage): Better JavaScript language definition for TextMate and SublimeText, with support for latest ES5 & 6 sepcifications. Set `.js` files to always open with this syntax.
- [Open Finder](https://github.com/kallepersson/Sublime-Finder/): (OSX only) Provides a command for opening Finder in the current directory.
- [Package Control](https://packagecontrol.io): The de facto package manager for Sublime Text. You already used it to install other plugins.
- [Pretty JSON](https://github.com/dzhibas/SublimePrettyJson): plugin for [ST3] to pretty [and minify] json
- [PxToEm](https://github.com/ningbit/sublime_pxtoem): plugin to convert px to em with comments. Shortcut was changed to `Shift + Ctrl + E` to avoid linter conflicts.
- [ReactJS](https://github.com/reactjs/sublime-react): Sublime Text helpers for React/JSX
- [SCSS](https://github.com/MarioRicalde/SCSS.tmbundle): The TextMate SCSS Official Bundle. Now Compatible with SublimeText2/3.
- [Select Quoted](https://github.com/int3h/SublimeSelectQuoted): A Sublime Text 2/3 plugin at add a "Expand Selection to Quoted" command
- [SublimeLinter](http://sublimelinter.com/): Interactive (real time feedback) code linting framework for Sublime Text 3. This is just the base framework, additional packages for related languages need to be installed.
- [SublimeLinter-contrib-scss-lint](https://github.com/attenzione/SublimeLinter-scss-lint): SublimeLinter plugin for Sass scss syntax, using the Ruby gem backend `scss-lint`
- [SublimeLinter-csslint](https://github.com/SublimeLinter/SublimeLinter-csslint): SublimeLinter plugin for CSS, using NodeJS package `csslint`.
- [SublimeLinter-jscs](https://github.com/mdevils/node-jscs/): SublimeLinter 3 plugin for NodeJS package `jscs`, a code style checking tool.
- [SublimeLinter-jshint](https://github.com/SublimeLinter/SublimeLinter-jshint): SublimeLinter plugin for JavaScript, using NodeJS package `jshint`.
- [SublimeLinter-json](https://github.com/SublimeLinter/SublimeLinter-json): SublimeLinter plugin for JSON. 
- [SublimeLinter-jsxhint](https://github.com/SublimeLinter/SublimeLinter-jsxhint): SublimeLinter 3 plugin for JSX (React.js), using the NodeJS package `jsxhint`. 
- [Terminal](http://wbond.net/sublime_packages/terminal): Launch terminals from the current file or the root project folder

#### EditorConfig
[EditorConfig](http://editorconfig.org/) helps developers define and seamlessly maintain consistent coding styles between different editors and IDEs. Most of the time, the concerned preferences are new line format, indentation rules for each kind of source files.

- __editorconfig.sublime-snippet__: Trigger by `editorconfig` in new text file; default set of config to maintain editor's preferences for a specific project; save it at project root and should be checked into version control system.

#### Keybindings Modifiers
[TBC] 


#### Other Preferences

##### Preferences
[TBC]

##### Emmet
[TBC]

##### FuzzyFilePath
[TBC]


OSX
---

### The Initialize Scripts
[TBC]

### Terminal Helpers

#### What are they
```
.aliases    
.bashrc     
.jshintrc
.bash_profile   
.functions
```

#### How to install
[TBC]

#### How to use
[TBC]

Ubuntu
------
Ubuntu is not our official working machines yet. 
These dotfiles and bash profile configs are for personal machines.


