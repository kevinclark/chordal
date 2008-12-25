#/usr/bin/env io

Note := Object clone do(
	inSharps := nil
	inFlats := nil

	asString := method(inSharps)
	asChord := method( Chords getSlot(asString) )
	
	up := method(halfTones, Notes at(((Notes indexOf(self) + halfTones) + (Notes size)) % (Notes size)) )
	down := method(halfTones, up(-halfTones))

	flat := method( down(1) )
	sharp := method( up(1) )

	prime := 		method( self )
	minorSecond := 	method( up(1) )
	second := 		method( up(2) )
	minorThird := 	method( up(3) )
	third := 		method( up(4) )
	fourth := 		method( up(5) )
	tritone := 		method( up(6) )
	fifth := 		method( up(7) )
	minorSixth := 	method( up(8) )
	sixth := 		method( up(9) )
	minorSeventh := method( up(10) )
	seventh := 		method( up(11) )
	octave := 		method( up(12) )
)

Notes := List clone do(
	Naturals := List clone
	Sharps := List clone
	Flats := List clone

	// Define natural notes
	list("A", "B", "C", "D", "E", "F", "G") foreach(note,
		setSlot(note, Note clone)
		getSlot(note) updateSlot("inSharps", note)
		getSlot(note) updateSlot("inFlats", note)

		Naturals append(getSlot(note))
	)

	// Define sharps/flats
	list(list("A#", "Bb"), list("C#", "Db"), list("D#", "Eb"),
							list("F#", "Gb"), list("G#", "Ab")) foreach(note,
		// note is list(sharpName, flatName)
		setSlot(note first, Note clone)
		getSlot(note first) updateSlot("inSharps", note first)
		getSlot(note first) updateSlot("inFlats", note second)

		setSlot(note second, getSlot(note first))

		Sharps append(getSlot(note first))
		Flats append(getSlot(note second))
	)

	appendSeq(list("A", "A#", "B", "C", "C#", "D", 
				   "D#", "E", "F", "F#", "G", "G#") map(note, getSlot(note)))
)
