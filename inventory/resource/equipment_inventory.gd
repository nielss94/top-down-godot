class_name EquipmentInventory extends Resource

@export var helmet: Equipment
@export var armor: Equipment
@export var leggings: Equipment
@export var boots: Equipment
@export var weapon: Equipment

func equip(equipment: Equipment):
	unequip(equipment.type)
	match equipment.type:
		Equipment.Type.Helmet:
			helmet = equipment
		Equipment.Type.Armor:
			armor = equipment
		Equipment.Type.Leggings:
			leggings = equipment
		Equipment.Type.Boots:
			boots = equipment
		Equipment.Type.Weapon:
			weapon = equipment	

func unequip(equipmentType: Equipment.Type):
	match equipmentType:
		Equipment.Type.Helmet:
			if helmet:
				Events.pickup_item.emit(helmet)
				helmet = null
		Equipment.Type.Armor:
			if armor:
				Events.pickup_item.emit(armor)
				armor = null
		Equipment.Type.Leggings:
			if leggings:
				Events.pickup_item.emit(leggings)
				leggings = null
		Equipment.Type.Boots:
			if boots:
				Events.pickup_item.emit(boots)
				boots = null
		Equipment.Type.Weapon:
			if weapon:
				Events.pickup_item.emit(weapon)
				weapon = null

func calculate_stats() -> Stats:
	var stats = Stats.new()
	
	if helmet:
		stats.add_dexterity(helmet.dexterity).add_intellect(helmet.intellect).add_strength(helmet.strength).add_luck(helmet.luck)
		
	if armor:
		stats.add_dexterity(armor.dexterity).add_intellect(armor.intellect).add_strength(armor.strength).add_luck(armor.luck)
		
	if leggings:
		stats.add_dexterity(leggings.dexterity).add_intellect(leggings.intellect).add_strength(leggings.strength).add_luck(leggings.luck)
		
	if boots:
		stats.add_dexterity(boots.dexterity).add_intellect(boots.intellect).add_strength(boots.strength).add_luck(boots.luck)
		
	if weapon:
		stats.add_dexterity(weapon.dexterity).add_intellect(weapon.intellect).add_strength(weapon.strength).add_luck(weapon.luck)
		
	
	return stats
