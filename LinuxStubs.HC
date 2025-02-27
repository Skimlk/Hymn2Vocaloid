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
class CCmpCtrl { U8 *d; };

FS *Fs;
CCmpCtrl *cc;

CCmpCtrl *CmpCtrlNew(U8 *dummy) { CCmpCtrl d; return &d; }
Bool Lex(CCmpCtrl *cc) { return 0; }
U0 MusicSettingsRst() {}
U0 Snd() {}
