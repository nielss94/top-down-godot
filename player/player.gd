class_name Player extends CharacterBody2D

@onready var inventory_component: InventoryComponent = $InventoryComponent
@onready var equipment_inventory_component: EquipmentInventoryComponent = $EquipmentInventoryComponent

@onready var interaction_area: Interaction = $InteractionArea

@onready var stats: Stats = $Stats

@export var speed = 300.0
@export var direction = Vector2.ZERO

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
