extends Resource
class_name Slot

const MAX_STACK_AMOUNT: int = 99

@export var item: Item
@export_range(1, MAX_STACK_AMOUNT) var quantity: int = 1: set = set_quantity

func set_quantity(value: int):
	quantity = value
	if quantity > 1 and not item.stackable:
		quantity = 1
		push_error("%s is not stackable, setting quantity to 1" % item.name)

func add_item(i: Item):
	if item && item.name == i.name:
		quantity += 1
	item = i

func remove_item(i: Item):
	item = null
	quantity = 0
