# 🎯 GetCoords.lua Documentation

# <span style="color:#4CAF50;">Overview</span>

**GetCoords.lua** is a MoonLoader script for **SA-MP** that displays:
- Player X, Y, Z coordinates
- Facing angle (heading)
- Camera X, Y, Z coordinates
- Reference headings for world directions

---

# 📋 Requirements

## Required Software
- GTA: San Andreas (PC)
- SA-MP client
- MoonLoader
- CLEO 4+
- SAMPFUNCS (recommended/required for SA-MP Lua functions)
- Lua runtime included with MoonLoader

## Installation
1. Install GTA San Andreas.
2. Install SA-MP.
3. Install MoonLoader.
4. Install SAMPFUNCS.
5. Copy `getcoords.lua` into:
```
GTA San Andreas/moonloader/
```
6. Launch GTA SA, connect to a SA-MP server and wait until the script loads.

---

# 🚀 Loading Sequence

1. MoonLoader loads the script.
2. Waits until SA-MP becomes available.
3. Waits an additional 2 seconds.
4. Prints:
```
[GetCoords] Loaded - use /getcoords
```
5. Registers `/getcoords`.

---

# 💬 Command

```
/getcoords
```

Outputs:
- X
- Y
- Z
- Facing Angle
- Camera X
- Camera Y
- Camera Z
- Reference world headings

---

# 🔍 Safety Checks

Before reading coordinates the script verifies:
- SA-MP is loaded.
- The player is spawned.
- Coordinates can be read.
- Heading can be read.
- Camera coordinates can be read.

If any check fails an error is printed instead of crashing.

---

# 📦 Metadata

| Property | Value |
|----------|-------|
| Name | GetCoords |
| Version | 1.0 |
| Author | Saifeddine Ben Salem |
| Dependencies | None declared |

---

# 🧠 Functions

## main()
Initializes the script, waits for SA-MP, registers the command and keeps the script alive.

## getcoords()
Reads player and camera information and prints it to chat.

---

# 🌍 Coordinate System

- X = East / West position
- Y = North / South position
- Z = Height

Facing Angle is the direction the player faces.

---

# ⚠ Notes

- Only works while connected to a SA-MP server.
- The player must already be spawned.
- Requires MoonLoader API functions such as:
  - `sampRegisterChatCommand`
  - `sampAddChatMessage`
  - `getCharCoordinates`
  - `getCharHeading`
  - `getActiveCameraCoordinates`

---

# ✅ Summary

This script is a lightweight utility for developers that quickly retrieves player and camera coordinates through `/getcoords`, while performing validation to avoid runtime errors.
