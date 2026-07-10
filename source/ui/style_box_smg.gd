@tool
class_name StyleBoxSMG
extends StyleBox


func _draw(to_canvas_item: RID, rect: Rect2) -> void:
	var rect_top := rect
	rect_top.size.y = 4

	var rect_bottom := rect
	rect_bottom.position.y = rect.size.y - 4
	rect_bottom.size.y = 4

	var rect_1 := rect
	rect_1.position = Vector2(rect.size.x / 2 - 2, 5)
	rect_1.size = Vector2(4, rect.size.y - 10)

	var rect_2 := rect
	rect_2.position = Vector2(rect.size.x / 2 - 1, 10)
	rect_2.size = Vector2(2, rect.size.y - 20)

	var box_top := StyleBoxFlat.new()
	box_top.draw_center = false
	box_top.border_width_top = 2
	box_top.border_width_left = 2
	box_top.border_width_right = 2
	box_top.corner_radius_top_left = 1
	box_top.corner_radius_top_right = 1

	var box_bottom := StyleBoxFlat.new()
	box_bottom.draw_center = false
	box_bottom.border_width_left = 2
	box_bottom.border_width_right = 2
	box_bottom.border_width_bottom = 2
	box_bottom.corner_radius_bottom_left = 1
	box_bottom.corner_radius_bottom_right = 1

	var h_lines := StyleBoxFlat.new()
	h_lines.draw_center = false
	h_lines.border_width_top = 2
	h_lines.border_width_bottom = 2

	box_top.draw(to_canvas_item, rect_top)
	box_bottom.draw(to_canvas_item, rect_bottom)
	h_lines.draw(to_canvas_item, rect_1)
	h_lines.draw(to_canvas_item, rect_2)
