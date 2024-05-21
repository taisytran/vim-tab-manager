# vim-tab-manager

`vim-tab-manager` is a Vim plugin designed to simplify tab management with custom key mappings and the ability to rename tabs.

## Features

- Open new tabs easily with custom key mappings.
- Navigate between tabs using intuitive key bindings.
- Rename tabs for better organization and readability.

## Installation

To install `vim-tab-manager`, you can use [vim-plug](https://github.com/junegunn/vim-plug). Add the following lines to your `.vimrc`:

```vim
call plug#begin('~/.vim/plugged')

Plug 'taisytran/vim-tab-manager'

call plug#end()
```

Then, run `:PlugInstall` in Vim to install the plugin.

## Usage

Here are the default key mappings provided by `vim-tab-manager`:

- `tn`: Open a new tab.
- `t1` to `t9`: Switch to tab 1 to tab 9.
- `<Tab>`: Go to the next tab.
- `<S-Tab>`: Go to the previous tab.
- `tr`: Rename the current tab.

### Opening and Navigating Tabs

- To open a new tab, press `tn`.
- To switch to a specific tab, use `t` followed by the tab number (e.g., `t1` for tab 1, `t2` for tab 2, etc.).
- To navigate to the next tab, press `<Tab>`.
- To navigate to the previous tab, press `<S-Tab>` (Shift + Tab).

### Renaming Tabs

- To rename the current tab, press `tr` and enter the new tab name when prompted.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
