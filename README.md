# Clip library configured with Premake5

This project is a simple Premake5 configuration of Clip. The following builds are available:

* Static library 32 bit or 64 bit

## Build

Fetch this project along with Lua sources
```
git clone --recurse-submodules git@github.com:KyrietS/ClipLib.git
```

Generate project files
```
premake5 (vs2022|gmake2|...)
```

Note: header files needed for using Clip library are automatically copied into `build/bin/{CONFIG}/include` directory.
