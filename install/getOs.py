from sys import platform
import webbrowser
from time import sleep
import os

def getDist ():
    print("1)   Arch and Arch based distributions")
    print("2)   Debian and Debian based distributions")
    print("")
    print("     If you are unsure about your distribution check one of these links:")
    print("     https://wiki.archlinux.org/title/Arch-based_distributions#Active")
    print("     https://distrowatch.com/search.php?basedon=Debian")
    print("")


if platform != "win32":
    if platform == "darwin":
        print("Platform: macOS (detected)")
        os.system('sudo bash install/configs.sh $(pwd)')
        os.system('sudo bash install/macos.sh')
    elif platform == "linux":
        print("Platform: linux (detected)")
        print("Enter the type of linux distribution")
        while True:
            getDist()
            value = input("Enter Number: ")
            try:
                intValue = int(value)
                if intValue in (1, 2):
                    break
            except ValueError:
                print("Enter a valid number")
                continue
        if intValue == 1:
            os.system('sudo bash install/configs.sh $(pwd)')
            os.system('sudo bash install/arch.sh')
        elif intValue == 2:
            os.system('sudo bash install/configs.sh $(pwd)')
            os.system('sudo bash install/debian.sh')
        else:
            print("Something went wrong")
            print("Aborting...")
            exit
    else:
        print("Shin doesn't work on " + platform)
        print("Consider swithing to a unix system")
        sleep(5)
        webbrowser.open("https://archlinux.org/download/")

else:
    print("Shin doesn't work on windows")
    print("Consider swithing to a unix system")
    sleep(5)
    webbrowser.open("https://archlinux.org/download/")
