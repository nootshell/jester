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





kcdfw.logBootstrap(jester.package.name, "Bootstrapping start");
kcdfw.bootstrap("Scripts/Modules", "Quests");
kcdfw.logBootstrap(jester.package.name, "Bootstrapping end");
