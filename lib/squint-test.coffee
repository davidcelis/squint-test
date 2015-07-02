module.exports =
  activate: (state) ->
    atom.commands.add 'atom-workspace', 'squint-test:toggle': => @toggle()

  toggle: ->
    editor = atom.views.getView atom.workspace.getActiveTextEditor()

    editor.classList.toggle 'squint-test'
