from sys import platform
import os
platform == 'other'
if platform != "win32":
    if platform == "darwin":
        os.system('sudo bash macos.sh')
    else:
       pass

else:
    print("Bundle doesn't work for windows")
    print("Consider swithing to a unix system")
