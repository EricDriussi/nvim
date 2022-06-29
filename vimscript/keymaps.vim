"Kinda scrolling
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

"Sensible copy-pasting to and from system clipboard
vnoremap <C-y> "+y <bar> :echom 'Copied to system clipboard!'<CR>
nnoremap <C-y> "+yiw <bar> :echom 'Copied to system clipboard!'<CR>
nnoremap <C-p> "+P <bar> :echom 'Pasted from system clipboard!'<CR>
vnoremap <C-p> "+P <bar> :echom 'Pasted from system clipboard!'<CR>
inoremap <C-p> <Esc>"+p <bar> :echom 'Pasted from system clipboard!'<CR>A

"Y like you V or C
nnoremap Y y$

"Paste over selected text without screwing the reg
vnoremap p "_dP
vnoremap P "_dP

"Select all
nnoremap <C-a> ggVG

"Increment number
nnoremap <A-a> <C-a>

"Esc+Esc to turn off search highlighting
nnoremap <Esc> :noh<return><Esc>

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
nnoremap <C-w> :q<CR>

"Indent
vnoremap <a-h> <gv
vnoremap <a-l> >gv
vnoremap < <gv
vnoremap > >gv
nnoremap <a-h> <<
nnoremap <a-l> >>

"Exit Vim meme here
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

"Move current line and selected lines
noremap <a-j> :m .+1<cr>==
noremap <a-k> :m .-2<cr>==
vnoremap <a-j> :m '>+1<cr>gv=gv
vnoremap <a-k> :m '<-2<cr>gv=gv

"Save all 
nnoremap <C-s> :wa <CR>

"Split right
nnoremap <c-a-O> <cmd>vsp %<cr>

"Resize vertical splits
nnoremap + :vertical resize +5<CR>
nnoremap - :vertical resize -5<CR>

"Resize horizontal splits
nnoremap <a-+> :resize +2<CR>
nnoremap <a--> :resize -2<CR>

"Navigate splits
nnoremap <C-M-l> <cmd>wincmd l<cr>
nnoremap <C-M-h> <cmd>wincmd h<cr>
nnoremap <C-M-j> <cmd>wincmd j<cr>
nnoremap <C-M-k> <cmd>wincmd k<cr>

"Add Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ? ?<c-g>u

"Add number and half page jumps to jumplist
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
nnoremap <c-u> <c-u>m'
nnoremap <c-d> <c-d>m'
