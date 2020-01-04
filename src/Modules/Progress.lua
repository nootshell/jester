jester.saveGame = function ()
	Game.SaveGameViaResting();
end

kcdfw.registerCommand(
	"jester_save",
	"jester.saveGame()",
	"Create a save, without using schnapps."
);
