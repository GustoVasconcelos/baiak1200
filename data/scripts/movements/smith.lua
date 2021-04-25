local config = {
	[61250] = {bellowPos = Position(178, 4, 7), cruciblePos = Position(178, 3, 7), hotlavaPos = Position(179, 3, 7), mould1Pos = Position(179, 3, 7), mould2Pos = Position(179, 4, 7), mould3Pos = Position(179, 5, 7)},
}

local tempo = 60 -- em segundos

local iniciaSmith = MoveEvent()

function iniciaSmith.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	for index, value in pairs(config) do
		if item.actionid == index then
			if(item.itemid == 10039)then
				item:transform(8670)
				doSendMagicEffect(value.cruciblePos, CONST_ME_FIREAREA)
				addEvent(function()
					item:transform(10039)
				end, 1 * tempo * 1000)
				-- crucible
				crucible = Tile(value.cruciblePos)
				crucible:getItemById(8642):transform(8641)
				addEvent(function()
					crucible:getItemById(8641):transform(8642)
				end, 1 * tempo * 1000)
				-- hotlava
				hotlava = Tile(value.hotlavaPos)
				Game.createItem(8673, 1, value.hotlavaPos)
				addEvent(function()
					hotlava:getItemById(8673):remove()
				end, 1 * tempo * 1000)
				-- mould1
				mould1 = Tile(value.mould1Pos)
				mould1:getItemById(8653):transform(8649)
				addEvent(function()
					mould1:getItemById(8649):transform(8653)
				end, 1 * tempo * 1000)
				-- mould2
				mould2 = Tile(value.mould2Pos)
				mould2:getItemById(8646):transform(8645)
				addEvent(function()
					mould2:getItemById(8645):transform(8646)
				end, 1 * tempo * 1000)
				-- mould3
				mould3 = Tile(value.mould3Pos)
				mould3:getItemById(8647):transform(8643)
				addEvent(function()
					mould3:getItemById(8643):transform(8647)
				end, 1 * tempo * 1000)
			end
		end
	end
end

iniciaSmith:type("stepin")

for index, value in pairs(config) do
	iniciaSmith:aid(index)
end

iniciaSmith:register()
