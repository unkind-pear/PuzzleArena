if position_meeting(x, y, o_Player){
	var _player = instance_place(x, y, o_Player)
	if instance_exists(_player){
	if _player.interact == 1{
		o_Puzzle.result = string_delete(o_Puzzle.result, string_length(o_Puzzle.result), 1)
	}
	image_xscale = 1.1
	image_yscale = 1.1
	}
	
} else {

	image_xscale = 1
	image_yscale = 1

}