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
	dofile('../kcdfw/src/Startup/00-kcdfw.lua');
end




kcdfw.logBootstrap(jester, "Bootstrapping start");
kcdfw.bootstrap(jester, "Scripts/Modules", "Quests", "Progress");
kcdfw.logBootstrap(jester, "Bootstrapping end");
