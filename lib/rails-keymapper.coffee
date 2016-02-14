RailsKeymapperView = require './rails-keymapper-view'
{CompositeDisposable} = require 'atom'

module.exports = RailsKeymapper =
  railsKeymapperView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @railsKeymapperView = new RailsKeymapperView(state.railsKeymapperViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @railsKeymapperView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-text-editor', 'rails-keymapper:insert-erb-quotes': => @insert_erb_quotes()
    @subscriptions.add atom.commands.add 'atom-text-editor', 'rails-keymapper:insert-image-tag': => @insert_image_erb()
    @subscriptions.add atom.commands.add 'atom-text-editor', 'rails-keymapper:insert-link-tag': => @insert_link_erb()
    @subscriptions.add atom.commands.add 'atom-text-editor', 'rails-keymapper:insert-button-tag': => @insert_button_erb()
    @subscriptions.add atom.commands.add 'atom-text-editor', 'rails-keymapper:insert-form-erb': => @insert_form_erb()
    @subscriptions.add atom.commands.add 'atom-text-editor', 'rails-keymapper:insert-formtag-erb': => @insert_form_tag_erb()
    @subscriptions.add atom.commands.add 'atom-text-editor', 'rails-keymapper:insert-label-tag-erb': => @insert_label_tag_erb()
    @subscriptions.add atom.commands.add 'atom-text-editor', 'rails-keymapper:insert-checkbox-tag-erb': => @insert_checkbox_tag_erb()
    @subscriptions.add atom.commands.add 'atom-text-editor', 'rails-keymapper:insert-radio-tag-erb': => @insert_radio_tag_erb()
    @subscriptions.add atom.commands.add 'atom-text-editor', 'rails-keymapper:insert-textarea-tag-erb': => @insert_textarea_tag_erb()
    @subscriptions.add atom.commands.add 'atom-text-editor', 'rails-keymapper:insert-text-tag-erb': => @insert_text_tag_erb()
    @subscriptions.add atom.commands.add 'atom-text-editor', 'rails-keymapper:insert-password-tag-erb': => @insert_password_tag_erb()
    @subscriptions.add atom.commands.add 'atom-text-editor', 'rails-keymapper:insert-hidden-tag-erb': => @insert_hidden_tag_erb()
    @subscriptions.add atom.commands.add 'atom-text-editor', 'rails-keymapper:insert-if-erb': => @insert_if_erb()


  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @railsKeymapperView.destroy()

  serialize: ->
    railsKeymapperViewState: @railsKeymapperView.serialize()

  insert_erb_quotes: ->
    editor = atom.workspace.getActiveTextEditor()
    editor.insertText("<%= %>")

  insert_image_erb: ->
    editor = atom.workspace.getActiveTextEditor()
    editor.insertText('<%= image_tag "image.png",:class => "",:width => "",:height=>"" %>')

  insert_link_erb: ->
    editor = atom.workspace.getActiveTextEditor()
    editor.insertText('<%= link_to "This is a link","somewhere",:class => "", %>')
  insert_button_erb: ->
    editor = atom.workspace.getActiveTextEditor()
    editor.insertText('<%= button_to "This is a link","somewhere",:class => "", %>')

  insert_form_erb: ->
    editor = atom.workspace.getActiveTextEditor()
    editor.insertText('<%= form_for @object, url: {action: "action_name"}, html: {class: "nifty_form"} do |f|  %>   <%= f.text_field :title %>\n <%= f.text_area :body, size: "60x12" %>\n<%= f.submit "Create" %>\n <% end %>')
  insert_text_form_erb: ->
    editor = atom.workspace.getActiveTextEditor()
    editor.insertText('<%= f.text_field "text-field-name" ,"some value",:class => "" ,:placeholder => "Enter something..." %>')


  insert_form_tag_erb: ->
    editor = atom.workspace.getActiveTextEditor()
    editor.insertText('<%= form_tag(controller: "controller_name", action: "action_name", method: "post", class: "nifty_form") %> <% end %>')
  insert_label_tag_erb: ->
    editor = atom.workspace.getActiveTextEditor()
    editor.insertText('<%= label_tag(:attribute_name,"Label Text") %>')

  insert_checkbox_tag_erb: ->
    editor = atom.workspace.getActiveTextEditor()
    editor.insertText('<%= check_box_tag(:attribute_name,:class => "class_name") %>')

  insert_radio_tag_erb: ->
    editor = atom.workspace.getActiveTextEditor()
    editor.insertText('<%= radio_button_tag(:attribute_name, "value") %>')

  insert_textarea_tag_erb: ->
    editor = atom.workspace.getActiveTextEditor()
    editor.insertText('<%= text_area_tag(:message, "Hi, nice site", size: "24x6")%>')

  insert_password_tag_erb: ->
    editor = atom.workspace.getActiveTextEditor()
    editor.insertText('<%=  password_field_tag(:password) %>')

  insert_hidden_tag_erb: ->
    editor = atom.workspace.getActiveTextEditor()
    editor.insertText('<%=  hidden_field_tag(:attribute_name, "Value") %>')

  insert_text_tag_erb: ->
    editor = atom.workspace.getActiveTextEditor()
    editor.insertText('<%= text_field_tag "text-field-name" ,"some value",:class => "" ,:placeholder => "Enter something..." %>')

  insert_if_erb: ->
    editor = atom.workspace.getActiveTextEditor()
    editor.insertText('<% if condition %> \n <% do this%> \n <% else %> \n<% do that %> \n<% end %>')
