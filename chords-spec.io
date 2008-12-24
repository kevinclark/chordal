describe(chord, Chord,
	chord("setRoot can take a String",
		verify(Chord clone setRoot("C") root == Notes C)
	)
	
	chord("setRoot can take a Note",
		verify(Chord clone setRoot(Notes C) root == Notes C)
	)
)

describe(majorChord, MajorChord,
	majorChord("notes gives the root, third and fifth",
		verify(MajorChord clone setRoot("C") notes map(inFlats) == list("C", "E", "G"))
	)
)

describe(minorChord, MinorChord,
	minorChord("notes gives the root, minor third, and fifth",
		verify(MinorChord clone setRoot("C") notes map(inFlats) == list("C", "Eb", "G"))
	)
)