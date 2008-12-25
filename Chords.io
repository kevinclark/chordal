Chord := Object clone do(
	notes := method("(undefined)")
	root := nil
	
	setRoot := method(newRoot,
		root = Notes getSlot(newRoot asString)
		self
	)
	
	maj := method( MajorChord clone setRoot(root) )
	min := method( MinorChord clone setRoot(root) )
	dom := method( Dominant7thChord clone setRoot(root) )
)

MajorChord := Chord clone do(
	notes = method( list(root, root third, root fifth) )
)

MajorChords := List clone do(
	Notes foreach(note,
		append(
			setSlot(note inFlats, MajorChord clone setRoot(note))
		)
	)
)

MinorChord := Chord clone do(
	notes = method( list(root, root minorThird, root fifth) )
)

Dominant7thChord := MajorChord clone do(
	notes = method( super(notes) append(root seventh flat) )
)

Chords := List clone do ( 
	MajorChords foreach(chord, 
		setSlot(chord root inFlats, chord)
		setSlot(chord root inSharps, chord)
		append(chord)
	)
)