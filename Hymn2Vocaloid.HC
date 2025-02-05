#ifdef Play
	I64 *PlayOriginal = %Play;
#endif
#ifndef music
	public class CMusicGlbls
	{
		U8    *cur_song;
		//CTask *cur_song_task;
		I64   octave;
		F64   note_len;
		U8    note_map[7];
		Bool  mute;
		I64   meter_top,meter_bottom;
		F64   tempo,stacatto_factor;

		//If you wish to sync with a
		//note in a Play() string.  0 is the start
		I64   play_note_num;

		F64   tM_correction,last_Beat,last_tM;
	};
	CMusicGlbls music;
#endif

U8 *Indent(U8 *Content) {
	U8 *Buffer = NULL;
	U8 *Cursor = NULL;
	for(I64 i = 0; Content[i] != '\0'; ++i) {
		SPutChar(&Cursor, Content[i], &Buffer);
		if(Content[i] == '\n') {
			SPutChar(&Cursor, '\t', &Buffer);
		}
	}
	return Buffer;
}

U8 *Tag(...) {
	U8 *Layer = NULL;
	for(I64 i = 1; i < argc; ++i) {
		Layer = StrMerge(
			Layer, "\n",
			argv[i]
		);
	}
	Layer = StrMerge(
		"<", argv[0], ">",
			Indent(Layer),
		"\n<\\", argv[0], ">"
	);
	return Layer;
}

U0 Hymn2Vocaloid(U8 *FilePath = ".") {
	U8 *Test = Tag("Parent",
		Tag("Child", Tag("Child2", "Inner"), "Test"),
		Tag("Child", "Inner")
	);
	"%s", Test;
}

Hymn2Vocaloid();

#ifdef PLAY
	Play = %PlayOriginal;
#endif
