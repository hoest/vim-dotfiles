# 🧠 Overzicht van jouw Vim-configuratie

Jouw configuratie is eigenlijk geen “los .vimrc-bestand”, maar een **complete ontwikkelomgeving** met:

* Vim / Neovim (editor)
* Tmux (terminal multiplexer)
* Zsh (shell)
* Plugins (zoals autocomplete en file navigation)

Alles is zo ingesteld dat je **snel kunt navigeren, coderen en schakelen tussen bestanden** zonder je muis te gebruiken.

---

# ⌨️ Belangrijkste concept: de *leader key*

Je hebt de standaard Vim leader key (`\`) vervangen door:

👉 `,` (komma)

Dus:

* `,w` = leader + w
* `,q` = leader + q

Dit is belangrijk, want bijna al je shortcuts beginnen hiermee.

---

# 📂 Tabs & bestanden (belangrijkste shortcuts)

## Tabs openen en wisselen

| Shortcut      | Wat doet het                         |
| ------------- | ------------------------------------ |
| `Ctrl + t`    | Nieuwe tab openen                    |
| `,1` t/m `,9` | Ga naar specifieke tab               |
| `,0`          | Ga naar laatste tab                  |
| `Alt + 1..9`  | Zelfde maar werkt ook in insert mode |
| `,fn`         | Volgende tab                         |
| `,fp`         | Vorige tab                           |

## Tabs verplaatsen/sluiten

| Shortcut          | Wat doet het                  |
| ----------------- | ----------------------------- |
| `,fh`             | Tab naar links                |
| `,fl`             | Tab naar rechts               |
| `,qq`             | Huidige tab sluiten           |
| `,qo`             | Alles sluiten behalve huidige |
| `,q1`, `,q2`, etc | Specifieke tab sluiten        |

👉 Dit maakt tabs bijna als “browser tabs”.

---

# 🧭 Navigatie & cursor gedrag

Je gebruikt standaard Vim-bewegingen, maar waarschijnlijk aangevuld met plugins:

* `h j k l` → bewegen
* Sneller springen door relatieve nummers (vaak ingesteld)
* `%` → matching brackets

Vaak zit hier ook slimme navigation via plugins (zoals tags / fuzzy search).

---

# 🔍 Zoeken en bestanden openen

In combinatie met tools zoals fzf:

| Shortcut              | Wat doet het                |
| --------------------- | --------------------------- |
| `ff` (in terminal)    | Zoek bestand en open in Vim |
| `Ctrl + t` (terminal) | Kies bestand en plak naam   |
| `Alt + c`             | Navigeer naar directory     |

👉 Dit vervangt grotendeels “Explorer klikken”.

---

# 🧩 Plugins (belangrijk gedrag)

Je config gebruikt een plugin manager (waarschijnlijk vim-plug).

Typische features:

### Autocomplete (via CoC)

* Suggesties tijdens typen
* Tab completion
* Lijkt op VS Code gedrag

### File tree (NERDTree-achtig)

* Project structuur bekijken

### Status bar

* Informatie onderin (bestand, git status etc.)

### Syntax highlighting

* Voor veel talen automatisch

---

# 🎨 UI & uiterlijk

## In Vim:

| Shortcut | Wat doet het             |
| -------- | ------------------------ |
| `,b`     | Light/dark mode wisselen |
| `,o`     | Transparantie toggelen   |

👉 Werkt samen met je terminal (Alacritty).

---

# 🖥️ Tmux (heel belangrijk!)

Je gebruikt Tmux als “laag onder Vim”.

## Prefix key

👉 `Ctrl + a`

Daarna druk je een tweede toets.

---

## Sessies

| Shortcut   | Wat doet het  |
| ---------- | ------------- |
| `Ctrl+a c` | Nieuwe sessie |
| `Ctrl+a s` | Kies sessie   |
| `Ctrl+a $` | Rename sessie |

---

## Vensters

| Shortcut      | Wat doet het   |
| ------------- | -------------- |
| `Ctrl+a c`    | Nieuw window   |
| `Ctrl+a n`    | Volgende       |
| `Ctrl+a p`    | Vorige         |
| `Ctrl+a 1..9` | Ga naar window |

---

## Panels (splits)

| Shortcut         | Wat doet het |
| ---------------- | ------------ |
| `Ctrl+a Ctrl+t`  | Nieuwe pane  |
| `Ctrl+a H/J/K/L` | Resize pane  |

---

## Copy mode (heel handig!)

| Shortcut   | Wat doet het |
| ---------- | ------------ |
| `Ctrl+a [` | Copy mode    |
| `v`        | Selecteren   |
| `Enter`    | Kopiëren     |
| `Ctrl+a ]` | Plakken      |

---

# 🧵 Terminal (Alacritty)

Extra shortcuts:

| Shortcut         | Wat doet het        |
| ---------------- | ------------------- |
| `Cmd + n`        | Nieuwe terminal     |
| `Cmd + f`        | Zoeken              |
| `Cmd + + / -`    | Font groter/kleiner |
| `Ctrl + Cmd + f` | Fullscreen          |

---

# 🐚 Zsh (shell shortcuts)

| Shortcut   | Wat doet het            |
| ---------- | ----------------------- |
| `ff`       | Bestand zoeken + openen |
| `Ctrl + t` | Bestand selecteren      |
| `Alt + c`  | Directory kiezen        |

---

# ⚙️ Eigen uitbreidingen

Je hebt bewust ruimte gelaten voor eigen config:

### Plugins toevoegen:

```vim
~/.vimrc.plugins.local
```

### Eigen instellingen:

```vim
~/.vimrc.local
```
