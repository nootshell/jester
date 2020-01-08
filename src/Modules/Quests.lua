-- TODO: move following section to KCDFW upon proper testing and expansion
-- <move_to_kcdfw>

jester.disableQuest = function(quest)
	QuestSystem.DeactivateQuest(quest);
	kcdfw.logVerbose(jester, "Quest disabled: %s", quest);
end

jester.enableQuest = function(quest)
	QuestSystem.ActivateQuest(quest);
	kcdfw.logVerbose(jester, "Quest enabled: %s", quest);
end

jester.resetQuest = function(quest)
	QuestSystem.ResetQuest(quest);
	kcdfw.logVerbose(jester, "Quest reset: %s", quest);
end

jester.startQuest = function(quest)
	QuestSystem.StartQuest(quest);
	kcdfw.logVerbose(jester, "Quest started: %s", quest);
end

jester.startQuestObjective = function(quest, objective)
	QuestSystem.StartObjective(quest, objective);
	kcdfw.logVerbose(jester, "Quest objective started: %s, %u", quest, objective);
end

-- </move_to_kcdfw>




jester.cmdQuest = function(args)
	local enable = (args.enable or args.e);
	local disable = (args.disable or args.d);
	local reset = (args.reset or args.r);
	local start = (args.start or args.s);
	local objective = (args.objective or args.obj or args.o);
	local quest = (args.quest or args.q);


	if reset then
		if not objective then
			objective = 1
		end
	end

	if objective and not kcdfw.isInt(objective) then
		kcdfw.logError(jester, "Objective not a valid integer: %s", tostring(objective));
		return;
	end


	local didSomething = false;

	if disable then
		jester.disableQuest(quest);
		didSomething = true;
	end

	if reset then
		jester.resetQuest(quest);
		didSomething = true;
	end

	if enable then
		jester.enableQuest(quest);
		didSomething = true;
	end

	if start then
		jester.startQuest(quest);
		didSomething = true;
	end

	if objective then
		jester.startQuestObjective(quest, objective);
		didSomething = true;
	end


	if didSomething then
		kcdfw.logInfo(jester, "Done.");
	else
		kcdfw.logWarning(jester, "No operation was executed.");
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
		o = { value = "objective", description = "Start the given objective on the specified quest.", optional = true },
		q = { value = "quest", description = "Specify quest to act on." }
	}
);
