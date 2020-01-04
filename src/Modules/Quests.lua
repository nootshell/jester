jester.deactivateQuest = function (cmdline)
	local args = kcdfw.parseCmdline(cmdline);
	local quest = (args["q"] or args["quest"]);
	if not quest then
		kcdfw.logError(jester.package.name, "Invalid quest given");
		return;
	end

	QuestSystem.DeactivateQuest(quest);
	QuestSystem.CancelQuest(quest);
end

kcdfw.registerCommand(
	"jester_quest_deactivate",
	"jester.deactivateQuest(%line)",
	"Deactivate the given quest.",
	"-q <quest>"
);


jester.activateQuest = function (cmdline)
	local args = kcdfw.parseCmdline(cmdline);
	local quest = (args["q"] or args["quest"]);
	if not quest then
		kcdfw.logError(jester.package.name, "Invalid quest given");
		return;
	end

	QuestSystem.ActivateQuest(quest);
end

kcdfw.registerCommand(
	"jester_quest_activate",
	"jester.activateQuest(%line)",
	"Activate the given quest.",
	"-q <quest>"
);


jester.resetQuest = function (cmdline)
	local args = kcdfw.parseCmdline(cmdline);

	local quest = (args["q"] or args["quest"]);
	if not quest then
		kcdfw.logError(jester, "Invalid quest given");
		return;
	end

	local deact = (args["d"] or args["deactivate"]);

	if deact then
		jester.deactivateQuest(cmdline);
	end

	QuestSystem.ResetQuest(quest);
	QuestSystem.StartQuest(quest);
	QuestSystem.StartObjective(quest, 1);

	if deact then
		jester.activateQuest(cmdline);
	end
end

kcdfw.registerCommand(
	"jester_quest_reset",
	"jester.resetQuest(%line)",
	"Reset the given quest. Use -d to also deactivate and reactivate the quest.",
	"-q <quest> [-d]"
);
