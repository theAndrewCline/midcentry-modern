-- stylua: ignore start
local lush = require("lush")
local hsl = lush.hsl

local palette = {
	bg = hsl("#1e2022"),
	black = hsl("#111111"),
	pink = hsl("#dfbdbc"),
	brightRed = hsl("#df9a98"),
	red = hsl("#c96053"),
	blue = hsl("#80b6d7"),
	lightBlue = hsl("#c9e4f5"),
	green = hsl("#8b956d"),
	lightGreen = hsl("#c7d1a9"),
	yellow = hsl("#ffd187"),
	gold = hsl("#E1C16E"),
	orange = hsl("#f7b268"),
	burntOranage = hsl("#fd8527"),
	purple = hsl("#dcb2f6"),
	lightPurple = hsl("#dbcbe5"),
	cyan = hsl("#87afaf"),
	brightCyan = hsl("#c5e7e3"),
	fg = hsl("#d8dce1"),
	white = hsl("#FFFFFF"),
}

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym

	return {
		-- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
		-- groups, mostly used for styling UI elements.
		-- Comment them out and add your own properties to override the defaults.
		-- An empty definition `{}` will clear all styling, leaving elements looking
		-- like the 'Normal' group.
		-- To be able to link to a group, it must already be defined, so you may have
		-- to reorder items as you go.
		--
		-- See :h highlight-groups
		--
		-- ColorColumn    { }, -- Columns set with 'colorcolumn'
		Conceal        { fg = palette.fg.darken(30)  }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
		-- Cursor         { }, -- Character under the cursor
		CurSearch					{ bg = palette.orange, fg = palette.bg }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
		-- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
		-- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		-- CursorLine     { }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory					{ fg = palette.lightBlue }, -- Directory names (and other special names in listings)
		DiffAdd						{ bg = palette.green.darken(30) }, -- Diff mode: Added line |diff.txt|
		-- DiffChange     { }, -- Diff mode: Changed line |diff.txt|
		-- DiffDelete     { }, -- Diff mode: Deleted line |diff.txt|
		DiffText					{ fg = palette.white, bg = palette.cyan.darken(30)  }, -- Diff mode: Changed text within a changed line |diff.txt|
		-- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		-- TermCursor     { }, -- Cursor in a focused terminal
		-- TermCursorNC   { }, -- Cursor in an unfocused terminal
		-- ErrorMsg       { }, -- Error messages on the command line
		-- VertSplit      { }, -- Column separating vertically split windows
		-- Folded         { }, -- Line used for closed folds
		-- FoldColumn     { }, -- 'foldcolumn'
		-- SignColumn     { }, -- Column where |signs| are displayed
		-- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		Substitute				{ bg = palette.yellow, fg = palette.bg }, -- |:substitute| replacement text highlighting
		-- LineNr         { }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		-- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
		-- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
		-- CursorLineNr   { }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		-- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
		-- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
		-- MatchParen     { }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
			ModeMsg        { fg = palette.lightGreen }, -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea        { }, -- Area for messages and cmdline
		-- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		-- MoreMsg        { }, -- |more-prompt|
		NonText        { fg = palette.fg.darken(30) }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal						{ bg = palette.bg, fg = palette.fg }, -- Normal text
		NormalFloat       { bg = palette.bg, fg = palette.fg }, -- Normal text in floating windows.
		-- FloatBorder    { }, -- Border of floating windows.
		-- FloatTitle     { }, -- Title of floating windows.
		-- NormalNC       { }, -- normal text in non-current windows
		-- Pmenu          { }, -- Popup menu: Normal item.
		-- PmenuSel       { }, -- Popup menu: Selected item.
		-- PmenuKind      { }, -- Popup menu: Normal item "kind"
		-- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
		-- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
		-- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
		-- PmenuSbar      { }, -- Popup menu: Scrollbar.
		-- PmenuThumb     { }, -- Popup menu: Thumb of the scrollbar.
		-- Question       { }, -- |hit-enter| prompt and yes/no questions
		-- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search						{ bg = palette.yellow, fg = Normal.bg }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		SpecialKey				{	fg = palette.fg.darken(30) }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
		-- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		-- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		-- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
		StatusLine				{ bg = Normal.bg, fg = Normal.fg.darken(30) }, -- Status line of current window
		StatusLineNC			{ bg = Normal.bg, fg = Normal.fg.darken(30) }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine						{ bg = Normal.bg, fg = Normal.fg.darken(30) }, -- Tab pages line, not active tab page label
		-- TabLineFill    { }, -- Tab pages line, where there are no labels
		TabLineSel				{ bg = Normal.bg, fg = Normal.fg }, -- Tab pages line, active tab page label
		-- Title          { }, -- Titles for output from ":set all", ":autocmd" etc.
		-- Visual         { }, -- Visual mode selection
		-- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
		-- WarningMsg     { }, -- Warning messages
		-- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		-- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
		WildMenu       { bg = Normal.bg, fg = Normal.fg.darken(30) }, -- Current match in 'wildmenu' completion
		-- WinBar         { }, -- Window bar of current window
		-- WinBarNC       { }, -- Window bar of not-current windows

		-- Common vim syntax groups used for all kinds of code and markup.
		-- Commented-out groups should chain up to their preferred (*) group
		-- by default.
		--
		-- See :h group-name
		--
		-- Uncomment and edit if you want more specific syntax highlighting.

		Comment						{ fg = palette.fg.darken(20), gui = "italic" }, -- Any comment

		-- Constant       { }, -- (*) Any constant
		String						{ fg = palette.lightBlue }, --   A string constant: "this is a string"
		Character					{ fg = palette.orange }, --   A character constant: 'c', '\n'
		Number						{ fg = palette.yellow }, --   A number constant: 234, 0xff
		Boolean						{ fg = palette.orange }, --   A boolean constant: TRUE, false
		Float							{ fg = palette.yellow }, --   A floating point constant: 2.3e10

		Identifier				{ fg = palette.fg }, -- (*) Any variable name
		Function					{ fg = palette.blue }, --   Function name (also: methods for classes)

		Statement					{ fg = palette.purple }, -- (*) Any statement
		Conditional				{ fg = palette.pink }, --   if, then, else, endif, switch, etc.
		Repeat						{ fg = palette.burntOranage }, --   for, do, while, etc.
		Label							{ fg = palette.pink }, --   case, default, etc.
		Operator					{ fg = palette.cyan }, --   "sizeof", "+", "*", etc.
		Keyword						{ fg = palette.brightRed }, --   any other keyword
		Exception					{ fg = palette.brightRed }, --   try, catch, throw

		PreProc						{ fg = palette.yellow }, -- (*) Generic Preprocessor
		-- Include        { }, --   Preprocessor #include
		-- Define         { }, --   Preprocessor #define
		-- Macro          { }, --   Same as Define
		-- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

		Type							{ fg = palette.lightPurple }, -- (*) int, long, char, etc.
		-- StorageClass   { }, --   static, register, volatile, etc.
		Structure					{ fg = palette.yellow }, --   struct, union, enum, etc.
		-- Typedef        { }, --   A typedef

		Special						{ fg = palette.yellow.lighten(40) }, -- (*) Any special symbol
		SpecialChar				{ fg = palette.orange }, --   Special character in a constant
		Tag								{ fg = palette.cyan }, --   You can use CTRL-] on this
		Delimiter					{ fg = palette.fg.darken(20) }, --   Character that needs attention
		SpecialComment		{ fg = palette.yellow }, --   Special things inside a comment (e.g. '\n')
		-- Debug          { }, --   Debugging statements
		--

		Underlined				{ gui = "underline" }, -- Text that stands out, HTML links
		-- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		Error							{ fg = palette.red }, -- Any erroneous construct
		Todo							{ bg = palette.yellow, fg = palette.bg }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- These groups are for the native LSP client and diagnostic system. Some
		-- other LSP clients may use these groups, or use their own. Consult your
		-- LSP client's documentation.

		-- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
		--
		-- LspReferenceText            { } , -- Used for highlighting "text" references
		-- LspReferenceRead            { } , -- Used for highlighting "read" references
		-- LspReferenceWrite           { } , -- Used for highlighting "write" references
		LspCodeLens                 { fg = palette.fg.darken(20) }, -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
		LspCodeLensSeparator        { fg = palette.fg.darken(20) }, -- Used to color the seperator between two or more code lens.
		-- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

		-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
		--
		DiagnosticError								{ fg = palette.red.lighten(20) } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticWarn								{ fg = palette.gold } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticInfo								{ fg = palette.brightCyan } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticHint								{ fg = palette.blue.lighten(40) } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticOk									{ fg = palette.green.lighten(40) } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
		-- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
		-- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
		-- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
		-- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
		-- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
		-- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
		-- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
		-- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
		-- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
		-- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		-- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
		-- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
		-- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
		-- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
		-- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
		-- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

		-- Tree-Sitter syntax groups.
		--
		-- See :h treesitter-highlight-groups, some groups may not be listed,
		-- submit a PR fix to lush-template!
		--
		-- Tree-Sitter groups are defined with an "@" symbol, which must be
		-- specially handled to be valid lua code, we do this via the special
		-- sym function. The following are all valid ways to call the sym function,
		-- for more details see https://www.lua.org/pil/5.html
		--
		-- sym("@text.literal")
		-- sym('@text.literal')
		-- sym"@text.literal"
		-- sym'@text.literal'
		--
		-- For more information see https://github.com/rktjmp/lush.nvim/issues/109

		-- sym"@text.literal"      { }, -- Comment
		-- sym"@text.reference"    { }, -- Identifier
		-- sym"@text.title"        { }, -- Title
		-- sym"@text.uri"          { }, -- Underlined
		-- sym"@text.underline"    { }, -- Underlined
		-- sym"@text.todo"         { }, -- Todo
		-- sym"@comment"           { }, -- Comment
		-- sym"@punctuation"       { }, -- Delimiter
		-- sym"@constant"          { }, -- Constant
		-- sym"@constant.builtin"  { }, -- Special
		-- sym"@constant.macro"    { }, -- Define
		-- sym"@define"            { }, -- Define
		-- sym"@macro"             { }, -- Macro
		-- sym"@string"            { }, -- String
		-- sym"@string.escape"     { }, -- SpecialChar
		-- sym"@string.special"    { }, -- SpecialChar
		-- sym"@character"         { }, -- Character
		-- sym"@character.special" { }, -- SpecialChar
		-- sym"@number"            { }, -- Number
		-- sym"@boolean"           { }, -- Boolean
		-- sym"@float"             { }, -- Float
		-- sym"@function"          { }, -- Function
		-- sym"@function.builtin"  { }, -- Special
		-- sym"@function.macro"    { }, -- Macro
		-- sym"@parameter"         { }, -- Identifier
		-- sym"@method"            { }, -- Function
		-- sym"@field"             { }, -- Identifier
		-- sym"@property"          { }, -- Identifier
		-- sym"@constructor"       { }, -- Special
		sym"@conditional"					 { fg = palette.pink }, -- Conditional
		-- sym"@repeat"            { }, -- Repeat
		-- sym"@label"             { }, -- Label
		-- sym"@operator"          { }, -- Operator
		-- sym"@keyword"           { }, -- Keyword
		-- sym"@exception"         { }, -- Exception
		-- sym"@variable"          { }, -- Identifier
		-- sym"@type"              { }, -- Type
		-- sym"@type.definition"   { }, -- Typedef
		sym"@storageclass"				 { fg = palette.purple }, -- StorageClass
		-- sym"@structure"         { }, -- Structure
		-- sym"@namespace"         { }, -- Identifier
		-- sym"@include"           { }, -- Include
		-- sym"@preproc"           { }, -- PreProc
		-- sym"@debug"             { }, -- Debug
		-- sym"@tag"               { }, -- Tag
	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- stylua: ignore end
-- vi:nowrap
