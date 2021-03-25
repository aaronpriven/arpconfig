" .vimrc is always read first
" vimcolor: #CCCCCC

colorscheme default

" #### fonts ####

" these comments are to show the defintions only
"let g:aaron_font = "Source Code Pro ExtraLight"
"let g:aaron_fontsize = "16"
"let g:aaron_anti = 1
"let g:aaron_linespace=0

function! AaronFont ()
   execute  "set guifont=" . escape(g:aaron_font, ' ') . ":h" . g:aaron_fontsize 
   if (g:aaron_anti == 1) 
     set anti
   else
     set noanti
   endif
   execute "set linespace=" . g:aaron_linespace

   highlight Comment gui=italic
endfunction

com! SCELight     let g:aaron_font = 'Source Code Pro ExtraLight' | let g:aaron_anti = 1 | let g:aaron_linespace = 0 | call AaronFont()
com! SCLight      let g:aaron_font = 'Source Code Pro Light'      | let g:aaron_anti = 1 | let g:aaron_linespace = 0 | call AaronFont()
com! SCReg        let g:aaron_font = 'Source Code Pro'            | let g:aaron_anti = 1 | let g:aaron_linespace = 0 | call AaronFont()
com! Lucida       let g:aaron_font = 'Lucida Console'             | let g:aaron_anti = 0 | let g:aaron_linespace = 1 | call AaronFont()
com! Monaco       let g:aaron_font = 'Monaco'                     | let g:aaron_anti = 0 | let g:aaron_linespace = 1 | call AaronFont()
com! Fira         let g:aaron_font = 'Fira Code Light'            | let g:aaron_anti = 1 | let g:aaron_linespace = 0 | call AaronFont()
com! Fantasque    let g:aaron_font = 'Fantasque Sans Mono'        | let g:aaron_anti = 1 | let g:aaron_linespace = 1 | call AaronFont()
com! LatinModern  let g:aaron_font = 'LMMono10-Regular'           | let g:aaron_anti = 1 | let g:aaron_linespace = 1 | call AaronFont()

function! Big ()
   let g:aaron_fontsize = "16"
endfunction

function! Medium () 
   let g:aaron_fontsize = "14"
endfunction

function! Small ()
   let g:aaron_fontsize = "10"
endfunction

function! Tiny ()
   let g:aaron_fontsize = "9"
endfunction

com! Big        call Big ()   | call AaronFont()
com! Medium     call Medium ()| call AaronFont()
com! Small      call Small () | call AaronFont()
com! Tiny       call Tiny ()  | call AaronFont()

call Medium()
SCELight

"  ### Colors

let g:aaron_dark_fg = "grey90"
let g:aaron_light_fg = "black"

"let g:ale_sign_error         = "🔴"
"let g:ale_sign_warning       = "🔶" 
"let g:ale_sign_info          = "🔵"
"let g:ale_sign_style_error   = "🔺"
"let g:ale_sign_style_warning = "🔸"

let g:ale_sign_error         = "▶ "
let g:ale_sign_warning       = "▶ "
let g:ale_sign_info          = "▶ "


function! Aaron_dark (color)
   execute 'highlight Normal guibg=' . a:color . ' guifg=' . g:aaron_dark_fg
   highlight ALESignColumnWithErrors guibg=#303030
   set background=dark
   syntax on
   let l:fontlist = split(&guifont, ':')
   if l:fontlist[0] == "Source Code Pro"
      SCELight  
   endif

   highlight Comment gui=italic
   "hi ALEWarningLine    guisp=Yellow gui=undercurl

endfunction

function! Aaron_light (color)
   execute 'highlight Normal guibg=' . a:color . ' guifg=' . g:aaron_light_fg
   highlight ALESignColumnWithErrors guibg=#BBBBBB
   set background=light
   syntax on
   let l:fontlist = split(&guifont, ':')
   if l:fontlist[0] == "Source Code Pro ExtraLight"
      SCReg  
   endif

   highlight Comment gui=italic
   "hi ALEWarningLine    guisp=Brown gui=undercurl

endfunction

com! -nargs=1 DColor call Aaron_dark(<f-args>)
com! -nargs=1 LColor call Aaron_light(<f-args>)

com! -nargs=1 Lcolor LColor <args>
com! -nargs=1 Dcolor DColor <args>

com! Aqua Dcolor #00261c
com! Azure Dcolor #001326
com! Black Dcolor #000000
com! Blue Dcolor #000026

com! Brick Dcolor #261300
com! Brown Dcolor #261c00
com! Dark Black
com! Grass Dcolor #132600
com! Gray Dcolor #191919
com! Green Dcolor #002600
com! Grey Dcolor #191919
com! Indigo Dcolor #130026
com! OldBlue  DColor #000040 
com! OldBrown DColor #301500 
com! OldGreen DColor #002000 
com! OldGrey  DColor grey7 
com! OldPurple DColor #200020 
com! OldRed   DColor #300000 
com! OldTeal  DColor #004050 
com! Olive Dcolor #191900
com! Plum Dcolor #26001c
com! Purple Dcolor #260026
com! Red Dcolor #260000
com! Rose Dcolor #260013
com! Teal Dcolor #002626
com! Violet Dcolor #1c0026

com! LGray  LColor #e6e6e6
com! LGrey  LColor #e6e6e6

" Cyan, Sky, Day, Lavender, Pink, Peach, Coral, Cream

com! Pink LColor #d8b8b8
com! Salmon LColor #c8b8a8
com! Cream LColor #d8d0b8
com! Yellow LColor #d8d8b8
com! LGrass LColor #b8d8a8
com! LGreen LColor #a8d8a8
com! Leaf LColor #a8d8b8
com! Seafoam LColor #b8d8d0
com! Sky LColor #b8d8d8
com! LAzure LColor #b8c8d8
com! LBlue LColor #b8b8d8
com! LIndigo LColor #c8b8d8
com! LViolet LColor #d0b8d8
com! LPurple LColor #d8b8d8
com! Lavender LColor #d8b8d0

com! OldCream LColor #FFFFed
com! OldLBlue LColor #CCCCFF 
com! OldLGreen LColor #CCFFCC 
com! OldLGrey LColor grey80 
com! Light LColor white 
com! OldPink  LColor #FFCCCC 
com! White LColor white 
com! OldYellow LColor #DDDD80 

com! FileColor Filecolor
com! Filecolor if getline (2) =~? "vimcolor:" | let s:line = getline(2) | let s:startt = matchend(s:line,'vimcolor:\s') | let s:endd = match(s:line, '\s\||' , s:startt ) | if s:endd == -1 | let s:endd = strlen(s:line) | endif | let s:kolor = strpart(s:line, s:startt, s:endd - s:startt ) | execute 'highlight Normal guibg=' . s:kolor | set background& | execute 'call Aaron_' . &background . ' (s:kolor)' | endif

"com! Filecolor if getline (2) =~? "vimcolor:" | let s:line = getline(2) | let s:startt = matchend(s:line,'vimcolor:\s') | let s:endd = match(s:line, '\s\||' , s:startt ) | if s:endd == -1 | let s:endd = strlen(s:line) | endif | let s:kolor = strpart(s:line, s:startt, s:endd - s:startt ) | execute 'highlight Normal guibg=' . s:kolor | set background& | execute 'highlight Normal guifg=' . g:aaron_{&background}_fg | syntax on | endif

" this reads the color from vimcolor: on line 2

au BufReadPost * Filecolor

set gcr=a:blinkon0
" turns off cursor blinking

set guioptions-=T
" turns off terrible toolbar

" Sizes

com! Wide set columns=150
com! Portrait set lines=130
com! Square set columns=158 lines=76
com! HeadwaySize set lines=49 columns=211 | Small 
com! DblHeadwaySize set lines=95 columns=211 | Small
com! StartSize set lines=40 columns=87 

StartSize

Blue

" for the life of me I can't understand this. If I give *two* Dark
" commands, it works. If I give one, it doesn't.

call Aaron_dark('black')
call AaronFont()

hi ALEErrorSign      guifg=white guibg=Red        gui=bold
hi ALEInfoSign       guifg=black guibg=DarkCyan   gui=bold
hi ALEWarningSign    guifg=white guibg=Magenta    gui=bold
hi LineNr guifg=#808080
hi link ALEWarningLine SpellRare
hi link ALEErrorLine   SpellBad
hi link ALEInfo        SpellRare
hi link ALEInfoLine    SpellLocal
hi link ALESignColumnWithoutErrors Normal
"hi perlPOD guifg=#00a0FF gui=italic
hi link perlPOD Comment
