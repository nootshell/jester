jester = {
	distribution = true,
	runLocal = true, -- [intermeta:false]

	package = {
		name = "&{META_NAME}",
		author = "&{META_AUTHOR}",
		date = "&{META_BUILD_DATE}",
		version = "&{META_VERSION}"
	}
};




if jester.runLocal then
	dofile('kcdfw/src/Startup/00-kcdfw.lua');
end

if not kcdfw then

end




local function buildPaths()
	local root = kcdfw.getScriptRoot();

	return {
		root = root,
		modules = ("%s/%s"):format(root, "Modules")
	};
end

jester.paths = buildPaths();




kcdfw.logBootstrap(jester, "Bootstrapping start");
kcdfw.bootstrap(jester, jester.paths.modules, "Quests", "Progress");
kcdfw.logBootstrap(jester, "Bootstrapping end");
