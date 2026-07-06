-- By Saifeddine Ben Salem
script_name("GetCoords")
script_description("Display your current position, facing angle, and camera coordinates.")
script_version_number("1")
script_version("1.0")
script_authors("GetCoords")
script_dependencies("None")

function main()
	repeat wait(0) until isSampAvailable()
	wait(2000)
	sampAddChatMessage("[GetCoords] {FFFFFF}Loaded - use {FF9E00}/getcoords", 0xFF9E00)
	sampRegisterChatCommand("getcoords", getcoords)
	while true do
		wait(50)
	end
end

function getcoords()
	if not isSampLoaded() then
		sampAddChatMessage("[GetCoords] {FFFFFF}SA-MP is not loaded.", 0xFF9E00)
		return
	end

	if not doesCharExist(PLAYER_PED) then
		sampAddChatMessage("[GetCoords] {FFFFFF}Player is not spawned.", 0xFF9E00)
		return
	end

	local okPos, x, y, z = pcall(getCharCoordinates, PLAYER_PED)
	if not okPos or x == nil or y == nil or z == nil then
		sampAddChatMessage("[GetCoords] {FFFFFF}Could not read player coordinates.", 0xFF9E00)
		return
	end

	local okHeading, heading = pcall(getCharHeading, PLAYER_PED)
	if not okHeading or heading == nil then
		sampAddChatMessage("[GetCoords] {FFFFFF}Could not read facing angle.", 0xFF9E00)
		return
	end

	local okCam, camX, camY, camZ = pcall(getActiveCameraCoordinates)
	if not okCam or camX == nil or camY == nil or camZ == nil then
		sampAddChatMessage("[GetCoords] {FFFFFF}Could not read camera coordinates.", 0xFF9E00)
		return
	end

	sampAddChatMessage(string.format("X: %.4f", x), 0xFFFFFF)
	sampAddChatMessage(string.format("Y: %.4f", y), 0xFFFFFF)
	sampAddChatMessage(string.format("Z: %.4f", z), 0xFFFFFF)
	sampAddChatMessage(string.format("Facing Angle: %.2f°", heading), 0xFFFFFF)
	sampAddChatMessage(string.format("Camera X: %.4f", camX), 0xFFFFFF)
	sampAddChatMessage(string.format("Camera Y: %.4f", camY), 0xFFFFFF)
	sampAddChatMessage(string.format("Camera Z: %.4f", camZ), 0xFFFFFF)
	sampAddChatMessage(string.format("Toward +X (West): %.2f deg", getHeadingFromVector2d(100.0, 0.0)), 0xFFFFFF)
	sampAddChatMessage(string.format("Toward +Y (North): %.2f deg", getHeadingFromVector2d(0.0, 100.0)), 0xFFFFFF)
	sampAddChatMessage(string.format("Toward -Y (South): %.2f deg", getHeadingFromVector2d(0.0, -100.0)), 0xFFFFFF)
end
