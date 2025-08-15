#include "raylib.h"

int main(void)
{
    const int SCREEN_WIDTH = 1280;
    const int SCREEN_HEIGHT = 720;
    const char *TEXT = "Hello from the custom raylib template!";
    const int FONT_SIZE = 32;

    InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Raylib Template");
    SetTargetFPS(60);

    while (!WindowShouldClose())
    {
        BeginDrawing();
        {
            ClearBackground(BLUE);
            DrawText(
                TEXT,
                SCREEN_WIDTH / 2 - MeasureText(TEXT, FONT_SIZE) / 2,
                SCREEN_HEIGHT / 2,
                FONT_SIZE,
                RAYWHITE
            );
        }
        EndDrawing();
    }

    CloseWindow();
    return 0;
}
