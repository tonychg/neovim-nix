syntax on
filetype plugin indent on

let mapleader = " "
colorscheme rose-pine

xnoremap <silent> <leader>p "_dP

tnoremap <silent> <C-p> <C-\><C-n>
nnoremap <silent> <C-d> <C-d>zz
nnoremap <silent> <C-u> <C-u>zz
nnoremap <silent> <C-f> <C-f>zz
nnoremap <silent> <C-b> <C-b>zz
nnoremap <silent> <leader>t :NvimTreeToggle<CR>

" fzf
nnoremap <silent> <leader>f <cmd>lua require('fzf-lua').files()<CR>
nnoremap <silent> <leader>x <cmd>lua require('fzf-lua').quickfix()<CR>
nnoremap <silent> <leader>gg <cmd>lua require('fzf-lua').live_grep()<CR>

" telescope
nnoremap <silent> <leader>b :Telescope buffers<CR>
nnoremap <silent> <leader>bb :Telescope builtin<CR>
nnoremap <silent> <leader>o :Telescope oldfiles<CR>
nnoremap <silent> <leader>m :lua require("telescope").extensions.ghq.list()<CR>

" toggleterm
nnoremap <silent> <leader>cc :ToggleTerm direction=tab<CR>
nnoremap <silent> <leader>* 2:ToggleTerm direction=vertical<CR>
nnoremap <silent> <leader>v 2:ToggleTerm direction=horizontal<CR>

" spectre
nnoremap <silent> <leader>S <cmd>lua require("spectre").toggle()<CR>
nnoremap <silent> <leader>sw <cmd>lua require("spectre").open_visual({select_word=true})<CR>
nnoremap <silent> <leader>sp <cmd>lua require("spectre").open_file_search({select_word=true})<CR>
nnoremap <silent> <leader>sr <cmd>Lspsaga rename<CR>
vnoremap <silent> <leader>sw <esc><cmd>lua require("spectre").open_visual()<CR>

" fugitive
let g:fugitive_pty = 0
nnoremap <silent> <leader>gs :Git<CR>
nnoremap <silent> <leader>gcl :Gclog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gup :Git push -u origin HEAD<CR>
nnoremap <silent> <leader>gP :Git push -f<CR>
nnoremap <silent> <leader>gl :Git pull<CR>
nnoremap <silent> <leader>gf :Git fetch --all --prune<CR>
nnoremap <silent> <leader>gv :Gvdiffsplit<CR>
nnoremap <silent> <leader>gb :Git_blame<CR>
nnoremap <silent> <leader>gcc :Git commit<CR>
nnoremap <silent> <leader>grm :GDelete!<CR>

" fasd
function! s:Go(pattern)
    let match = system('fasd '.a:pattern)

    execute ":lcd ".match
endfunction

" Change working directory to the current file directory
function! s:GoCurrent()
    execute ":lcd %:p:h"
endfunction

command! -nargs=1 Z call s:Go(<f-args>)
command! Gc call s:GoCurrent()

set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set grepformat=%f:%l:%c:%m
