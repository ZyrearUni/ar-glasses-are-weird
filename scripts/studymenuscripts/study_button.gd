extends Button

@export var risk : bool
@export var explanation : String
@export var aspecto : String
var RESULT_FILE_DIR = OS.get_system_dir(OS.SYSTEM_DIR_DESKTOP) + "/resultados.txt"

# Guardar en resultados.txt (para posterior estudio)
func save_result():
	var file = FileAccess.open(RESULT_FILE_DIR, FileAccess.READ_WRITE)
	file.seek_end()
	file.store_string(aspecto + "\n")
	self.hide()
	self.disabled = true
