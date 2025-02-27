#include "XmlBuilder.HC"

#ifdef IS_LINUX
#include "LinuxStubs.HC"
//#include "LoadedSong.HC"
#else
	U0 (*PlayOriginal)(U8 *st, U8 *words) = &Play;
#endif

U0 Play(U8 *st, U8 *words) {
	"Play";
}

U0 Hymn2Vocaloid(U8 *filename = NULL) {
	#ifndef IS_LINUX
	//Not sure why it likes the semicolon but doesn't like the while without it
	;CCmpCtrl *cc=CmpCtrlNew(MStrPrint("#include \"%s\"",filename));
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
