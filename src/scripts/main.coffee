{app, BrowserWindow} = require 'electron'
path = require 'path'
url = require 'url'
win = null

createWindow = () ->
  win = new BrowserWindow({width: 800, height: 600})

  win.loadURL(url.format({
    pathname: path.join(__dirname, "../../app/views/index.html"),
    protocol: "file:",
    slashes: true
  }))

  win.webContents.openDevTools()

  win.on 'closed', ->
    win = null
    return
  return

app.on 'ready', ->
  createWindow()
  return

app.on 'windows-all-closed', ->
  app.quit() if process.platform is not 'darwin'
  return

app.on 'activate', ->
  createWindow() if win is null
  return