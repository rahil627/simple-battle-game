git pull
git pull --recurse-submodules
#git submodule foreach git pull
git add -A
git commit -a -m "update git submodules"


# If you want your submodules to be updated to the lastest used by your main project ("game" in my example), then you can use
#git pull --recurse-submodules

# when you update your main project to also update the submodules. Also, you can always use
#git submodule update --init
