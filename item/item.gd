extends Resource
class_name Item

enum EquipmentType {
	Helmet,
	Armor,
	Leggings,
	Boots,
	Weapon,
	Shield
}

@export var name: String
@export var description: String
@export var type: EquipmentType

@export_category("Stats")
@export var strength: int
@export var intellect: int
@export var dexterity: int
@export var luck: int
