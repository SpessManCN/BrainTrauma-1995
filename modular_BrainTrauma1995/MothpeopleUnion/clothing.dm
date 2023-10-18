/obj/item/clothing/suit/ran
	name = "shikigami costume"
	desc = "A costume that looks like a certain shikigami, is super fluffy."
	icon = 'modular_BrainTrauma1995/MothpeopleUnion/clothingicon.dmi'
	worn_icon = 'modular_BrainTrauma1995/MothpeopleUnion/clothing.dmi'
	worn_icon_digi = 'modular_BrainTrauma1995/MothpeopleUnion/clothing.dmi'
	icon_state = "ran_suit"
	body_parts_covered = CHEST|GROIN|LEGS
	cold_protection = CHEST|GROIN|ARMS
	actions_types = list(/datum/action/item_action/adjust)
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	var/ass_adjusted = FALSE
	var/adjusted_flags = null

/obj/item/clothing/suit/ran/attack_self(mob/user)
	adjustass(user)

/obj/item/clothing/suit/ran/AltClick(mob/user)
	..()
	if(user.can_perform_action(src, NEED_DEXTERITY))
		adjustass(user)

/obj/item/clothing/suit/ran/examine(mob/user)
	. = ..()
	. += span_notice("Alt-click [src] to adjust it.")

/obj/item/clothing/head/ran
	name = "shikigami hat"
	desc = "A hat that looks like it keeps any fluffy ears contained super warm, has little charms over it."
	icon = 'modular_BrainTrauma1995/MothpeopleUnion/clothingicon.dmi'
	worn_icon = 'modular_BrainTrauma1995/MothpeopleUnion/clothing.dmi'
	worn_icon_muzzled = 'modular_BrainTrauma1995/MothpeopleUnion/clothing.dmi'
	icon_state = "ran_hat"
	flags_inv = HIDEEARS

/obj/item/clothing/suit/ran/proc/adjustass(mob/living/carbon/user)
	if(user?.incapacitated())
		return
	ass_adjusted = !ass_adjusted
	if(!ass_adjusted)
		icon_state = initial(icon_state)
		to_chat(user, span_notice("You push \the [src] back into place."))
		slot_flags = initial(slot_flags)
	else
		icon_state += "_up"
		to_chat(user, span_notice("You push \the [src] out of the way."))
		if(adjusted_flags)
			slot_flags = adjusted_flags
	if(!istype(user))
		return
	if(loc == user)
		// Update action button icon for adjusted mask, if someone is holding it.
		user.update_mob_action_buttons()

/datum/loadout_item/head/ran
	name = "御神帽"
	item_path = /obj/item/clothing/head/ran

/datum/loadout_item/suit/ran
	name = "御神装"
	item_path = /obj/item/clothing/suit/ran
