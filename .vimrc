" Отключить все автокоманды при запуске
autocmd!

" Кодировки
scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8

" Номера строк
set number

" Основные настройки
syntax enable 
set title
set autoindent
set smartindent
set hlsearch
set nobackup
set showcmd
set cmdheight=1
set laststatus=2
set expandtab
set scrolloff=10
set backupskip=/tmp/*,/private/tmp/*
set ignorecase
set smarttab
set breakindent
set shiftwidth=4
set tabstop=4
set nowrap
set backspace=start,eol,indent

" Поиск файлов
set path+=**

" Игнорируемые файлы
set wildignore+=*/node_modules/*

" Отключение paste mode при выходе из insert mode
autocmd InsertLeave * set nopaste

" Добавление звездочек в блочных комментариях
set formatoptions+=r

" Буфер обмена
set clipboard+=unnamedplus

" Маппинги клавиш

" Удаление без сохранения в регистр
nnoremap x "_x

" Инкремент/декремент
nnoremap + <C-a>
nnoremap - <C-x>

" Удалить слово назад
nnoremap dw vb"_d

" Выделить все
nnoremap <C-a> gg<S-v>G

" Вкладки
nnoremap te :tabedit<Return>
nnoremap tp :tabprev<Return>
nnoremap tn :tabnext<Return>

" Поиск
nnoremap <Space> /

" Разделение окон
nnoremap ss :split<Return><C-w>w
nnoremap sv :vsplit<Return><C-w>w

" Перемещение между окнами
nnoremap sh <C-w>h
nnoremap sk <C-w>k
nnoremap sj <C-w>j
nnoremap sl <C-w>l

" Ex режим
nnoremap si :Ex<Return>

" Изменение размера окон
nnoremap <C-w><left> <C-w><
nnoremap <C-w><right> <C-w>>
nnoremap <C-w><up> <C-w>+
nnoremap <C-w><down> <C-w>-
