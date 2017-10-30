extends "res://Entities/POST_EntitiesItemsDefintion.gd"


# ---------------------------------------------------------------------
# Traverse the node tree and replace Tiled objects and Nodes
# ---------------------------------------------------------------------
func post_import(scene):

	# Load scenes to instantiate and add to the level

	for node in scene.get_children():
		# To know the type of a node, check if it is an instance of a base class
		# The addon imports tile layers as TileMap nodes and object layers as Node2D
		if node extends TileMap:
			# Process tile layers. E.g. read the ID of the individual tiles and
			# replace them with random variations, or instantiate scenes on top of them
			if node.has_meta("TYPE"):
				var type = node.get_meta("TYPE")

				if type == "SOLID":
					node.add_to_group("SOLID",true)

		if node extends Node2D:
			for object in node.get_children():

				# add default properties if missing
				object = CheckProperties(object)

				# dump entity data to console
				DumpProperties(object)

				# create scene node for entity
				BuildEntity(scene,node,object)

	# You must return the modified scene
	return scene

# ---------------------------------------------------------
# Prepare defaults
# ---------------------------------------------------------
func CheckProperties(obj):

	var type = obj.get_meta("type")

	if type == "COIN":
		Check(obj,"item_amount",1)
		Check(obj,"item_id",0)

	if type == "AMMO":
		Check(obj,"item_amount",10)
		Check(obj,"item_id",0)

	if type == "HEALTH":
		Check(obj,"item_amount",100)
		Check(obj,"item_limit",100)
		Check(obj,"item_id",0)

	if type == "KEY":
		Check(obj,"key_name","<undefined>")
		Check(obj,"item_id",0)

	if type == "POWER_UP_SPEED":
		Check(obj,"new_speed",300)
		Check(obj,"time_to_off",10)
		Check(obj,"item_id",0)

	if type == "POWER_UP_JUMP":
		Check(obj,"new_jump_force",300)
		Check(obj,"time_to_off",10)
		Check(obj,"item_id",0)

	if type == "POWER_UP_GRAVITY":
		Check(obj,"new_gravity_x",0)
		Check(obj,"new_gravity_y",1000)
		Check(obj,"time_to_off",10)
		Check(obj,"item_id",0)

	if type == "MSG_INFO":
		Check(obj,"info_text","<undefined>")
		Check(obj,"item_id",0)
		Check(obj,"panel_offset_x",0)
		Check(obj,"panel_offset_y",0)


	if type == "TELEPORT":
		Check(obj,"key_name","<undefined>")
		Check(obj,"need_key",false)
		Check(obj,"on_key","key_up")
		Check(obj,"target_name","<undefined>")
		Check(obj,"teleport_type",0)
		Check(obj,"item_id",0)

	if type == "START_POINT":
		Check(obj,"item_id",0)

	if type == "END_POINT":
		Check(obj,"item_id",0)
		Check(obj,"next_scene","<undefined>")

	if type == "ENEMY_H":
		Check(obj,"armor",25)
		Check(obj,"item_id",0)
		Check(obj,"damage",10)
		Check(obj,"speed",20)

	if type == "SWITCH":
		Check(obj,"item_id",0)
		Check(obj,"callback","<undefined>")
		Check(obj,"key_name","up_key")
		Check(obj,"set_state",true)
		Check(obj,"switch_mode","OnEnter")   # OnEnter / OnKey
		Check(obj,"target_name","<undefined>")

	if type == "LIGHT":		
		Check(obj,"item_id",0)
		Check(obj,"color","#ffffffff")
		
	return obj

# ---------------------------------------------------------
# Dump entity properties
# ---------------------------------------------------------
func DumpProperties(obj):

	var type = obj.get_meta("type")

	# COIN ------------------------------------------------

	if type == "COIN":
		print("---------------------------------------------------------")
		print("Entity: "+obj.get_name())
		print("---------------------------------------------------------")
		Dump(obj,"type")
		Dump(obj,"item_amount")
		Dump(obj,"item_id")

	# AMMO ------------------------------------------------

	if type == "AMMO":
		print("---------------------------------------------------------")
		print("Entity: "+obj.get_name())
		print("---------------------------------------------------------")
		Dump(obj,"type")
		Dump(obj,"item_amount")
		Dump(obj,"item_id")

	# HEALTH ----------------------------------------------

	if type == "HEALTH":
		print("---------------------------------------------------------")
		print("Entity: "+obj.get_name())
		print("---------------------------------------------------------")
		Dump(obj,"type")
		Dump(obj,"item_amount")
		Dump(obj,"item_limit")
		Dump(obj,"item_id")

	# START_POINT -----------------------------------------

	if type == "START_POINT":
		print("---------------------------------------------------------")
		print("Entity: "+obj.get_name())
		print("---------------------------------------------------------")
		Dump(obj,"type")
		Dump(obj,"item_id")

	# END_POINT -------------------------------------------

	if type == "END_POINT":
		print("---------------------------------------------------------")
		print("Entity: "+obj.get_name())
		print("---------------------------------------------------------")
		Dump(obj,"type")
		Dump(obj,"item_id")
		Dump(obj,"next_scene")

	# KEY -------------------------------------------------

	if type == "KEY":
		print("---------------------------------------------------------")
		print("Entity: "+obj.get_name())
		print("---------------------------------------------------------")
		Dump(obj,"type")
		Dump(obj,"key_name")
		Dump(obj,"item_id")

	# POWERUP_SPEED ---------------------------------------

	if type == "POWER_UP_SPEED":
		print("---------------------------------------------------------")
		print("Entity: "+obj.get_name())
		print("---------------------------------------------------------")
		Dump(obj,"type")
		Dump(obj,"item_id")
		Dump(obj,"time_to_off")
		Dump(obj,"new_speed")

	# POWERUP_JUMP ----------------------------------------

	if type == "POWER_UP_JUMP":
		print("---------------------------------------------------------")
		print("Entity: "+obj.get_name())
		print("---------------------------------------------------------")
		Dump(obj,"type")
		Dump(obj,"item_id")
		Dump(obj,"time_to_off")
		Dump(obj,"new_jump_force")

	# POWERUP_GRAVITY -------------------------------------

	if type == "POWER_UP_GRAVITY":
		print("---------------------------------------------------------")
		print("Entity: "+obj.get_name())
		print("---------------------------------------------------------")
		Dump(obj,"type")
		Dump(obj,"item_id")
		Dump(obj,"time_to_off")
		Dump(obj,"new_gravity_x")
		Dump(obj,"new_gravity_y")

	# MSG_INFO --------------------------------------------

	if type == "MSG_INFO":
		print("---------------------------------------------------------")
		print("Entity: "+obj.get_name())
		print("---------------------------------------------------------")
		Dump(obj,"type")
		Dump(obj,"item_id")
		Dump(obj,"info_text")
		Dump(obj,"panel_offset_x")
		Dump(obj,"panel_offset_y")


	# TELEPORT --------------------------------------------

	if type == "TELEPORT":
		print("---------------------------------------------------------")
		print("Entity: "+obj.get_name())
		print("---------------------------------------------------------")
		Dump(obj,"type")
		Dump(obj,"item_id")
		Dump(obj,"key_name")
		Dump(obj,"need_key")
		Dump(obj,"on_key")
		Dump(obj,"target_name")
		Dump(obj,"teleport_type")

	if type == "ENEMY_H":
		print("---------------------------------------------------------")
		print("Entity: "+obj.get_name())
		print("---------------------------------------------------------")
		Dump(obj,"type")
		Dump(obj,"armor")
		Dump(obj,"item_id")
		Dump(obj,"damage")
		Dump(obj,"speed")

	if type == "SWITCH":
		print("---------------------------------------------------------")
		print("Entity: "+obj.get_name())
		print("---------------------------------------------------------")
		Dump(obj,"item_id")
		Dump(obj,"callback")
		Dump(obj,"key_name")
		Dump(obj,"set_state")
		Dump(obj,"switch_mode")
		Dump(obj,"target_name")

	if type == "LIGHT":
		print("---------------------------------------------------------")
		print("Entity: "+obj.get_name())
		print("---------------------------------------------------------")
		Dump(obj,"item_id")
		Dump(obj,"color")

# -------------------------------------------------------
# Helpert for dump entity property to console
# -------------------------------------------------------
func Dump(obj,prop):
	if obj.has_meta(prop): print("    - "+prop+" = "+str(obj.get_meta(prop)))

# -------------------------------------------------------
# Helpert for check entity property and set default value
# -------------------------------------------------------
func Check(obj,prop,val):
	if !obj.has_meta(prop): obj.set_meta(prop,val)

# -------------------------------------------------------
# Build and replace objects in scene
# -------------------------------------------------------
func BuildEntity(scene,node,obj):
	var type = obj.get_meta("type")

	if type == "COIN": Entity_COIN(scene,node,obj)
	if type == "KEY": Entity_KEY(scene,node,obj)
	if type == "AMMO": Entity_AMMO(scene,node,obj)
	if type == "HEALTH": Entity_HEALTH(scene,node,obj)
	if type == "POWER_UP_GRAVITY": Entity_GRAVITY(scene,node,obj)
	if type == "POWER_UP_JUMP": Entity_JUMP(scene,node,obj)
	if type == "POWER_UP_SPEED": Entity_SPEED(scene,node,obj)
	if type == "MSG_INFO": Entity_MSGINFO(scene,node,obj)
	if type == "START_POINT": Entity_STARTPOINT(scene,node,obj)
	if type == "END_POINT": Entity_ENDPOINT(scene,node,obj)
	if type == "TELEPORT": Entity_TELEPORT(scene,node,obj)
	if type == "ENEMY_H": Entity_ENEMY_H(scene,node,obj)
	if type == "SWITCH": Entity_SWITCH(scene,node,obj)
	if type == "LIGHT": Entity_LIGHT(scene,node,obj)


# -------------------------------------------------------
# COIN
# -------------------------------------------------------
func Entity_COIN(scene,node,obj):

	var item_id = obj.get_meta("item_id")
	if (item_id>ent_coin.size()):
		print("ERROR: COIN item ID > "+str(ent_coin.size()))

	var item_amount = obj.get_meta("item_amount")
	var pos = obj.get_pos()
	var name = obj.get_name()

	var coin = ent_coin[item_id].instance()

	obj.free()

	coin.item_id = item_id
	coin.item_amount = item_amount

	coin.set_name(name)
	coin.set_pos(pos)

	node.add_child(coin)
	coin.set_owner(scene)

# -------------------------------------------------------
# KEY
# -------------------------------------------------------
func Entity_KEY(scene,node,obj):

	var item_id = obj.get_meta("item_id")
	if (item_id>ent_key.size()):
		print("ERROR: KEY item ID > "+str(ent_key.size()))

	var key_name = obj.get_meta("key_name")
	var pos = obj.get_pos()
	var name = obj.get_name()

	var key = ent_key[item_id].instance()

	obj.free()

	key.item_id = item_id
	key.key_name = key_name

	key.set_name(name)
	key.set_pos(pos)

	node.add_child(key)
	key.set_owner(scene)

# -------------------------------------------------------
# AMMO
# -------------------------------------------------------
func Entity_AMMO(scene,node,obj):

	var item_id = obj.get_meta("item_id")
	if (item_id>ent_ammo.size()):
		print("ERROR: AMMO item ID > "+str(ent_ammo.size()))

	var item_amount = obj.get_meta("item_amount")
	var pos = obj.get_pos()
	var name = obj.get_name()

	var ent = ent_ammo[item_id].instance()

	obj.free()

	ent.item_id = item_id
	ent.item_amount = item_amount

	ent.set_name(name)
	ent.set_pos(pos)

	node.add_child(ent)
	ent.set_owner(scene)

# -------------------------------------------------------
# HEALTH
# -------------------------------------------------------
func Entity_HEALTH(scene,node,obj):

	var item_id = obj.get_meta("item_id")
	if (item_id>ent_health.size()):
		print("ERROR: HEALTH item ID > "+str(ent_health.size()))

	var item_amount = obj.get_meta("item_amount")
	var item_limit = obj.get_meta("item_limit")
	var pos = obj.get_pos()
	var name = obj.get_name()

	var health = ent_health[item_id].instance()

	obj.free()

	health.item_id = item_id
	health.item_amount = item_amount
	health.item_limit = item_limit

	health.set_name(name)
	health.set_pos(pos)

	node.add_child(health)
	health.set_owner(scene)

# -------------------------------------------------------
# POWERUP: GRAVITY
# -------------------------------------------------------
func Entity_GRAVITY(scene,node,obj):

	var item_id = obj.get_meta("item_id")
	if (item_id>ent_gravity.size()):
		print("ERROR: GRAVITY item ID > "+str(ent_gravity.size()))


	var time_to_off = obj.get_meta("time_to_off")
	var new_gravity_x = obj.get_meta("new_gravity_x")
	var new_gravity_y = obj.get_meta("new_gravity_y")

	var pos = obj.get_pos()
	var name = obj.get_name()

	var gravity = ent_gravity[item_id].instance()

	obj.free()

	gravity.item_id = item_id
	gravity.time_to_off = time_to_off
	gravity.new_gravity = Vector2(new_gravity_x,new_gravity_y)

	gravity.set_name(name)
	gravity.set_pos(pos)

	node.add_child(gravity)
	gravity.set_owner(scene)

# -------------------------------------------------------
# POWERUP: JUMP
# -------------------------------------------------------
func Entity_JUMP(scene,node,obj):

	var item_id = obj.get_meta("item_id")
	if (item_id>ent_jump.size()):
		print("ERROR: GRAVITY item ID > "+str(ent_jump.size()))

	var time_to_off = obj.get_meta("time_to_off")
	var new_jump_force = obj.get_meta("new_jump_force")

	var pos = obj.get_pos()
	var name = obj.get_name()

	var jump = ent_jump[item_id].instance()

	obj.free()

	jump.item_id = item_id
	jump.time_to_off = time_to_off
	jump.new_jump_force = new_jump_force

	jump.set_name(name)
	jump.set_pos(pos)

	node.add_child(jump)
	jump.set_owner(scene)

# -------------------------------------------------------
# POWERUP: SPEED
# -------------------------------------------------------
func Entity_SPEED(scene,node,obj):

	var item_id = obj.get_meta("item_id")
	if (item_id>ent_speed.size()):
		print("ERROR: SPEED item ID > "+str(ent_speed.size()))

	var time_to_off = obj.get_meta("time_to_off")
	var new_speed = obj.get_meta("new_speed")

	var pos = obj.get_pos()
	var name = obj.get_name()

	var speed = ent_speed[item_id].instance()

	obj.free()

	speed.item_id = item_id
	speed.time_to_off = time_to_off
	speed.new_speed = new_speed

	speed.set_name(name)
	speed.set_pos(pos)

	node.add_child(speed)
	speed.set_owner(scene)

# -------------------------------------------------------
# INFO MSG TEXT
# -------------------------------------------------------
func Entity_MSGINFO(scene,node,obj):

	var item_id = obj.get_meta("item_id")
	if (item_id>ent_infomsg.size()):
		print("ERROR: INFO MSG item ID > "+str(ent_infomsg.size()))

	# read meta data
	var info_text = obj.get_meta("info_text")
	var panel_offset_x = obj.get_meta("panel_offset_x")
	var panel_offset_y = obj.get_meta("panel_offset_y")

	var pos = obj.get_pos()
	var name = obj.get_name()

	# create entity instance
	var msg = ent_infomsg[item_id].instance()

	# free previous object
	obj.free()

	# set properties
	msg.info_text = info_text
	msg.panel_offset = Vector2(panel_offset_x,panel_offset_y)


	# set name and position
	msg.set_name(name)
	msg.set_pos(pos)

	# add to scene under parent
	node.add_child(msg)
	msg.set_owner(scene)

# -------------------------------------------------------
# START POINT
# -------------------------------------------------------
func Entity_STARTPOINT(scene,node,obj):
	var item_id = obj.get_meta("item_id")
	if (item_id>ent_startpoint.size()):
		print("ERROR: START POINT item ID > "+str(ent_startpoint.size()))

	# read meta data
	#
	var pos = obj.get_pos()
	var name = obj.get_name()

	# create entity instance
	var starpoint = ent_startpoint[item_id].instance()

	# free previous object
	obj.free()

	# set properties


	# set name and position
	starpoint.set_name(name)
	starpoint.set_pos(pos)

	# add to scene under parent
	node.add_child(starpoint)
	starpoint.set_owner(scene)

# -------------------------------------------------------
# END POINT
# -------------------------------------------------------
func Entity_ENDPOINT(scene,node,obj):
	var item_id = obj.get_meta("item_id")
	if (item_id>ent_endpoint.size()):
		print("ERROR: END POINT item ID > "+str(ent_endpoint.size()))

	# read meta data
	#
	var pos = obj.get_pos()
	var name = obj.get_name()

	# create entity instance
	var endpoint = ent_endpoint[item_id].instance()

	# free previous object
	obj.free()

	# set properties


	# set name and position
	endpoint.set_name(name)
	endpoint.set_pos(pos)

	# add to scene under parent
	node.add_child(endpoint)
	endpoint.set_owner(scene)

# -------------------------------------------------------
# TELEPORT
# -------------------------------------------------------

func Entity_TELEPORT(scene,node,obj):
	var item_id = obj.get_meta("item_id")
	if (item_id>ent_teleport.size()):
		print("ERROR: TELEPORT item ID > "+str(ent_teleport.size()))

	# read meta data

	var key_name = obj.get_meta("key_name")
	var need_key = obj.get_meta("need_key")
	var on_key = obj.get_meta("on_key")
	var target_name = obj.get_meta("target_name")
	var teleport_type = obj.get_meta("teleport_type")

	var pos = obj.get_pos()
	var name = obj.get_name()

	# create entity instance
	var teleport = ent_teleport[item_id].instance()

	# free previous object
	obj.free()

	# set properties

	teleport.key_name = key_name
	teleport.need_key = need_key
	teleport.on_key = on_key
	teleport.target_name = target_name
	teleport.teleport_type = teleport_type

	# set name and position
	teleport.set_name(name)
	teleport.set_pos(pos)

	# add to scene under parent
	node.add_child(teleport)
	teleport.set_owner(scene)


# -------------------------------------------------------
# ENEMY with HORIZONTAL MOVE
# -------------------------------------------------------

func Entity_ENEMY_H(scene,node,obj):
	var item_id = obj.get_meta("item_id")
	if (item_id>ent_enemy_h.size()):
		print("ERROR: ENEMY item ID > "+str(ent_enemy_h.size()))

	# read meta data

	var speed = obj.get_meta("speed")
	var armor = obj.get_meta("armor")
	var damage = obj.get_meta("damage")

	var pos = obj.get_pos()
	var name = obj.get_name()

	# create entity instance
	var enemy = ent_enemy_h[item_id].instance()

	# free previous object
	obj.free()

	# set properties

	enemy.speed = speed
	enemy.armor = armor
	enemy.damage = damage

	# set name and position
	enemy.set_name(name)
	enemy.set_pos(pos)

	# add to scene under parent
	node.add_child(enemy)
	enemy.set_owner(scene)

# -------------------------------------------------------
# SWITCH: call defiend method on node with defined state OnEnter o OnKeyPressed
# -------------------------------------------------------

func Entity_SWITCH(scene,node,obj):

	var item_id = obj.get_meta("item_id")

	if item_id>ent_switch.size():
		print("ERROR: SWITCH item ID > "+str(ent_switch.size()))

	# read meta data

	var callback = obj.get_meta("callback")
	var key_name = obj.get_meta("key_name")
	var set_state = obj.get_meta("set_state")
	var switch_mode = obj.get_meta("switch_mode")
	var target_name = obj.get_meta("target_name")

	var pos = obj.get_pos()
	var name = obj.get_name()

	# create entity instance
	var sw = ent_switch[item_id].instance()

	# free previous object
	obj.free()

	# set properties

	sw.callback = callback
	sw.key_name = key_name
	sw.set_state = set_state
	sw.switch_mode = switch_mode
	sw.target_name = target_name

	# set name and position
	sw.set_name(name)
	sw.set_pos(pos)

	# add to scene under parent
	node.add_child(sw)
	sw.set_owner(scene)
	
# -------------------------------------------------------
# INFO MSG TEXT
# -------------------------------------------------------
func Entity_LIGHT(scene,node,obj):

	var item_id = obj.get_meta("item_id")
	if (item_id>ent_light.size()):
		print("ERROR: INFO MSG item ID > "+str(ent_light.size()))

	# read meta data
	var color = obj.get_meta("color")
	print(str(color))
	var pos = obj.get_pos()
	var name = obj.get_name()

	# create entity instance
	var light = ent_light[item_id].instance()

	# free previous object
	obj.free()

	# set properties
	light.set_color(color)
	

	# set name and position
	light.set_name(name)
	light.set_pos(pos)

	# add to scene under parent
	node.add_child(light)
	light.set_owner(scene)	
	