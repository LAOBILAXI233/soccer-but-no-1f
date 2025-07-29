class_name PlayerStateMoving
extends PlayerState

func _process(_delta: float) -> void:
	if player.control_scheme == Player.ControlScheme.CPU:
		pass#人机交互逻辑 暂时先放着放着
	else:
		handle_human_movement()
	player.set_movement_animation()
	player.set_heading()


func handle_human_movement()->void:
	var direction :=Keyutils.get_input_vector(player.control_scheme)
	player.velocity = direction * player.speed

	if player.velocity != Vector2.ZERO and Keyutils.is_action_just_pressed(player.control_scheme,Keyutils.Action.SHOOT):
		state_transition_requested.emit(Player.State.TACKLING)
		
	
