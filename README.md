# dotfiles

Got some fixin' up to do.

## install

```
$ make && <TODO install homebrew> && brew bundle
```

## TODO

+ Download Xcode: https://itunes.apple.com/us/app/xcode/id497799835?ls=1&mt=12
+ Run `brew doctor` and ensure exit code 0 before continuing with any brew tasks
+ Write a `chomp` program

## .gitconfig

Default global git options will be symlinked to `~/.gitconfig`. Override these options (like `user.email`) on a per-project basis.

## Avatar

You'll probably want your avatar on your desktop: `curl -L $(boom echo me) > ~/Desktop/me.jpg`
