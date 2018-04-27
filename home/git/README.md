# Git config files

## hooks
I changed hook script directory to `home/config/git/hooks` by running this command.

```
git config core.hooksPath ~/.config/git/hooks
```

By this change, default hook directory `{repo root}/.git/hooks` no longer used.
