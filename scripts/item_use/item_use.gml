function item_use(item_, player) {
	//var item_ = argument0; //interger for item enum
	//var player = argument1; //object refrence

	if item_ == item.none
	{
		return;
	}

	if item_ == item.sword
	{
		player.state = "swing_sword";
		return;
	}

	if item_ == item.glove
	{
		player.state = "pickup";
		return;
	}




}
