# rails-keymapper package

This is a every simple package meant as a convenience package for rails developer. Its provides shortcuts to insert erb snippets using the menu.
This is the first version and hence very less number of snippets have been included and I will keep on updating the snippets.
Currently, I have not added any keyboard shortcuts as it is very subjective in nature and users can use the snippet addition using the menu above as

`Packages -> Rails ERB Tags`

The list of available snippets can be seen there.
For users interested in adding their own key bindings, one can always edit the keymap file located in

`~/.atom/keymap.cson`

The following syntax can use used:

```
"atom-text-editor":
    "alt-cmd-z': 'rails-keymapper:cut-line"
```

The list of available commands which are hopefully self explanatory:

```javascript
"rails-keymapper:insert-erb-quotes"
"rails-keymapper:insert-image-tag"
"rails-keymapper:insert-link-tag"
"rails-keymapper:insert-button-tag"
"rails-keymapper:insert-form-erb"
"rails-keymapper:insert-formtag-erb"
"rails-keymapper:insert-label-erb"
"rails-keymapper:insert-checkbox-tag-erb"
"rails-keymapper:insert-textarea-tag-erb"
"rails-keymapper:insert-radio-tag-erb"
"rails-keymapper:insert-text-tag-erb"
"rails-keymapper:insert-password-tag-erb"
"rails-keymapper:insert-hidden-tag-erb"
"rails-keymapper:insert-if-erb"
```

# TODO:
* Update README
* Add more snippets
* Check page to add snippets accordingly
* Add keyboard shortcuts
