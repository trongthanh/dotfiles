Nâu Dotfiles
============
A set of recommended OS and tooling configurations for Nau team.

OSX
---
These dotfiles are specific to Mac OS X only.

### The Setup New Machine Script:

Use this script to install command line tools and set up defaults for a new OSX installation. Read the script for what it will do.

To run, execute:
```shell
./setup-new-machine.sh
```
(Add execute permission if the file hasn't: `chmod +x initialize.sh`).

### Terminal / Command Line Helpers:

These files will add useful aliases and functions to your terminal session.

#### What are they:

- `.aliases`
- `.bashrc`
- `.bash_profile`
- `.functions`

#### How to install:

Running sync will copy those dotfiles into `~/`.
```shell
./sync.sh
```
To update later on, just run the sync again.

#### Extras:

There are additional setup you might be interested in:

- Git friendly terminal prompt: [Mathias Bynens' `.bash_prompt`](https://github.com/mathiasbynens/dotfiles/blob/master/.bash_prompt)
- Auto complete git commands: [git-completion.bash](http://git-scm.com/book/en/v1/Git-Basics-Tips-and-Tricks#Auto-Completion)

-------------------------------------------------------------------------------

Ubuntu
------
Ubuntu is not our official working OS yet. 
These dotfiles and bash profile configs are for personal uses. 
Usage is similar to ones in OSX.

-------------------------------------------------------------------------------

SublimeText
-------------
Our conventional IDE for Front End development is SubLime Text 3.
Inside this folders are predefined snippets and settings for it:

### JavaScript

The files in this folder can be classified into these categories:

#### Completions Files:

Sublime Text [completions files](http://sublime-text-unofficial-documentation.readthedocs.org/en/latest/reference/completions.html) (.sublime-completions) are dictionaries that keep a set of auto completion texts. 

- __JavaScript.sublime-completions__: Auto completions for vanilla JavaScript language

    _**Note**: We are considering the ST package **JavaScript Completions** to replace this completion file._

- __jQuery.sublime-completions__: Auto completions for jQuery API

#### Snippets:

[Snippets](http://sublime-text-unofficial-documentation.readthedocs.org/en/latest/extensibility/snippets.html) are like completion files but they deal with single entry and have higher priority when displayed in the completion list.

Some remarkable snippets:

- __console.log()__: Triggered by typing `log`; after it completes the text `console.log()`, you have the chance to switch to `console.info()` or `console.warn()` or `console.error()` by typing the first letter of the method, respectively __i, w, e__
- __[IIFE](http://benalman.com/news/2010/11/immediately-invoked-function-expression/) block__: Triggered by `iife`; complete the "immediately invoked function expression" block.
- __[JSHint](http://jshint.com/) by-project config__: Triggered by `jshintrc` in new text file; it will complete the file with Nau's conventional linting rules for JavaScript. Save it as `.jshintrc` to the root of the project.
- __[JSCS](http://jscs.info/) coding style config__: Triggered by `jscsrc` in new text file; it will complete the file with Nau's coding style rules for JavaScript. Save it as `.jscsrc` to the root of the project.
- __[RequireJS](http://requirejs.org/docs/api.html#cjsmodule) Module with Simplified CommonJS Wrapper__: Triggered by `define`. This is our recommended AMD syntax where the dependencies are imported by a `require` function which makes it similar to NodeJS modules and a convenience to add / remove dependencies.

Please check out other snippets in the folder to learn what's available.

### User

Some other general config for ST3:

#### Default Sublime Text Plugin List:

In __Package Control.sublime-settings__, there is our recommended list of ST3 plugins for Front End development, with details below.

Install __Package Control__ plugin (instructions at [its website](https://packagecontrol.io)) before copying `Package Control.sublime-settings`. The rest will be installed automatically after you restart Sublime Text.

The recommended plugins are:

- [Alignment](https://github.com/wbond/sublime_alignment): Help align code for better readability (especially in long properties list). Shortcut has been switch to `ctrl+shift+a` due to conflicts with SublimeLinter
- [All Autocomplete](https://github.com/alienhard/SublimeAllAutocomplete): List and suggest completion for all the words appeared in opened files
- [Color Highlighter](https://github.com/Monnoroch/ColorHighlighter): is a plugin for the Sublime text 2 and 3, which underlays selected hexadecimal colorcodes (like "#FFFFFF", "rgb(255,255,255)", "white", etc.) with their real color. Also, plugin adds color picker to easily modify colors.
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
- [Package Control](https://packagecontrol.io): The de facto package manager for Sublime Text. You already used it to install these plugins.
- [Pretty JSON](https://github.com/dzhibas/SublimePrettyJson): plugin for [ST3] to pretty [and minify] json
- [PxToEm](https://github.com/ningbit/sublime_pxtoem): plugin to convert px to em with comments. Shortcut was changed to `ctrl+shift+e` to avoid linter conflicts.
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
- [Terminal](http://wbond.net/sublime_packages/terminal): Launch terminals from the current file or the root project folder.

_Note: key bindings for the plugins to be added_

#### Additional Snippets:

- __SCSS Lint config__: Triggered by `scsslint` in new text file. This is our conventional SCSS linting rules. Save it as `.scss-lint.yml` to project root.
- __.gitignore__: Triggered by 'gitignore' in new text file. This is our generic files ignoring rules for GIT. Further modify it with project specific rules. Save it as `.gitignore` at project root and checked into GIT repo.
- __Default EditorConfig__: Triggered by `editorconfig` in new text file. Save it as `.editorconfig` at project root and should be checked into version control system.

> [EditorConfig](http://editorconfig.org/) helps developers define and seamlessly maintain consistent coding styles between different editors and IDEs. Most of the time, the concerned preferences are new line format, indentation rules for each kind of source files.

#### Key Bindings Modifiers

These key binding modifiers for OSX (`Default (OSX).sublime-keymap`) are to resolve conflicts among plugins and add shortcuts to useful but hidden commands:

```js
[
    // Reveal current opening file in sidebar:
    {"keys": ["ctrl+super+r"], "command": "reveal_in_side_bar"},
    // New key binding for Alignment plugin
    {"keys": ["shift+ctrl+a"], "command": "alignment"},
    // New key binding for PxToEm plugin
    {"keys": ["shift+ctrl+e"], "command": "px_to_em"},
]
```

#### Other Preferences
Details of what's been set up for ST3 and plugins to enhance the workflow:

##### `ColorHighlighter.sublime-settings`

- Disable its key bindings for now due to conflict with expand selection to tag (`super+shift+a`).
- Add some additional extensions where color highlighting is expected.

##### `Emmet.sublime-settings`

- Trivially fix Emmet's [tags comment filter](http://docs.emmet.io/filters/#comment-tags-c) to insert closing comments on the same line with closing tags instead of on a new line to save space. For e.g:
```html
<h2 class="title">
    A Title
</h2><!-- /.title -->
```

##### `Preferences.sublime-settings`

Here's an extract of the system preference with explanation comments:
```js
{
    // nice monospace font from Adobe, the light variant looks 
    // very pleasing on dark theme
    "font_face": "Source Code Pro Light",
    "font_size": 13,
    //this must be set in user settings to be enabled in MAC OSX
    "scroll_past_end": true,
    //avoid confusion with tabstops
    "tab_completion": false,
    // Flat dark theme with very good set of file icon on the side bar; 
    // need to install via Package Control, require ST3 Build 3062++
    "theme": "Seti.sublime-theme",
    // better dark monokai editor scheme, bundled in User folder
    "color_scheme": "Packages/User/Monokai Soda.tmTheme",
    // The delay, in ms, before the auto complete window is shown after typing
    // Note: Delaying this to have the completion files more likely
    // to be included in the auto complete list
    "auto_complete_delay": 200,
    // For best practices, will be overriden by EditorConfig
    "trim_trailing_white_space_on_save": true,
    // Easier to differentiate folders from files
    "bold_folder_labels": true,
    // Esier to spot edited tabs
    "highlight_modified_tabs": true
}
```
Some of the entries were commented out in the real file to keep the preferences more agnostic. It's up to you to turn them on or use different settings.

Downloads:

- Adobe's [Source Code Pro font](https://github.com/adobe-fonts/source-code-pro)
- [Seti UI Theme](https://packagecontrol.io/packages/Seti_UI)

##### `FuzzyFilePath.sublime-settings`

- Added `jsx`, `tmpl`, `hbs`, `json` extensions to search for after `require` and `define` code block.
- (More tweaking to come as this is our very newly adopted plugin)

-------------------------------------------------------------------------------

Thanks to
---------

- [Paul Irish](https://github.com/paulirish) and his [dotfiles repository](https://github.com/paulirish/dotfiles) from which the OSX section is based on.
- [Thanh Tran](https://github.com/trongthanh) and his [dotfiles repository](https://github.com/trongthanh/dotfiles) from which this repo is forked and standardized further.

-------------------------------------------------------------------------------

© 2015 Nâu Studio