## Haskell Pretty Symbol Mode

This is a package which "replaces" common haskell syntax
with pretty unicode. The strings are not actually replaced in file,
just restyled in your Emacs buffer.

I stole most of the code from https://github.com/epa095/latex-pretty-symbols.el.

### Contribution

Feel free to add a symbol and open a PR.

### Usage

Copy the `.el` file to a place that your emacs can find.  Then, assuming you are
already using `haskell-mode`, add to your `~/.emacs`:

```lisp
(add-hook 'haskell-mode-hook 'haskell-pretty-symbol-mode)
```

Can also use whatever hook or mechanism you like for enabling the mode.

