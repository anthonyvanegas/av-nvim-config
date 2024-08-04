# Vim Configuration (`.vimrc` or `init.vim`)

This repository contains a Vim configuration file that customizes the behavior and appearance of Vim. The configuration file is typically located at `~/.vimrc` for Vim or `~/.config/nvim/init.vim` for Neovim.

## Key-Maps

- **Project Management**:
    - `Space + a`: Add file to harpoon.
    - `Crtl + e`: View files in harpoon.
    - `Space + pf`: Find file in project.
    - `Space + ps`: Find in project files w/ Grep.
    - `Space + pv`: View project files.

- **Git Control**:
    - `Space + gs`: Open Git Status.
    - `Crtl + p`: Find file in Git.

- **Appearance**:
    - `:lua ResetAppearance()`: Reset appreance after running `:PackerSync`.

- **Editing**:
    - `Space + u`: View undotree. 
    - `Ctrl + p`: Autocomplete previous.
    - `Ctrl + n`: Autocomplete next.
    - `Ctrl + y`: Autocomplete accept.
    - `Ctrl + Space`: Autocomplete start.
    - `Space + gs`: Go to definition.


- **Code Running**:
    - `Space + r`: Run Code while inside file. #Done
    - `Space + rf`: Run file.

## Notes
    - This is heavily based on ThePrimeagen's [setup](https://github.com/ThePrimeagen/init.lua/commit/33eee9ad0c035a92137d99dae06a2396be4c892e).
        Following the [video](https://www.youtube.com/watch?v=w7i4amO_zaE&list=PLm323Lc7iSW_wuxqmKx_xxNtJC_hJbQ7R&index=6), I had to make adjustments to work with some updated packages. This was a good indepth learning experince w/ lua.
