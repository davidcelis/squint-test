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

  describe "when the squint-test:toggle event is triggered", ->
    it "adds the .squint-test class to each editorView", ->
      expect(atom.workspaceView.find('.squint-test').length).toBe 0

      atom.workspaceView.trigger 'squint-test:toggle'
      expect(atom.workspaceView.find('.squint-test').length).toBe 1

      atom.workspaceView.trigger 'squint-test:toggle'
      expect(atom.workspaceView.find('.squint-test').length).toBe 0
