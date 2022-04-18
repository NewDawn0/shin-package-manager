from sys import platform
import os
platform == 'other'
if platform != "win32":
    if platform == "darwin":
        os.system('sudo bash install/configs.sh')
        os.system('sudo bash install/macos.sh')
    else:
       pass

else:
    print("Shin doesn't work for windows")
    print("Consider swithing to a unix system")
