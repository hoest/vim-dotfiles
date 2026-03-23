# 🧠 1. Wat voor Vim-setup heb jij?

Jouw config is:

👉 **klassieke Vim + plugins, zonder LSP (geen CoC)**
👉 **gericht op snelheid, search en tekstbewerking**
👉 **sterk leunend op CtrlP + Ack + ALE**

Dus:

* ❌ geen IDE-achtige setup (zoals CoC / LSP)
* ✅ wel snelle navigation + linting + formatting

---

# ⚙️ 2. Core Vim gedrag

## Basis

```vim
set nocompatible
```

→ moderne Vim (niet vi)

---

## Encoding

```vim
set encoding=utf-8
set termencoding=utf-8
```

→ alles UTF-8

---

## Indentatie

```vim
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
```

👉 altijd 2 spaties, nooit tabs

---

## Editing gedrag

```vim
set smartindent
set autoindent
set smarttab
```

→ slimme inspringing

---

## UI

```vim
set number
set cursorline
set title
set showmode
```

→ duidelijke visuele feedback

---

## Performance

```vim
set lazyredraw
set ttyfast
```

→ sneller renderen

---

## Clipboard

```vim
set clipboard=unnamed
```

👉 ALLES gaat naar je systeem clipboard (belangrijk!)

---

## Bestanden / swap

```vim
set swapfile
set nobackup
set nowritebackup
```

→ wel swap, geen backups

---

## Zoekgedrag

```vim
set ignorecase
set smartcase
set gdefault
set incsearch
set hlsearch
```

👉 super belangrijk:

* `/foo` → case-insensitive
* `/Foo` → case-sensitive
* vervangingen zijn standaard global (`:%s/foo/bar/`)

---

## Lange regels

```vim
set wrap
set linebreak
```

→ netjes afbreken op woorden

---

## Visuele whitespace

```vim
set list
set listchars=tab:»·,trail:·,...
```

👉 je ziet tabs en trailing spaces

---

## Automatisch van directory wisselen

```vim
set autochdir
```

👉 working directory volgt het bestand

---

# ⌨️ 3. Key mappings (VOLLEDIG)

Je gebruikt **standaard leader: `\`**

---

## 🔹 Search & navigation

### Ack (super belangrijk)

```vim
nnoremap <leader>a :Ack!<space>
```

👉 Gebruik:

```
\a zoekterm
```

→ zoekt in project (via `ag`)

---

### Clear search

```vim
nnoremap <leader><space> :nohlsearch
```

👉 `\ + spatie`

---

## 🔹 Spell check

```vim
nmap <leader>s :set spell!
```

👉 toggle spellcheck

---

## 🔹 XML tools

```vim
nnoremap <leader>fx ...
```

👉 maakt XML netjes (line breaks + indent)

---

```vim
inoremap <M-.> </<C-X><C-O>
```

👉 Alt + . → sluit XML tag automatisch

---

## 🔹 Formatting

```vim
nnoremap <leader>q gqip
nnoremap Q gqap
vnoremap Q gq
```

👉 tekst netjes herformatteren

---

## 🔹 PowerShell

```vim
nnoremap <leader>S :!powershell -command
```

👉 shell command runnen

---

## 🔹 Paste mode

```vim
<F2> → toggle paste mode
```

👉 voorkomt auto-indent bij plakken

---

## 🔹 Yank

```vim
nnoremap Y y$
```

👉 Y = tot einde regel (consistent met D en C)

---

## 🔹 File openen

```vim
nnoremap <leader>gf :e <cfile>
```

👉 opent bestand onder cursor

---

## 🔹 Numbers toggle

```vim
nnoremap <leader>n :NumbersToggle
```

👉 wisselt relatieve/absolute nummers

---

## 🔹 Retab

```vim
nmap <leader>T :retab!
```

👉 converteert tabs ↔ spaces

---

## 🔹 Buffers

```vim
<C-t> → vorige buffer
```

👉 zoals “tab terug” in browser

---

```vim
<leader>D → buffer sluiten maar split behouden
```

---

## 🔹 Movement tweaks

```vim
nnoremap j gj
nnoremap k gk
```

👉 bewegen per visuele regel (bij wrap!)

---

```vim
arrow keys disabled
```

👉 je dwingt jezelf tot hjkl

---

## 🔹 Lines verplaatsen

```vim
<C-Up> / <C-Down>
<C-k> / <C-j>
```

👉 regels omhoog/omlaag “bubblen”

---

## 🔹 Duplicate line

```vim
<leader>d
```

---

## 🔹 Reload config

```vim
<leader>r
```

---

## 🔹 Strip whitespace

```vim
<leader>W
```

👉 trailing spaces verwijderen

---

# 🧩 4. Plugins (exact + jouw gebruik)

---

## 🔶 1. ctrlp.vim (centrale navigatie)

👉 Jouw primaire file finder

### Config:

* negeert build/node_modules etc.
* gebruikt `ag` als backend
* caching uit (want ag is snel)

👉 Gebruik:

```
:CtrlP
```

---

## 🔶 2. ack.vim + ag

👉 zoeken in project

### Jouw setup:

```vim
let g:ackprg = 'ag --vimgrep'
```

👉 supersnel zoeken

---

## 🔶 3. ale (linting + fixing)

👉 jouw “code intelligence”

### Doet:

* linting (errors/warnings)
* auto-fix bij opslaan

```vim
let g:ale_fixers = ['trim_whitespace', 'prettier', 'eslint']
let g:ale_fix_on_save = 1
```

👉 Dus bij save:

* whitespace weg
* prettier
* eslint fix

---

## 🔶 4. vim-gitgutter

👉 toont git wijzigingen in de gutter

* realtime UIT (performance)

---

## 🔶 5. vim-fugitive

👉 git commands in Vim

Gebruik:

```
:G
:Gdiff
:Gblame
```

---

## 🔶 6. vim-rooter

👉 automatisch naar project root

```vim
let g:rooter_patterns=['.ctrlp', 'project.xml', '.git/']
```

---

## 🔶 7. vim-airline

👉 statusbar

### Extra:

* ALE integratie
* tabline met buffers

---

## 🔶 8. vim-surround

👉 tekst manipulatie (quotes, tags)

---

## 🔶 9. vim-unimpaired

👉 handige shortcuts zoals:

* `[e` / `]e` → errors navigeren
* etc.

---

## 🔶 10. vim-move

👉 regels verplaatsen

```vim
let g:move_key_modifier = 'C'
```

→ Ctrl + beweging

---

## 🔶 11. numbers.vim

👉 toggle relatieve nummers

---

## 🔶 12. supertab

👉 tab = autocomplete (basic)

---

## 🔶 13. vim-polyglot

👉 syntax highlighting voor veel talen

---

## 🔶 14. editorconfig-vim

👉 respecteert `.editorconfig`

---

## 🔶 15. tComment

👉 comment plugin

---

## 🔶 16. vim-dispatch

👉 async build/test runnen

---

# 🔄 5. Automatiseringen

## Restore cursor

Bij openen → terug naar laatste positie

---

## Strip whitespace

* handmatig: `\W`
* automatisch bij save

---

## Grote bestanden

> > 1MB → syntax uit (performance)

---

## Splits

```vim
set splitbelow
set splitright
```

👉 nieuwe splits voelen natuurlijk

---

## Resize

```vim
autocmd VimResized * wincmd =
```

👉 alles blijft netjes verdeeld

---

# 🧭 6. Hoe jij Vim gebruikt (praktisch)

Jouw workflow:

### 🔍 Navigeren

* `:CtrlP` → bestand zoeken
* `\a` → tekst zoeken

### ✏️ Bewerken

* standaard Vim + surround + move

### 🧹 Opslaan

* ALE fixt automatisch
* whitespace wordt gestript

### 🧠 Feedback

* ALE toont errors
* gitgutter toont changes
