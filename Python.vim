command Q qa
command W w|qa
"command Q call delete('.tags')|call delete('.clang-format')|qa
"command Qone q|TlistClose
"cnoreabbrev q Qone
command Html s/<[^>]*/\r&/g|g/^$/d

set signcolumn=yes
set colorcolumn=120
hi ColorColumn ctermbg=0 guibg=lightgrey
set updatetime=4500
set completeopt=menu,popup,longest
"set completeopt=menu,preview,longest
"set completeopt-=preview
set conceallevel=2
set concealcursor=vin
set splitbelow

colorscheme codedark
set t_Co=256
set smc=600  " to limit the regular expression of syntax color to avoid huge calculation

set rtp+=~/.vim/bundle/YouCompleteMe "YCM is installed with some error, so Vundle can't distinguish it automatically.

let g:clang_c_options='-std=gun11'
let g:clang_cpp_options='-std=c++11 -stdlib=libc++'

"augroup readonly
"    autocmd!
"    autocmd! BufReadPost ~/.vim/banner.txt setlocal readonly
"augroup END

autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>120v.\+', -1)
autocmd BufWinLeave * silent! TlistClose
autocmd VimLeave * silent! !eval 'rm newtags .tags 2>/dev/null'
autocmd VimEnter * NERDTree
autocmd VimEnter * execute "let g:projectPath = expand('%:p:h')"
autocmd VimEnter * execute "normal j"
autocmd VimEnter * execute "call DeleteBufferImg()"
function! BufferDelete(id)
    if bufnr('$') > 2
        execute "bd1"
        call timer_stop(a:id)
    endif
endfunction
function! DeleteBufferImg()
    let t = timer_start(2200, 'BufferDelete', {'repeat': -1})
endfunction

set tags=.tags
if has('macunix')
    autocmd VimEnter * silent! !eval 'ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=python --exclude=.tags -o newtags; mv newtags .tags'
    au BufWritePost *.py silent! !eval 'ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=python --exclude=.tags -o newtags; mv newtags .tags'
else
    autocmd VimEnter * silent! !eval 'ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=python --exclude=.tags -o newtags; mv newtags .tags'
    au BufWritePost *.py silent! !eval 'ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=python --exclude=.tags -o newtags; mv newtags .tags'
endif

"autocmd CursorHold,CursorHoldI * update

autocmd FileType python setlocal equalprg=autopep8\ -

"augroup templates
"    autocmd!
"    autocmd BufRead *.h,*.hpp,*.c,*.cpp,*.cc call s:ApplyTemplate()
"
"    function! s:ApplyTemplate()
"        if getfsize(expand('%')) == 0
"            if expand('%:t:r') == 'main'
"                execute "0r ~/.vim/templates/" . expand('%:t')
"            else
"                execute "0r ~/.vim/templates/template." . expand('%:e')
"                if expand('%:e') == 'h' || expand('%:e') == 'hpp'
"                    execute "%s/this_should_be_replaced/\\=toupper('" . expand('%:t') . "')" . "/e"
"                    execute "%s/\\./_" . "/e"
"                elseif expand('%:e') == 'c' || expand('%:e') == 'cpp' || expand('%:e') == 'cc'
"                    execute "%s/this_should_be_replaced/" . expand('%:t:r') . "/e"
"                endif
"            endif
"        endif
"    endfun
"augroup END

autocmd User FugitiveChanged NERDTreeRefreshRoot

let g:NERDTreeWinSize=24
let baseFileType='\.yaml\|\.yml\|\.json\|\.toml\|\.xml\|\.html\|\.sh'
let currentFileType='\.py'
let NERDTreeIgnore=['\(' . currentFileType . '\|' . baseFileType . '\)\@<!$[[file]]', 'bin']
let NERDTreeAutoDeleteBuffer=1
let NERDTreeShowLineNumbers=1

"let g:ycm_semantic_triggers = {
"  \   'h': [ 're!.' ],
"  \   'c': [ 're!.' ],
"  \   'hpp': [ 're!.' ],
"  \   'cpp': [ 're!.' ]
"  \ }
let g:ycm_semantic_triggers = {
            \   'py': [ '.' ]
            \ }

let g:Tlist_Use_Right_Window=1
let g:Tlist_Show_One_File=1

let g:ycm_auto_hover=""
let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
"let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_server_keep_logfiles=1
let g:ycm_server_log_level='debug'

let g:ycm_disable_signature_help = 0
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

let g:ycm_filetype_whitelist = {
			\ "python":1,
			\ "sh":1,
			\ "bash":1,
			\ }

let g:ale_python_pylint_options = "--init-hook='import sys; from os.path import expanduser; home=expanduser(\"~\"); sys.path.append(home+\"/.local/lib/python3.5/site-packages\")'"
let g:ale_python_auto_pipenv = 1

let g:python_highlight_all = 1

"set statusline+=%#warningmsg#
"function! YCMStatusLine() abort
"    if exists(':YcmDiag') && exists("*youcompleteme#GetErrorCount")
"        let l:errCounts = youcompleteme#GetErrorCount()
"        let l:wrnCounts = youcompleteme#GetWarningCount()
"
"        return printf(
"        \   '%dW %dE',
"        \   wrnCounts,
"        \   errCounts,
"        \)
"    endif
"    return ''
"endfunction
"set statusline+=%{YCMStatusLine()}
"set statusline+=%*
let g:airline_theme='sol'
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs=1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java=1
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailingWhitespace=1
let g:NERDToggleCheckAllLines=1
let g:NERDCustomDelimiters = {
\   'py': { 'left': '#', 'leftAlt': '#', 'rightAlt': '#' }
\}

let g:indentLine_enabled = 1
let g:indentLine_char = '┆'
let g:indentLine_color_term = 60

let skeletons#autoRegister = 1

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
"let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
"let g:cpp_no_function_highlight = 1

"let g:formatdef_my_custom_cpp = '"clang-format -i ".@%'
"let g:formatters_cpp = ['my_custom_cpp']

let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: always with color
let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
let g:ConqueTerm_StartMessages = 0 " display warning messages if conqueTerm is configured incorrectly

nnoremap cgt :wa<CR> \| :2,$tabdo :tabc<CR> \| <C-w><C-j> :q<CR>
nmap <leader>cv <leader>ca<leader>cc<leader>ca

"nnoremap <F5> :wa<CR> \| :term ++kill=term<CR>
nnoremap <F5> :wa \| vertical botright term ++kill=term<CR>

nnoremap <leader>tg :TlistToggle<CR>

nnoremap mh <C-w><C-h>
nnoremap mj <C-w><C-j>
nnoremap mk <C-w><C-k>
nnoremap ml <C-w><C-l>
nnoremap mw <C-w><C-w>
nnoremap mt <C-w><C-t>
nnoremap mb <C-w><C-b>
nnoremap mp <C-w><C-p>

nnoremap <F12> :YcmCompleter GoToDefinition<CR> \| :call RefreshNerdtree()<CR>
nnoremap <C-i> <C-i> \| :call RefreshNerdtree()<CR>
nnoremap <C-o> <C-o> \| :call RefreshNerdtree()<CR>

function! RefreshNerdtree()
    let curPath = expand('%:p:h')[0:len(g:projectPath) - 1]
    if curPath == g:projectPath
        execute 'NERDTree "g:projectPath"'
        execute 'wincmd p'
    endif
    execute 'NERDTreeFind'
    execute 'wincmd p'
endfunction

"function! Jump(type)
"    if filereadable(".tags")
"        if a:type == "single"
"            execute "2tag " . expand("<cword>")
"            NERDTreeFind
"            wincmd p
"        else
"            execute "tjump " . expand("<cword>")
"        endif
"    else
"        echo 'tags file not ready'
"    endif
"endfunction
"nnoremap <C-]> :call Jump('single')<CR>
"nnoremap g<C-]> :call Jump('multi')<CR>

""" Custom Search & Custom Replace
""" Custom Search is async but Custom Replace is not
function! CustomGrepCore(target)
    silent! execute 'vimgrep '.a:target.' **/*.py'
    return len(getqflist())
endfunction

function! CustomGrepJob(...) abort
    let before = expand('%:p')
    if a:0 == 1    " a:0 is the number of parameters
        let res = CustomGrepCore("<cword>")
        let jobID = a:1
    else
        let res = CustomGrepCore(a:1)
        let jobID = a:2
    endif
    if res != 0
        cope
        execute "normal \<C-w>\<C-k>"
        if before != expand('%:p')
            execute "normal \<C-o>"
        endif
    endif
    call timer_stop(jobID)
endfunction

function! CustomGrep(...) abort
    call timer_start(0, function('CustomGrepJob', a:000))   " jobID will be appended at the end of the parameter a:000
endfunction

function! CustomReplace(...)
    if a:0 == 1
        let target = expand("<cword>")
        let newWord = a:1
    elseif a:0 == 2
        let target = a:1
        let newWord = a:2
    else
        return
    endif
    let g:target = newWord
    let g:lastWord = target

    let before = expand('%:p')
    let res = CustomGrepCore(target)
    if res != 0
        if before != expand('%:p')
            execute "normal \<C-o>"
        endif
    endif
    cdo execute 's/'.target.'/'.newWord.'/gc | w'

    "let cnt = CustomGrepCore(target)
    "let x = 0
    "while x < cnt
    "    execute 's/'.target.'/'.newWord.'/gc'
    "    w
    "    if x != cnt - 1
    "        cnext
    "    endif
    "    let x = x + 1
    "endwhile
endfunction

function! CustomUndoReplace()
    let before = expand('%:p')
    let res = CustomGrepCore(g:target)
    if res != 0
        cfdo execute '%s/'.g:target.'/'.g:lastWord.'/g | w'
        if before != expand('%:p')
            execute "normal \<C-o>"
        endif
    endif
endfunction

command! -nargs=? Grep :call CustomGrep(<f-args>)
command! -nargs=+ Replace :call CustomReplace(<f-args>)
command! UndoReplace :silent! call CustomUndoReplace()
nnoremap <leader>vv :Grep<CR>
