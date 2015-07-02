# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe 'Squint Test', ->
  getWorkspaceView = -> atom.views.getView(atom.workspace)
  getEditorView    = -> atom.views.getView(atom.workspace.getActiveTextEditor())

  squintTest = ->
    atom.commands.dispatch(getWorkspaceView(), 'squint-test:toggle')

  describe "squint-test:toggle", ->
    it "toggles the .squint-text class", ->
      waitsForPromise ->
        atom.workspace.open('sample.js')

      runs ->
        atom.packages.activatePackage('squint-test')

        expect(getEditorView()).not.toHaveClass('squint-test')

        squintTest()

        expect(getEditorView()).toHaveClass('squint-test')

        squintTest()

        expect(getEditorView()).not.toHaveClass('squint-test')
