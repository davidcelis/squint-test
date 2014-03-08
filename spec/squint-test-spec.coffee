{WorkspaceView} = require 'atom'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "Squint Test", ->
  [editorView] = []

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    atom.workspaceView.openSync('sample.js')

    atom.packages.activatePackage('squint-test')
    atom.workspaceView.attachToDom()

    editorView = atom.workspaceView.getActiveView()

  describe "when the squint-test:toggle event is triggered", ->
    it "toggles the .squint-test class to the active editorView", ->
      expect(editorView).not.toHaveClass('squint-test')

      atom.workspaceView.trigger 'squint-test:toggle'
      expect(editorView).toHaveClass('squint-test')

      atom.workspaceView.trigger 'squint-test:toggle'
      expect(editorView).not.toHaveClass('squint-test')
