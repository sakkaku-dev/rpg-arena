extends TileMap

func close_door() -> void:
	set_door(Vector2(1, 1))

func open_door() -> void:
	set_door(Vector2(4, 1))

func set_door(start_cell: Vector2) -> void:
	var row_1 = -1
	var row_2 = 0
	var col_1 = 25
	var col_2 = 26
	
	set_door_cell(col_1, row_1, start_cell)
	set_door_cell(col_1, row_2, start_cell + Vector2.DOWN)
	set_door_cell(col_2, row_1, start_cell + Vector2.RIGHT)
	set_door_cell(col_2, row_2, start_cell + Vector2.RIGHT + Vector2.DOWN)

func set_door_cell(x: int, y: int, autotile: Vector2) -> void:
	set_cell(x, y, 3, false, false, false, autotile)

