describe(notes, Notes,
	notes("should contain all the notes",
		list("Ab", "A", "A#", "Bb", "B", "C", "C#", "Db", "D",
			 "D#", "Eb", "E", "F", "F#", "Gb", "G", "G#") foreach(note,
			verify(
				Notes detect(n, (n inSharps == note) or (n inFlats == note))
			)
		)
	)
	
	describe(sharps, Notes Sharps,
		sharps("should contain all the sharps",
			list("A#", "C#", "D#", "F#", "G#") foreach(note,
				verify(Notes Sharps detect(inSharps == note))
			)
		)
	)
	
	describe(flats, Notes Flats,
		flats("should contain all the flats",
			list("Ab", "Bb", "Db", "Eb", "Gb") foreach(note,
				verify(Notes Flats detect(inFlats == note))
			)
		)
	)
)

describe(note, Note,
	note("has a prime",			verify(Notes C prime == Notes C))
	note("has a minorSecond", 	verify(Notes C minorSecond == Notes Db))
	note("has a second", 		verify(Notes C second == Notes D))
	note("has a minorThird", 	verify(Notes C minorThird == Notes Eb))
	note("has a third", 		verify(Notes C third == Notes E))
	note("has a fourth",		verify(Notes C fourth == Notes F))
	note("has a tritone",		verify(Notes C tritone == Notes Gb))
	note("has a fifth",			verify(Notes C fifth == Notes G))
	note("has a minorSixth",	verify(Notes C minorSixth == Notes Ab))
	note("has a sixth",			verify(Notes C sixth == Notes A))
	note("has a minorSeventh",	verify(Notes C minorSeventh == Notes Bb))
	note("has a seventh",		verify(Notes C seventh == Notes B))
	note("has an octave",		verify(Notes C octave == Notes C))
)