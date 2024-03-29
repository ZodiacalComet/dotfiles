" Simple custom syntax for birthday-reminder listing output.

if exists("b:current_syntax")
  finish
endif

"
" -> Matches
"

syn match BirthdayComment "^#.\+$"

syn match BirthdayName "^\(\t\|#\)\@4!.\+$"

syn match BirthdayAge contained "\d\{1,3}"
syn match BirthdayDate contained "\d\{2}.\{-}\d\{4}\|\d\{4}-\d\{2}-\d\{2}"
syn match BirthdayRemainingDays contained "\d\{1,3} days left"
syn match BirthdayField "\t\zs.\+:.\+$" contains=BirthdayAge,BirthdayDate,BirthdayRemainingDays

syn match BirthdayNo contained "No"
syn match BirthdayYes contained "Yes"
syn match BirthdayToday "\t\zsToday?.\+$" contains=BirthdayNo,BirthdayYes

"
" -> Highlight
"

hi BirthdayComment ctermfg=239

hi BirthdayName term=bold ctermfg=224

hi BirthdayAge term=bold ctermfg=3
hi BirthdayDate term=underline ctermfg=2
hi BirthdayRemainingdays term=bold ctermfg=5
hi BirthdayField term=bold cterm=bold ctermfg=12

hi BirthdayNo term=bold ctermfg=1
hi BirthdayYes term=bold cterm=bold ctermfg=2
hi BirthdayToday term=bold cterm=bold ctermfg=239

"
" -> Set current syntax
"

let b:current_syntax = "birthday-reminder-list"
