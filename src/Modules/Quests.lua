-- TODO: move following section to KCDFW upon proper testing and expansion
-- <move_to_kcdfw>

jester.disableQuest = function(quest)
	QuestSystem.DeactivateQuest(quest);
end

jester.enableQuest = function(quest)
	QuestSystem.ActivateQuest(quest);
end

jester.resetQuest = function(quest)
	QuestSystem.ResetQuest(quest);
end

jester.startQuest = function(quest)
	QuestSystem.StartQuest(quest);
end

jester.startQuestObjective = function(quest, objective)
	QuestSystem.StartObjective(quest, objective);
end

-- </move_to_kcdfw>


jester.cmdQuest = function(args)
	local enable = (args.enable or args.e);
	local disable = (args.disable or args.d);
	local reset = (args.reset or args.r);
	local start = (args.start or args.s);
	local objective = (args.objective or args.obj or args.o);
	local quest = (args.quest or args.q);

	-- TODO: sanity checking

	if disable then
		jester.disableQuest(quest);
	end

	if reset then
		jester.resetQuest(quest);
	end

	if enable then
		jester.enableQuest(quest);
	end

	if start then
		jester.startQuest(quest);
	end

	if objective then
		jester.startQuestObjective(quest, ((kcdfw.isInt(objective) and objective) or 1));
	end
end

kcdfw.registerCommand(
	"jester_quest",
	"jester.cmdQuest(cmdtab(%line))",
	"Quest system manipulation.",
	{
		e = "Enable the specified quest.",
		r = "Reset the specified quest.",
		d = "Disable the specified quest.",
		s = "Start the specified quest.",
		o = "Start the given objective on the specified quest.",
		q = "Specify quest to act on."
	}
);
