class_name Inventory extends Resource

@export var slots: Array[Slot]

func add(item: Item):
	var slot: Slot
	for s in slots:
		if slot:
			break

		if s.item == item && s.item.stackable:
			slot = s

	if not slot:
		for s in slots:
			if not s.item:
				slot = s
				
	if not slot:
		print("inventory is full")
		return
	
	slot.add_item(item)
