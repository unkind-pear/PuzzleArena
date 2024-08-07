if position_meeting(x, y, o_Player){
	var _player = instance_place(x, y, o_Player)
	if instance_exists(_player){
	if _player.interact == 1{
		o_Puzzle.Confirm = 1
		if o_Puzzle.result = "Incorreto!"{o_Puzzle.result = ""}
	}
	image_xscale = 1.1
	image_yscale = 1.1
	}
} else {

	image_xscale = 1
	image_yscale = 1

}