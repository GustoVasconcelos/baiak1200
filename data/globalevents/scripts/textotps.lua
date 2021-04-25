local effects = {
	{position = Position(155, 47, 7), text = '[Bosses]', effect = 197},
	{position = Position(154, 47, 7), text = '[Trainers]', effect = 197},
	{position = Position(153, 47, 7), text = '[Teleports]', effect = 197},
	{position = Position(159, 52, 7), text = '[PVP Arena]', effect = 197},
	{position = Position(152, 47, 7), text = '[Mining]', effect = 197},
	{position = Position(151, 47, 7), text = '[Quests]', effect = 197},
	{position = Position(145, 48, 7), text = '[Trainning Offline]', effect = 197},
	{position = Position(142, 45, 7), text = '[Addons]', effect = 197},
	{position = Position(142, 47, 7), text = '[Tasks]', effect = 197},
}

function onThink(interval)
	for i = 1, #effects do
		local settings = effects[i]
		local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
		if #spectators > 0 then
			if settings.text then
				for i = 1, #spectators do
					spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
				end
			end
			
			if settings.effect then
				settings.position:sendMagicEffect(settings.effect)
			end
		end
	end
	return true
end