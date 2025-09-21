ADMIN_VERB_ONLY_CONTEXT_MENU(swap_dolls, R_DEBUG, "Swap", mob/doll in world)
	var/mob/admin_mob = user.mob
	var/mob/player_ghost
	if(doll.mind)
		player_ghost = doll.change_mob_type( /mob/dead/observer , null, null, FALSE)
	var/mob/admin_ghost = admin_mob.ghostize(TRUE, TRUE)

	doll.PossessByPlayer(admin_ghost.ckey)
	doll.client?.init_verbs()

	if(player_ghost)
		admin_mob.PossessByPlayer(player_ghost.ckey)
		admin_mob.client?.init_verbs()

	to_chat(doll, span_admin("Трансформация произошла!"))

ADMIN_VERB(admin_position, R_ADMIN|R_FUN, "Position", ADMIN_VERB_NO_DESCRIPTION, ADMIN_CATEGORY_ERP)

