Key := Object clone do( root ::= nil )

MajorKey := Key clone do(
	asString := method( "Key of " .. root )
	I := 	method( root asChord )
	ii := 	method( root second asChord min )
	iii := 	method( root third asChord min )
	IV := 	method( root fourth asChord )
	V := 	method( root fifth asChord )
	iv := 	method( root sixth asChord min )
	VII := 	method( root seventh asChord )
)

Keys := Object clone do(
	Notes foreach(note, setSlot(note inSharps, MajorKey clone setRoot(note)))
)