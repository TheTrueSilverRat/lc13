//Working on Si Heishou for now

/obj/item/clothing/suit/armor/ego_gear/city/heishou
	name = "\improper Test Heishou Gear"
	desc = "This shouldn't exist in game. Contact Devs if you found it there directly"
	icon = 'ModularLobotomy/_Lobotomyicons/heishou.dmi'
	worn_icon = 'ModularLobotomy/_Lobotomyicons/heishou_worn.dmi'
	armor = list(RED_DAMAGE = 40, WHITE_DAMAGE = 30, BLACK_DAMAGE = 40, PALE_DAMAGE = 30) // 140 points.
	//Assumption is that if Heishous were fully implemented, it would be the Heishou and then Heishou Adept. So it's similar to the Thumb East line up
	attribute_requirements = list(
		FORTITUDE_ATTRIBUTE = 80,
		PRUDENCE_ATTRIBUTE = 80,
		TEMPERANCE_ATTRIBUTE = 80,
		JUSTICE_ATTRIBUTE = 80
	)


/obj/item/clothing/suit/armor/ego_gear/city/heishou/serpent
	name = "\improper Si Heishou Coat"
	desc = "The Coat of the Si branch of H-Corp's Heishous. Master of Poison and Assasination. It also increases your movement speed by 40%"
	armor = list(RED_DAMAGE = 20, WHITE_DAMAGE = 20, BLACK_DAMAGE = 60, PALE_DAMAGE = 20) // 140 points.
	icon_state = "si_suit"
	slowdown = -0.4
	hat = /obj/item/clothing/head/ego_hat/heishou/serpent
	neck = /obj/item/clothing/neck/ego_neck/heishou/serpent
	var/og_eye_color //Needed for the Eye Color changes

/obj/item/clothing/neck/ego_neck/heishou/serpent
	name = "\improper Si Heishou Scarf"
	desc = "The Scarf of a Si Heishou, to cover up their identity."
	icon = 'ModularLobotomy/_Lobotomyicons/heishou.dmi'
	worn_icon = 'ModularLobotomy/_Lobotomyicons/heishou_worn.dmi'
	icon_state = "si_scarf"

/obj/item/clothing/head/ego_hat/heishou/serpent
	name = "\improper Si Heishou Hat"
	desc = "A bamboo hat to cover themselves from the shadows"
	icon = 'ModularLobotomy/_Lobotomyicons/heishou.dmi'
	worn_icon = 'ModularLobotomy/_Lobotomyicons/heishou_worn.dmi'
	icon_state = "si_hat"

/obj/item/clothing/suit/armor/ego_gear/city/heishou/serpent/equipped(mob/user, slot)
	. = ..()
	var/mob/living/carbon/human/si = user
	og_eye_color = si.eye_color //Saving Eye Color for changing it back later on
	to_chat(si "The Og eye color is [og_eye_color] taken from your og Eye-Color: [si.eye_color]")
	to_chat(si, span_hierophant("The Boluses are taking effect, your eyes are changing to be serpentine"))
	si.eye_color = "be2cfb"


/obj/item/clothing/suit/armor/ego_gear/city/heishou/serpent/dropped(mob/user)
	. = ..()
	var/mob/living/carbon/human/si = user
	to_chat(si, span_alert("The Boluses wither away as you take off your suit. Your eyes return to normal"))
	si.eye_color = og_eye_color
