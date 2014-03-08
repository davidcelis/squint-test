module.exports =
  activate: (state) ->
    atom.workspaceView.command 'squint-test:toggle', => @toggle()

  toggle: ->
    atom.workspaceView.getActiveView().toggleClass 'squint-test'
