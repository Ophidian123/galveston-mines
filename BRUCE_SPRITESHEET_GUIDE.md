# Bruce sprite sheet setup

Use `bruce_spriteframes_32px.png` in Godot's SpriteFrames editor with a **32 × 32** frame grid.

| Row | Frames | Animation name | Purpose |
| --- | --- | --- | --- |
| 0 | 0–3 | `idle_breathe` | Small body bob and arm shift |
| 1 | 0–3 | `walk_four_step` | Contact / passing walk cycle |
| 2 | 0–5 | `run_long_stride` | Leaning, long-stride run cycle |
| 3 | 0–1 | `jump_tuck` | Airborne tucked-knee loop |
| 4 | 0–1 | `crouch_low` | Half-height crouch loop |
| 5 | 0–3 | `slide_extended` | Low horizontal slide loop |

Use `hanging_lantern.png` in a separate SpriteFrames node with **4 horizontal frames**, each **32 × 64**. Name the animation `swing_fast` and set it to **10–12 FPS** for a noticeable quick swing.
