import os, strformat

let args = commandLineParams()

if args.len != 3:
    quit(&"Usage: ModLink [-r|-a] <mod groups src dir> <mod dest dir>\nOptions:\n -a : add mode\n -r : remove mode")

let remove = args[0] == "-r"
let src = args[1]
let dest = args[2]

for file in src.walkDirRec():
    if not remove:
        createHardlink(file, dest / file.extractFilename())
    else:
        removeFile(dest / file.extractFilename())