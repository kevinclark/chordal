Chord := Object clone do(
	notes := method("(undefined)")
	root := nil
	
	setRoot := method(newRoot,
		root = Notes getSlot(newRoot asString)
		self
	)
)

MajorChord := Chord clone do(
	notes = method( list(root, root third, root fifth) )
)

MinorChord := Chord clone do(
	notes = method( list(root, root minorThird, root fifth) )
)

Dominant7thChord := MajorChord clone do(
	notes = method( super append(root sixth) )
)
