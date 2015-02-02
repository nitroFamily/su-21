var hostname = window.location.hostname
var port = window.location.port
var opts = {
  container: 'epiceditor',
  textarea: 'post_text',
  basePath: 'epiceditor',
  clientSideStorage: false,
  useNativeFullsreen: true,
  parser: marked,
  file: {
    name: 'epiceditor',
    defaultContent: '',
    autoSave: 100
  },
  theme: {
    base: 'https://' + hostname + ':' + port + '/assets/epic/epiceditor.css',
    preview: 'https://' + hostname + ':' + port + '/assets/bootstrap.css',
    editor: 'https://' + hostname + ':' + port + '/assets/epic/epic-light.css'
  },
  button: {
    preview: true,
    fullscreen: true
  },
  focusOnLoad: false,
  shortcut: {
    modifier: 18,
    fullscreen: 70,
    preview: 80
  },
  string: {
    togglePreview: 'Toggle Preview Mode',
    toggleEdit: 'Toggle Edit Mode',
    toggleFullscreen: 'Enter Fullscreen'
  }
};
