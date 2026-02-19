" Отключаем swap
set noswapfile

" Основные настройки - ВАЖНО: именно в таком порядке
set nocompatible
filetype plugin on      " Сначала включаем filetype
filetype indent on      " Потом инденты для языков
syntax on

" Кодировки
set encoding=utf-8
set fileencoding=utf-8

" Интерфейс
set number
set title
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set clipboard+=unnamedplus

" Поиск
set hlsearch
set ignorecase
set incsearch

" ОТСТУПЫ - исправленная секция
set autoindent          " Копирует отступ с предыдущей строки
set smartindent         " Включаем умные отступы (был выключен)
set cindent             " Добавляем си-подобные отступы
set expandtab           " Табы пробелами
set shiftwidth=4        " Размер отступа
set tabstop=4           " Размер таба
set softtabstop=4       " Размер таба при редактировании
set smarttab            " Умные табы

" Принудительно включаем отступы для всех файлов
autocmd BufRead,BufNewFile * setlocal smartindent cindent autoindent

" Редактирование
set backspace=indent,eol,start
set whichwrap+=<,>,[,]

" Файлы
set nobackup
set path+=**
set wildignore+=*/node_modules/*

" Маппинги клавиш (ваши шорткаты)
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
nnoremap te :tabedit<CR>
nnoremap tp :tabprev<CR>
nnoremap tn :tabnext<CR>

" Поиск
nnoremap <Space> /

" Разделение окон
nnoremap ss :split<CR><C-w>w
nnoremap sv :vsplit<CR><C-w>w

" Перемещение между окнами
nnoremap sh <C-w>h
nnoremap sk <C-w>k
nnoremap sj <C-w>j
nnoremap sl <C-w>l

" Ex режим
nnoremap si :Ex<CR>

" Изменение размера окон
nnoremap <C-w><left> <C-w><
nnoremap <C-w><right> <C-w>>
nnoremap <C-w><up> <C-w>+
nnoremap <C-w><down> <C-w>-

" Для блочных комментариев
set formatoptions+=r

" Автокоманды
autocmd InsertLeave * set nopaste
