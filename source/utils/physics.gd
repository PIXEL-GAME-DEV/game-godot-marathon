class_name UtilsPhysics
extends Object


static func get_floor_contact(state: PhysicsDirectBodyState3D) -> int:
	for contact in state.get_contact_count():
		var contact_normal := state.get_contact_local_normal(contact)
		if contact_normal.dot(state.total_gravity.normalized()) < -0.5:
			return contact
	return -1


static func is_on_floor(_state: PhysicsDirectBodyState3D) -> bool:
	#return get_floor_contact(state) > -1
	return true


static func get_ceiling_contact(state: PhysicsDirectBodyState3D) -> int:
	for contact in state.get_contact_count():
		var contact_normal := state.get_contact_local_normal(contact)
		if contact_normal.dot(state.total_gravity.normalized()) > 0.5:
			return contact
	return -1


static func is_on_ceiling(state: PhysicsDirectBodyState3D) -> bool:
	return get_ceiling_contact(state) > -1
