jester.resetQuest = function (cmdline)
	local args = kcdfw.parseCmdline(cmdline);
	local quest = args["quest"];

	if not quest then
		kcdfw.logError(jester.package.name, "Invalid quest given");
		return;
	end

end

kcdfw.registerCommand(
	"jester_quest_reset",
	"jester.resetQuest(%line)",
	"test"
);
