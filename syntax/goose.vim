if exists("b:current_syntax")
  finish
endif

syn keyword gooseKeyword import namespace struct enum type fn thread_fn export simd recursive
syn keyword gooseKeyword let var extern const pad reusable inline checkfree
syn keyword gooseConditional if else guard match
syn keyword gooseRepeat while for in loop block
syn keyword gooseStatement return break continue from
syn keyword gooseOperator as upto fields variants types
syn keyword gooseType bool varint i8 i16 i32 i64 u8 u16 u32 u64 f32 f64
syn keyword gooseBoolean true false
syn keyword gooseConstant null self

syn match gooseNumber "\<\d\+\(\.\d\+\)\?\([eE][+-]\?\d\+\)\?\>"
syn match gooseNumber "\<0x[0-9a-fA-F]\+\(\.[0-9a-fA-F]\+\)\?\([pP][+-]\?\d\+\)\?\>"

syn region gooseRawString start=+"""+ end=+"""+
syn region gooseString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=gooseEscape
syn match gooseCharacter "'\\\?.'"
syn match gooseEscape "\\[ntr0\\'\"x]" contained

syn match gooseLineComment "//.*$"
syn region gooseBlockComment start="/\*" end="\*/" contains=gooseBlockComment

hi def link gooseKeyword Keyword
hi def link gooseConditional Conditional
hi def link gooseRepeat Repeat
hi def link gooseStatement Statement
hi def link gooseOperator Operator
hi def link gooseType Type
hi def link gooseBoolean Boolean
hi def link gooseConstant Constant
hi def link gooseNumber Number
hi def link gooseString String
hi def link gooseRawString String
hi def link gooseCharacter Character
hi def link gooseEscape SpecialChar
hi def link gooseLineComment Comment
hi def link gooseBlockComment Comment

setlocal commentstring=//\ %s

let b:current_syntax = "goose"
