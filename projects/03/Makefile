BIN = letter_grades

$(BIN): $(BIN).adb
	gcc -c letter_grades.adb
	gnatbind -x letter_grades.ali
	gnatlink letter_grades.ali
