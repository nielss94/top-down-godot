extends Node
class_name Stats

@export var attack_power: int = 10

@export var strength: int = 0
@export var intellect: int = 0
@export var dexterity: int = 0
@export var luck: int = 0

func set_stats(stats: Stats) -> void:
	strength = stats.strength
	intellect = stats.intellect
	dexterity = stats.dexterity
	luck = stats.luck
	attack_power = stats.attack_power

func with_strength(amount: int) -> Stats:
	strength = amount
	return self

func add_strength(amount: int) -> Stats:
	strength += amount
	return self

func with_intellect(amount: int) -> Stats:
	intellect = amount
	return self

func add_intellect(amount: int) -> Stats:
	intellect += amount
	return self

func with_dexterity(amount: int) -> Stats:
	dexterity = amount
	return self

func add_dexterity(amount: int) -> Stats:
	dexterity += amount
	return self

func with_luck(amount: int) -> Stats:
	luck = amount
	return self

func add_luck(amount: int) -> Stats:
	luck += amount
	return self
