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
