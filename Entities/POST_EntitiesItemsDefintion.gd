extends Node

# ---------------------------------------------------------------------
# entity type as list - item is defined via item_id
# ---------------------------------------------------------------------

# ---------------------------------------------------------------------
# COIN
# ---------------------------------------------------------------------
var ent_coin = [
	load("res://Entities/Coin/Entity_Coin_0.tscn"),
	load("res://Entities/Coin/Entity_Coin_1.tscn"),
	load("res://Entities/Coin/Entity_Coin_2.tscn"),
	load("res://Entities/Coin/Entity_Coin_3.tscn")]

# ---------------------------------------------------------------------
# KEY
# ---------------------------------------------------------------------
var ent_key = [
	load("res://Entities/Key/Entity_Key_0.tscn"),
	load("res://Entities/Key/Entity_Key_1.tscn"),
	load("res://Entities/Key/Entity_Key_2.tscn"),
	load("res://Entities/Key/Entity_Key_3.tscn")]

# ---------------------------------------------------------------------
# AMMO
# ---------------------------------------------------------------------
var ent_ammo = [
	load("res://Entities/Ammo/Entity_Ammo_0.tscn"),
	load("res://Entities/Ammo/Entity_Ammo_1.tscn"),
	load("res://Entities/Ammo/Entity_Ammo_2.tscn"),
	load("res://Entities/Ammo/Entity_Ammo_3.tscn")]

# ---------------------------------------------------------------------
# GRANADE
# ---------------------------------------------------------------------
var ent_granade = [
	load("res://Entities/Granade/Entity_Granade_0.tscn")]

# ---------------------------------------------------------------------
# HEALTH
# ---------------------------------------------------------------------
var ent_health = [
	load("res://Entities/Health/Entity_Health_0.tscn"),
	load("res://Entities/Health/Entity_Health_1.tscn"),
	load("res://Entities/Health/Entity_Health_2.tscn"),
	load("res://Entities/Health/Entity_Health_3.tscn")]

# ---------------------------------------------------------------------
# POWERUP GRAVITY
# ---------------------------------------------------------------------

var ent_gravity = [load("res://Entities/PowerUp_Gravity/Entity_PowerUpGravity_0.tscn")]

# ---------------------------------------------------------------------
# POWERUP JUMP
# ---------------------------------------------------------------------

var ent_jump = [load("res://Entities/PowerUp_Jump/Entity_PowerUpJump_0.tscn")]

# ---------------------------------------------------------------------
# POWERUP SPEED
# ---------------------------------------------------------------------

var ent_speed = [load("res://Entities/PowerUp_Speed/Entity_PowerUpSpeed_0.tscn")]

# ---------------------------------------------------------------------
# INFOMSG
# ---------------------------------------------------------------------

var ent_infomsg = [load("res://Entities/InfoMsg/Entity_InfoMsg_0.tscn")]

# ---------------------------------------------------------------------
# START POINT
# ---------------------------------------------------------------------

var ent_startpoint = [load("res://Entities/StartPoint/Entity_StartPoint_0.tscn")]

# ---------------------------------------------------------------------
#  END POINT
# ---------------------------------------------------------------------

var ent_endpoint = [load("res://Entities/EndPoint/Entity_EndPoint_0.tscn")]

# ---------------------------------------------------------------------
# TELEPORT
# ---------------------------------------------------------------------

var ent_teleport = [
	load("res://Entities/Teleport/Entity_Teleport_0.tscn"),
	load("res://Entities/Teleport/Entity_Teleport_1.tscn"),
	load("res://Entities/Teleport/Entity_Teleport_2.tscn"),
	load("res://Entities/Teleport/Entity_Teleport_3.tscn")]

# ---------------------------------------------------------------------
# ENEMY with HORIZONTAL movement
# ---------------------------------------------------------------------

var ent_enemy_h = [
	load("res://Entities/Enemies/Enemy_H/Entity_Enemy_H_0.tscn"),
	load("res://Entities/Enemies/Enemy_H/Entity_Enemy_H_1.tscn")]

# ---------------------------------------------------------------------
# ENEMY with VERTICAL movement
# ---------------------------------------------------------------------

var ent_enemy_v = [
	load("res://Entities/Enemies/Enemy_V/Entity_Enemy_V_0.tscn")]

# ---------------------------------------------------------------------
# SWITCH
# ---------------------------------------------------------------------

var ent_switch = [
	load("res://Entities/Switch/Entity_Switch_0.tscn")]

# ---------------------------------------------------------------------
# LIGHT
# ---------------------------------------------------------------------

var ent_light = [
	load("res://Entities/Light/Entity_Light2D_0.tscn")]

# ---------------------------------------------------------------------
# PLATFORMS
# ---------------------------------------------------------------------

var ent_platform_h = [
	load("res://Entities/Platform/Platform_H/Entity_platform_H.tscn")]
	
var ent_platform_v = [
	load("res://Entities/Platform/Platform_V/Entity_platform_V.tscn")]

# ---------------------------------------------------------------------
# HAZARD
# ---------------------------------------------------------------------

var ent_hazard_l = [
	load("res://Entities/Enemies/Hazard_Left/Entity_hazard_Left.tscn")]
var ent_hazard_r = [
	load("res://Entities/Enemies/Hazard_Right/Entity_hazard_Right.tscn")]
var ent_hazard_u = [
	load("res://Entities/Enemies/Hazard_Up/Entity_hazard_Up.tscn")]
var ent_hazard_d = [
	load("res://Entities/Enemies/Hazard_Down/Entity_hazard_Down.tscn")]