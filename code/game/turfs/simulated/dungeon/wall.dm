// Special wall type for Point of Interests.

/turf/simulated/wall/dungeon
	block_tele = TRUE // Anti-cheese.

/turf/simulated/wall/dungeon/Initialize(mapload, materialtype, rmaterialtype, girder_material)
	return ..(mapload, "dungeonium")

/turf/simulated/wall/dungeon/attackby()
	return

/turf/simulated/wall/dungeon/ex_act()
	return

/turf/simulated/wall/dungeon/take_damage()	//These things are suppose to be unbreakable
	return

/turf/simulated/wall/solidrock //for more stylish anti-cheese.
	name = "solid rock"
	desc = "This rock seems dense, impossible to drill."
	description_info = "Probably not going to be able to drill or bomb your way through this, best to try and find a way around."
	icon_state = "bedrock"
	var/base_state = "bedrock"
	block_tele = TRUE

/turf/simulated/wall/solidrock/update_icon()
	for(var/direction in GLOB.cardinal)
		var/turf/T = get_step(src,direction)
		if(istype(T) && !T.density)
			var/place_dir = turn(direction, 180)
			if(!mining_overlay_cache["rock_side_[place_dir]"])
				mining_overlay_cache["rock_side_[place_dir]"] = image('icons/turf/walls.dmi', "rock_side", dir = place_dir)
			T.add_overlay(mining_overlay_cache["rock_side_[place_dir]"])

/turf/simulated/wall/solidrock/Initialize(mapload)
	. = ..()
	icon_state = base_state
	update_icon(1)		// TODO: /tg/ icon smoothing

/turf/simulated/wall/solidrock/attackby()
	return

/turf/simulated/wall/solidrock/ex_act()
	return

/turf/simulated/wall/solidrock/take_damage()	//These things are suppose to be unbreakable
	return
