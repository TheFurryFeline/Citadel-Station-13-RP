/var/global/datum/topic_state/physical/physical_state = new()

/datum/topic_state/physical/can_use_topic(var/src_object, var/mob/user)
	. = user.shared_nano_interaction(src_object)
	if(. > UI_CLOSE)
		return min(., user.check_physical_distance(src_object))

/mob/proc/check_physical_distance(var/src_object)
	return UI_CLOSE

/mob/observer/dead/check_physical_distance(var/src_object)
	return default_can_use_topic(src_object)

/mob/living/check_physical_distance(var/src_object)
	return shared_living_nano_distance(src_object)

/mob/living/silicon/check_physical_distance(var/src_object)
	return max(UI_UPDATE, shared_living_nano_distance(src_object))
