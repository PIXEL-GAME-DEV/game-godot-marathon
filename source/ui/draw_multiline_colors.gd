@tool
extends CanvasItem


@export var improved := true:
	set(value):
		improved = value
		queue_redraw()

@export_custom(PROPERTY_HINT_NONE, "suffix:px") var points: PackedVector2Array:
	set(value):
		points = value
		queue_redraw()

@export var colors: PackedColorArray:
	set(value):
		colors = value
		queue_redraw()

@export_custom(PROPERTY_HINT_NONE, "suffix:px") var width := 2.0:
	set(value):
		width = value
		queue_redraw()


@export_group("Anti_aliasing", "anti_aliasing")
@export_custom(PROPERTY_HINT_GROUP_ENABLE, "") var anti_aliasing := true:
	set(value):
		anti_aliasing = value
		queue_redraw()

@export_range(0.01, 10, 0.001, "suffix:px") var anti_aliasing_size := 1.0:
	set(value):
		anti_aliasing_size = value
		queue_redraw()


func _notification(what: int):
	match what:
		NOTIFICATION_ENTER_TREE:
			_connect()

		NOTIFICATION_EXIT_TREE:
			_disconnect()

		NOTIFICATION_PARENTED:
			_connect()

		NOTIFICATION_UNPARENTED:
			_disconnect()


func _ready() -> void:
	queue_redraw()


func _draw() -> void:
	if improved:
		_draw_multiline_colors_improved()
	else:
		draw_multiline_colors(points, colors, width, anti_aliasing)


func _connect():
	if is_inside_tree():
		var viewport := get_viewport()
		if viewport:
			viewport.size_changed.connect(queue_redraw)
	queue_redraw()


func _disconnect():
	var viewport := get_viewport()
	if viewport:
		viewport.size_changed.disconnect(queue_redraw)


func _draw_multiline_colors_improved():
	if anti_aliasing and anti_aliasing_size > 0:
		var aa := CanvasItemFuncs.get_aa(self, anti_aliasing_size*0.8)
		var w := clampf(width/aa - anti_aliasing_size*1.25, 0.0, INF)
		var p: PackedVector2Array = []
		for point in points:
			p.append(point/aa)
		draw_multiline_colors(p, colors, w, true)
	else:
		draw_multiline_colors(points, colors, width, false)
