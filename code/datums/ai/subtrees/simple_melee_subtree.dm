/datum/ai_planning_subtree/basic_melee_attack_subtree
	var/datum/ai_behavior/basic_melee_attack/melee_attack_behavior = /datum/ai_behavior/basic_melee_attack
	var/end_planning = TRUE

/datum/ai_planning_subtree/basic_melee_attack_subtree/SelectBehaviors(datum/ai_controller/controller, delta_time)
	. = ..()
	var/atom/target = controller.blackboard[BB_BASIC_MOB_CURRENT_TARGET]
	if(QDELETED(target))
		return
	controller.queue_behavior(melee_attack_behavior, BB_BASIC_MOB_CURRENT_TARGET, BB_TARGETTING_DATUM, BB_BASIC_MOB_CURRENT_TARGET_HIDING_LOCATION)
	if (end_planning)
		return SUBTREE_RETURN_FINISH_PLANNING //we are going into battle...no distractions.
	

//If you give this to something without the element you are a dumbass.
/datum/ai_planning_subtree/basic_ranged_attack_subtree
	var/datum/ai_behavior/basic_ranged_attack/ranged_attack_behavior = /datum/ai_behavior/basic_ranged_attack

/datum/ai_planning_subtree/basic_ranged_attack_subtree/SelectBehaviors(datum/ai_controller/controller, delta_time)
	. = ..()
	var/atom/target = controller.blackboard[BB_BASIC_MOB_CURRENT_TARGET]
	if(QDELETED(target))
		return
	controller.queue_behavior(ranged_attack_behavior, BB_BASIC_MOB_CURRENT_TARGET, BB_TARGETTING_DATUM, BB_BASIC_MOB_CURRENT_TARGET_HIDING_LOCATION)
	return SUBTREE_RETURN_FINISH_PLANNING //we are going into battle...no distractions.

/datum/ai_planning_subtree/basic_melee_attack_subtree/mimic
	melee_attack_behavior = /datum/ai_behavior/basic_melee_attack/mimic

/datum/ai_planning_subtree/basic_melee_attack_subtree/spear //Spacing takes care of our movement
	melee_attack_behavior = /datum/ai_behavior/basic_melee_attack
