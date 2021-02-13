# goto\_test.nvim

A simple Golang equivalent of A.vim, which jumps from `foo.go` file to `foo_test.go`.

## Installation

Install via vim-plug:

```shell
Plug 'crispgm/goto_test.nvim'
```

## Usage

Default mapping:

```vim
nnoremap <leader>G <cmd>lua require'goto_test'.goto_test()<cr>
```

