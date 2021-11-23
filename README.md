## Haskell Pretty Symbol Mood

This is a package which "replaces" common haskell syntax
with pretty unicode. The strings are not actually replaced in file,
just restyled in your Emacs buffer.

I stole most of the code from https://github.com/epa095/latex-pretty-symbols.el.

## FAQ

### Why?

I don't know.

### Is it complete?

No. You can open a PR if you want to add more symbols. It should be easy to
modify.

### Is it sensible?

No.

## Usage

Copy the `.el` file to a place that your emacs can find.  Then, assuming you are
already using `haskell-mode`, add to your `~/.emacs`:

```lisp
(add-hook 'haskell-mode-hook 'haskell-pretty-symbol-mode)
```

If that doesn't make sense, it likely means you haven't done a lot of emacs
bullshittery. In such a case, I don't encourage using this package.


