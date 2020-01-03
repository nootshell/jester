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




kcdfw.bootstrap("Scripts/Modules", "Quests");
