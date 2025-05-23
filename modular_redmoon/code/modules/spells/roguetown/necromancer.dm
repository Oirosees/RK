/obj/effect/proc_holder/spell/invoked/summon_undead_lesser
	name = "Summon Lesser Undead"
	desc = ""
	clothes_req = FALSE
	overlay_state = "animate"
	range = 7
	sound = list('sound/magic/magnet.ogg')
	releasedrain = 40
	chargetime = 60
	warnie = "spellwarning"
	no_early_release = TRUE
	charging_slowdown = 1
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	charge_max = 5 MINUTES
	var/cabal_affine = FALSE

/obj/effect/proc_holder/spell/invoked/summon_undead_lesser/cast(list/targets, mob/living/user)
	. = ..()
	var/turf/T = get_turf(targets[1])
	var/skeleton_roll = rand(1,100)
	if(isopenturf(T))
		switch(skeleton_roll)
			if(1 to 20)
				new /mob/living/simple_animal/hostile/rogue/skeleton/axe(T, user, cabal_affine)
			if(21 to 40)
				new /mob/living/simple_animal/hostile/rogue/skeleton/spear(T, user, cabal_affine)
			if(41 to 60)
				new /mob/living/simple_animal/hostile/rogue/skeleton/guard(T, user, cabal_affine)
			if(61 to 80)
				new /mob/living/simple_animal/hostile/rogue/skeleton/bow(T, user, cabal_affine)
			if(81 to 100)
				new /mob/living/simple_animal/hostile/rogue/skeleton(T, user, cabal_affine)
		return TRUE
	else
		to_chat(user, span_warning("The targeted location is blocked. My summon fails to come forth."))
		return FALSE
/obj/effect/proc_holder/spell/invoked/raise_undead_lesser
	action_icon = 'modular_redmoon/icons/redmoon_spells/redmoonspells.dmi'
	overlay_state = "necroraise"
/obj/effect/proc_holder/spell/invoked/eyebite
	action_icon = 'modular_redmoon/icons/redmoon_spells/redmoonspells.dmi'
	overlay_state = "blindness"
/obj/effect/proc_holder/spell/invoked/strengthen_undead
	action_icon = 'modular_redmoon/icons/redmoon_spells/redmoonspells.dmi'
	overlay_state = "necroheal"
/obj/effect/proc_holder/spell/invoked/projectile/sickness
	action_icon = 'modular_redmoon/icons/redmoon_spells/redmoonspells.dmi'
	overlay_state = "sickness"
/obj/effect/proc_holder/spell/invoked/revoke_unlife
	action_icon = 'modular_redmoon/icons/redmoon_spells/redmoonspells.dmi'
	overlay_state = "necrokill"
/obj/effect/proc_holder/spell/invoked/raise_undead
	action_icon = 'modular_redmoon/icons/redmoon_spells/redmoonspells.dmi'
	overlay_state = "necroraise"
/obj/effect/proc_holder/spell/invoked/eyebite
	charge_max = 25 SECONDS
/obj/effect/proc_holder/spell/invoked/eyebite/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/carbon/target = targets[1]
		target.visible_message(span_info("A loud crunching sound has come from [target]!"), span_userdanger("I feel arcane teeth biting into my eyes!"))
		target.adjustBruteLoss(30)
		target.blind_eyes(1)
		target.blur_eyes(10)
		return TRUE
	return FALSE
