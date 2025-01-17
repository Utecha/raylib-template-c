## Getting Started

This template comes pre-setup with a build setup using CMake. You can opt to either
use it or your own custom build setup.

### CMake

Clone the repository (or download the zip):

```bash
git clone https://github.com/Utecha/raylib-template-c.git
```

If using clangd, in order for it to recognize the raylib include and function calls
line in the sample source file, you must first run the configuration
for CMake using:

```sh
cmake -S . -B build
```

Optionally, you can set the build type:

```sh
cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug
```

The available build types are (case-sensitive):

- Debug
- Release

After CMake has run its configuration, you
can then run this command to build the project:

```sh
cmake --build build
```

It is recommended that you add the option `-j x`, where 'x' is
the number of threads you want to build with. This can significantly reduce
build times.

The build folder will contain all related build files, including a directory
with the same name as the project. This directory contains the executable and
resources folder.

For the resources to load properly, you need to `cd` into `src` and
run the executable (`../build/${PROJECT_NAME}/${PROJECT_NAME}`) from there.

CMake will automatically fetch a current release of raylib and/or raygui. If you
happen to have it installed already on your system (say via a package manager),
it will default to using that instead.

You can also opt to use your own local version by passing the flag
`-DFETCHCONTENT_SOURCE_DIR_RAYLIB=<dir_with_raylib>` to the CMake configuration command.

## README Template

Below this section is the README template. It is expected that once you've
modified the LICENSE and README and familiarized yourself with the project setup
that you will delete everything above the separator line.

You can of course modify it how you want, but specific points that definitely
should be modified are marked with `$(Data to edit)`.

-----------------------------------

## $(Game Title)

![$(Game Title)](screenshots/screenshot000.png "$(Game Title)")

### Description

$(Your Game Description)

### Features

- $(Game Feature 01)
- $(Game Feature 02)
- $(Game Feature 03)

### Controls

Keyboard:

- $(Game Control 01)
- $(Game Control 02)
- $(Game Control 03)

### Screenshots

_TODO: Show your game to the world, animated GIFs recommended!_

### Developers

- $(Developer 01) - $(Role/Tasks Developed)
- $(Developer 02) - $(Role/Tasks Developed)
- $(Developer 03) - $(Role/Tasks Developed)

### Links

- YouTube Gameplay: $(YouTube Link)
- itch.io Release: $(itch.io Game Page)
- Steam Release: $(Steam Game Page)

### License

This game sources are licensed under an unmodified zlib/libpng license, which is
an OSI-certified, BSD-like license that allows static linking with closed source
software. Check [LICENSE](LICENSE) for further details.

$(Additional Licenses)

_Copyright (c) $(Year) $(User Name) ($(User Twitter/GitHub Name))_
