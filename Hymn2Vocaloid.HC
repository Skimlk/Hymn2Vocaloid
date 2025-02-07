#ifdef IS_LINUX
class CMusicGlbls
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
}; CMusicGlbls music;

I64 SndTaskEndCB = NULL;
class FS { I64 *task_end_cb; };
FS *Fs;

U0 Snd() {}
U0 MusicSettingsRst() {}

#include "LoadedSong.HC"
#else
	U0 (*PlayOriginal)(U8 *st, U8 *words) = &Play;
#endif

U0 Play(U8 *st, U8 *words) {
	"Play";
}

U8 *Indent(U8 *Content, U8 *Buffer) {
	U8 *Cursor = Buffer;
	for(I64 i = 0; Content[i] != '\0'; ++i) {
		SPutChar(&Cursor, Content[i], &Buffer);
		if(Content[i] == '\n') {
			SPutChar(&Cursor, '\t', &Buffer);
		}
	}

	return Buffer;
}

U8 *Elem(...) {
	U8 *Layer = NULL;
	U8 *OldLayer;

	for(I64 i = 1; i < argc; ++i) {
		OldLayer = Layer;
		Layer = StrMerge(
			Layer, "\n",
			argv[i]
		);
		Free(OldLayer);
	}
	
	OldLayer = Layer;
	U8 *IndentedLayerBuffer = MAlloc(sizeof(U8) * (StrLen(Layer) + StrOcc(Layer, '\n')));
	
	Layer = StrMerge(
		"<", argv[0], ">",
			Indent(Layer, IndentedLayerBuffer),
		"\n<\\", argv[0], ">"
	);

	Free(IndentedLayerBuffer);
	Free(OldLayer);
	
	return Layer;
}

U0 Hymn2Vocaloid(U8 *filename = NULL) {
	#ifndef IS_LINUX
	CCmpCtrl *cc=CmpCtrlNew(MStrPrint("#include \"%s\"",filename));
	while(Lex(cc)) {
	#endif
		U8 *Test = Elem("Parent",
			Elem("Child", Elem("Child2", "Inner"), "Test"),
			Elem("Child", "Inner")
		);
		"%s", Test;
	#ifndef IS_LINUX
	}
	CmpCtrlDel(cc);
	#endif
}

Hymn2Vocaloid;

#ifndef IS_LINUX
	U0 (*Play)(U8 *st, U8 *words) = &PlayOriginal;
#endif
