# textmate

Configuring the best `$EDITOR` in the world!

#### strip trailing whitespace on save

> Adapted from http://tm2tips.tumblr.com/post/42657705618/strip-trailing-whitespace-on-save-with-callbacks

1. Open the bundle editor to `Text` → `Menu Actions` → `Converting / Stripping` → `Remove Trailing Spaces in Document / Selection`
1. Enter `callback.document.will-save` in `Semantic Class`
1. Change `Input` to `Document` and `Output` to `Replace Document`
1. Change `Caret Placement` to `Line Interpolation`
