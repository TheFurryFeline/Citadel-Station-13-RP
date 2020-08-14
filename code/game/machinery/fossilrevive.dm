

/obj/machinery/fossilrevive
	name = "fossil DNA extraction system"
	icon = 'icons/obj/cloning.dmi'
	icon_state = "pod_0"
	anchored = 1
	density = 1
	power_channel = EQUIP
	use_power = USE_POWER_IDLE
	idle_power_usage = 10
	active_power_usage = 100
	circuit = /obj/item/circuitboard/dnarevive
	reviving = FALSE

/obj/machinery/fossilrevive/attackby(obj/item/I, mob/user)
	if(reviving)
		to_chat(user, "The machine is processing!")
		return ..()
	if(!istype(I, /obj/item/fossil))
		to_chat(user, "That's not accepted by this machine.")
		return ..()
	var/obj/item/fossil/mosquito = I
	if(mosquito.processable == "seed")
		addtimer(CALLBACK(src, .proc/findsaway, "seed"), 1)
		reviving = TRUE
		qdel(mosquito)

/obj/machinery/fossilrevive/proc/findsaway(var/generatetype)
	var/droploc = get_turf(src)
	if(generatetype = "seed")
		flick("pod_g", src)
		new /obj/item/seeds/random(droploc)
		visible_message("The [src] shudders and spits out a seed!", "You hear a whirr.")
		reviving = FALSE
