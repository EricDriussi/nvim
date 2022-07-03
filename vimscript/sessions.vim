let g:sessionDir = $HOME . '/.cache/vimsessions/'
let g:sessionSuffix = '.sess.vim'
let g:ignoreFiles = ['man', 'gitignore']
let s:root_dir = execute(':RootDir')

function! CurrentFileIsAllowed()
  let hasRootDir = s:root_dir != ''
  return index(g:ignoreFiles, &filetype) == -1 && hasRootDir
endfunction

function! LoadSession()
  let cwd = fnamemodify(getcwd(), ':t')
  let sessionName = g:sessionDir . cwd . g:sessionSuffix

  if CurrentFileIsAllowed() && filereadable(sessionName) && argc() == 0
    execute 'source ' . sessionName

    if bufexists(1)
      for l in range(1, bufnr('$'))
        if bufwinnr(l) == -1
          exec 'sbuffer ' . l
        endif
      endfor
    endif
  endif
endfunction

function! SaveSession()
  if CurrentFileIsAllowed() && (v:exiting == 0 || !&diff)
    "let cwd = fnamemodify(getcwd(), ':t')
    let cwd = s:root_dir

    if !isdirectory(g:sessionDir)
      call mkdir(g:sessionDir, "p")
    endif

    execute 'mksession! ' . g:sessionDir . cwd . g:sessionSuffix
  endif
endfunction

autocmd VimLeavePre * call SaveSession()
autocmd VimEnter * nested call LoadSession()
