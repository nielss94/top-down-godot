class_name Player extends CharacterBody2D

signal toggle_inventory
signal attack

@onready var inventory_component: InventoryComponent = $InventoryComponent
@onready var equipment_inventory_component = $EquipmentInventoryComponent

@onready var interaction_area: Interaction = $InteractionArea
@onready var stats = $Stats

@export var speed = 300.0
@export var direction = Vector2.ZERO

func _ready():
	Events.pickup_item.connect(pickup_item)
	Events.unequip_item.connect(unequip_item)

func _process(delta):
	direction = Input.get_vector("left", "right", "up", "down")
	
	if Input.is_action_just_pressed("inventory"):
		toggle_inventory.emit()
		
	if Input.is_action_just_pressed("interact"):
		interaction_area.interact()

func _physics_process(delta):
	velocity = direction * speed
	move_and_slide()
	
func pickup_item(item: Item):
	inventory_component.add(item)
	
func unequip_item(item: Item):
	equipment_inventory_component.remove(item)
