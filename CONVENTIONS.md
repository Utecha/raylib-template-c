## C Coding Style Conventions

Code Element | Convention | Example
--- | :---: | ---
Defines | ALL_CAPS | `#define PLATFORM_DESKTOP`
Macros | ALL_CAPS | `#define MIN(a,b) (((a)<(b))?(a):(b))`
Variables | lowerCase | `int screenWidth = 0;`, `float targetFrameTime = 0.016f;`
Local variables | lowerCase | `Vector2 playerPosition = { 0 };`
Global variables | lowerCase | `bool fullscreen = false;`
Constants | lowerCase | `const int maxValue = 8;`
Pointers | MyType *pointer | `Texture2D *array = NULL;`
Floats | *always* x.xf | `float gravity = 10.0f`
Operators | value1 * value2 | `int product = value * 6;`
Operators | value1 / value2 | `int division = value / 4;`
Operators | value1 + value2 | `int sum = value + 10;`
Operators | value1 - value2 | `int res = value - 5;`
Enum | TitleCase | `enum TextureFormat`
Enum members | ALL_CAPS | `PIXELFORMAT_UNCOMPRESSED_R8G8B8`
Struct | TitleCase | `struct Texture2D`, `struct Material`
Struct typedef | TitleCase | `typedef struct Texture { ... } Texture;`
Struct members | lowerCase | `texture.width`, `color.r`
Functions | lowerCase | `main()`, `loadAssets()`
Functions params | lowerCase | `width`, `height`
Ternary Operator | (condition) ? result1 : result2 | `printf("Value is 0: %s", (value == 0) ? "yes" : "no");`

Other conventions:

- Trailing spaces are always avoided.
- All defined variables are ALWAYS initialized.

```c
int screenWidth = 1280;
```

- Four spaces are used, instead of TABS. Many editors will let you set the tab key
to output four spaces instead.

```c
while (!WindowShouldClose())
{
    BeginDrawing();
    {
        ClearBackground(BLACK);
    }
    EndDrawing();
}
```

- Control flow statements are followed **by a space**:

```c
if (condition) value = 0;

while (!WindowShouldClose())
{

}

for (int i = 0; i < NUM_VALUES; i++) printf("%i", i);

switch (value)
{
    case 0:
    {

    } break;
    case 2: break;
    default: break;
}
```

- All conditions are always between parenthesis, but **not** boolean values:

```c
if ((value > 1) && (value < 50) && valueActive)
{

}
```

- Braces and curly brackets always open-close in aligned mode:

```c
void someFunction()
{
   // TODO: Do something here!
}
```

## Files and Directories Naming Conventions

- Directories are named using `snake_case`: `resources/models`, `resources/fonts`
- Files are named using `snake_case`: `main_title.png`, `cubicmap.png`, `sound.wav`

*NOTE: Spaces and special characters are always avoided in file/directory names!*

## Example Directories Organization Conventions

- Resource files are organized by context and usage in the game. Loading requirements for data are also considered (grouping data when required).
- Descriptive names are used for the files. Just from reading the name of the file, it should be possible to know what that file is and where fits in the game.

```
resources/audio/fx/long_jump.wav
resources/audio/music/main_theme.ogg
resources/screens/logo/logo.png
resources/screens/title/title.png
resources/screens/gameplay/background.png
resources/characters/player.png
resources/characters/enemy_slime.png
resources/common/font_arial.ttf
resources/common/gui.png
```

*NOTE: Some resources are required to be loaded all at once, while others are required to be loaded only at initialization (gui, font).*
