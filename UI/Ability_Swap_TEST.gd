extends Button

var abilities: Array[String]

func _ready() -> void:
	#####################################################################
	## Get global class list and filter it base class name "Ability" ####
	## so the ability class itself will not be added to the array. ######
	## This is done so any new children of Ability will be automatically#
	## added to this array. This is only done for  testing purposes #####
	## for future reference.
	#####################################################################
	for i in ProjectSettings.get_global_class_list():
		if i["base"] == "Ability":
			abilities.append(i["class"])

############################################################
## An item is randomly chosen from the array.
## The capitalize function is called in case some abilities have spaces (read docs)
## Custom classes can't be loaded properly so the load() function needs to be called
## To load the specific ability

func _on_pressed() -> void:
	var rand_ability_name: String = (abilities[randi() % abilities.size()]).capitalize()
	var rand_ability = load("res://Weapons/Projectiles/" + rand_ability_name + "/" + rand_ability_name + ".gd")
	
	GlobalSignal.change_ability.emit(rand_ability.new())
