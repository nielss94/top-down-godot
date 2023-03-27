class_name Equipment extends Item

enum Type {
	Helmet,
	Armor,
	Leggings,
	Boots,
	Weapon,
	Shield
}

@export var type: Type	

@export_category("Stats")
@export var strength: int
@export var intellect: int
@export var dexterity: int
@export var luck: int

static func create_equipment(equipment: Equipment) -> Equipment:
	var new_eq = Equipment.new()
	new_eq.type = equipment.type
	new_eq.strength = equipment.strength
	new_eq.intellect = equipment.intellect
	new_eq.dexterity = equipment.dexterity
	new_eq.luck = equipment.luck

	new_eq.name = equipment.name
	new_eq.description = equipment.description
	new_eq.sprite = equipment.sprite
	new_eq.stackable = equipment.stackable

	new_eq.unique_id = UUID.v4()
	
	return new_eq
