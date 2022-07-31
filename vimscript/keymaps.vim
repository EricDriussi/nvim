"Kinda scrolling
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

"Sensible copy-pasting to and from system clipboard
vnoremap <C-y> "+y <bar> <Cmd>echom 'Copied to system clipboard!'<CR>
nnoremap <C-y> "+yiw <bar> <Cmd>echom 'Copied to system clipboard!'<CR>
nnoremap <C-p> "+P <bar> <Cmd>echom 'Pasted from system clipboard!'<CR>
vnoremap <C-p> "+P <bar> <Cmd>echom 'Pasted from system clipboard!'<CR>
inoremap <C-p> <Esc>"+p <bar> <Cmd>echom 'Pasted from system clipboard!'<CR>A

"Y like you C
nnoremap Y y$

"Paste over selected text without screwing the reg
vnoremap p "_dP
vnoremap P "_dP

"Select all
nnoremap <C-a> ggVG

"Esc+Esc to turn off search highlighting
nnoremap <Esc> <Cmd>noh<return><Esc>

"Center search selection
nnoremap n nzzzv
nnoremap N Nzzzv

"Search selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

"Dumb-replace word in Normal mode and selection in Visual mode
nnoremap <silent> rp *``cgn
vnoremap <silent> rp y/\V<C-R>=escape(@",'/\')<CR><CR>Ncgn
"FUCKS UP REG

"Close tab
nnoremap <C-w> <Cmd>q!<CR>

"Save all 
nnoremap <C-s> <Cmd>wa <CR>

"Indent
vnoremap <M-h> <gv
vnoremap <M-l> >gv
vnoremap < <gv
vnoremap > >gv
nnoremap <M-h> <<
nnoremap <M-l> >>

"Move current line and selected lines
noremap <M-j> <Cmd>m .+1<CR>==
noremap <M-k> <Cmd>m .-2<CR>==
vnoremap <M-j> <Cmd>m '>+1<CR>gv=gv
vnoremap <M-k> <Cmd>m '<-2<CR>gv=gv

"Split right
nnoremap <C-M-O> <Cmd>vsp %<CR>

"Resize vertical splits
nnoremap + <Cmd>vertical resize +5<CR>
nnoremap - <Cmd>vertical resize -5<CR>

"Resize horizontal splits
nnoremap <M-+> <Cmd>resize +2<CR>
nnoremap <M--> <Cmd>resize -2<CR>

"Navigate splits
nnoremap <C-M-l> <Cmd>wincmd l<CR>
nnoremap <C-M-h> <Cmd>wincmd h<CR>
nnoremap <C-M-j> <Cmd>wincmd j<CR>
nnoremap <C-M-k> <Cmd>wincmd k<CR>

"Add Undo break points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ? ?<C-g>u

"Add number and half page jumps to jumplist
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
nnoremap <C-u> <C-u>m'
nnoremap <C-d> <C-d>m'

"Increment number
nnoremap <M-a> <C-a>

"Exit Vim meme here
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q
