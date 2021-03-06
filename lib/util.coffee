pathModule = require("path")
os = require "os"
fs = require "fs"
exports.copySync = (from,to)->
    symlinkSupports = ["linux","darwin"]
    if os.platform() in symlinkSupports
        fs.symlinkSync from,to
    else
        throw new Error "leafjs-tester not support on your platform"
exports.getFileInSearchPath = (file,pathes)->
    for path in pathes
        if fs.existsSync pathModule.resolve path,file
            return fs.readFileSync (pathModule.resolve path,file),"utf8"
    throw new Error "file #{file} not found in search pathes:\n #{pathes.join('\n')}"