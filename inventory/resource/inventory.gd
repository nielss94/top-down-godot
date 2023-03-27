class_name Inventory extends Resource

@export var slots: Array[Slot]

func remove(item: Item):
	for s in slots:
		if not s:
			continue
		
		if not s.item:
			continue
			
		if s.item == item:
			s.remove_item(item)
			return

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
				break
				
	if not slot:
		print("inventory is full")
		return
	
	slot.add_item(item)

func has_room_for(item: Item) -> bool:
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
				break
				
	if not slot:
		return false
	
	return true
