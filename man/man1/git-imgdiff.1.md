git-imgdiff(1) - Visually diff images in git
============================================

## SYNOPSIS

`git-imgdiff` <oldfile> <newfile>

## DESCRIPTION

`git-imgdiff` is not intended to be used directly. It is much easier to let `git` invoke `git-imgdiff` as part of a `git-diff` command.

To install `git-imgdiff`, add the following setting to your git config:

``` sh
[core]
	attributesfile = ~/.gitattributes
```

Then, create the `~/.gitattributes` with the following contents:

``` sh
*.gif diff=image
*.jpg diff=image
*.png diff=image
```

Now, when trying to `git-diff` any of those image formats, `git-imgdiff` will be invoked.

Adapted from http://www.akikoskinen.info/image-diffs-with-git/
