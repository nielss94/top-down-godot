class_name Player extends CharacterBody2D

@onready var inventory_component: InventoryComponent = $InventoryComponent
@onready var equipment_inventory_component: EquipmentInventoryComponent = $EquipmentInventoryComponent

@onready var interaction_area: Interaction = $InteractionArea

@onready var stats: Stats = $Stats

@export var speed = 300.0
@export var direction = Vector2.ZERO

@export var base_crit_multiplier: float = 1.75

func _ready():
	Events.pickup_item.connect(pickup_item)
	Events.player_inventory_init.emit(inventory_component.inventory)
	Events.player_equipment_inventory_init.emit(equipment_inventory_component.inventory)

func _process(delta):
	direction = Input.get_vector("left", "right", "up", "down")
	
	if Input.is_action_just_pressed("inventory"):
		Events.toggle_inventory.emit()
		
	if Input.is_action_just_pressed("interact"):
		interaction_area.interact()

func _physics_process(delta):
	velocity = direction * speed
	move_and_slide()
	
func pickup_item(item: Item):
	if inventory_component.has_room_for(item):
		inventory_component.add(item)
		Events.pickup_success.emit(item.unique_id)

func _on_inventory_component_inventory_changed():
	Events.player_inventory_changed.emit()

func _on_equipment_inventory_component_equipment_inventory_changed():
	Events.player_equipment_inventory_changed.emit()
	stats.set_stats(equipment_inventory_component.inventory.calculate_stats())


func _on_whip_hit_enemy(whip: Whip, enemy: Enemy):
	var power = stats.attack_power
	
	print(whip.attack_orientation)
	match whip.attack_orientation:
		StatOrientation.Type.Strength:
			print("sttrrr")
			power += stats.strength
		StatOrientation.Type.Dexterity:
			power += stats.dexterity
		StatOrientation.Type.Intellect:
			power += stats.intellect
		StatOrientation.Type.Luck:
			power += stats.luck

	print ("power without crit %s" % power)
	var crit_chance = 0
	match whip.crit_orientation:
		StatOrientation.Type.Strength:
			crit_chance = clamp(stats.strength, 0, 100)
		StatOrientation.Type.Dexterity:
			crit_chance = clamp(stats.dexterity, 0, 100)
		StatOrientation.Type.Intellect:
			crit_chance = clamp(stats.intellect, 0, 100)
		StatOrientation.Type.Luck:
			crit_chance = clamp(stats.luck, 0, 100)

	print ("crit chance %s" % crit_chance)
	var is_crit = randi_range(0, 100) < crit_chance
	if is_crit:
		match whip.crit_orientation:
			StatOrientation.Type.Strength:
				power *= base_crit_multiplier + stats.strength / 100
			StatOrientation.Type.Dexterity:
				power *= base_crit_multiplier + stats.dexterity / 100
			StatOrientation.Type.Intellect:
				power *= base_crit_multiplier + stats.intellect / 100
			StatOrientation.Type.Luck:
				power *= base_crit_multiplier + stats.luck / 100
		print("power with crit %s" % power)
	else:
		print("no crit")
	enemy.take_damage(power, is_crit)
