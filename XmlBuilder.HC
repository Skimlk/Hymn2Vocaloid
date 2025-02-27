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
