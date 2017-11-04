extends Node

# Movement facing state
enum eFacing { TO_LEFT, TO_RIGHT}

enum eDirection { IDLE = 0,TO_LEFT = -1, TO_RIGHT=1, TO_UP = -1, TO_DOWN = 1 }

# Action state
#enum eActionState { FIRE, THROW, STAB, USE }

# Animation state
enum eAnimState { IDLE, WALK, JUMP, FALL, DIE, HURT, CLIMB, OBSTACLE, CRUNCH, CRUNCHWALK }

# screen transition mode
enum eTransitionMode { NONE,TO_BLACK,TO_TRANSPARENT}

# ---------------------------------------------------------------------------
# GAME data
# ---------------------------------------------------------------------------
var coins = 0;
var health = 0;
var items = {};

# ---------------------------------------------------------------------------
# GAME prefabs 
# ---------------------------------------------------------------------------

# teleport button info
var teleport_button_info = preload("res://Prefabs/Entities/TeleportButtonInfo/TeleportButtonInfo.tscn")
var msg_info_panel = preload("res://Prefabs/Entities/MessageInfo/MessageInfo.tscn")

# powerups
var powerup_jump = preload("res://Prefabs/PowerUps/PowerUpJump.tscn")
var powerup_speed = preload("res://Prefabs/PowerUps/PowerUpSpeed.tscn")
var powerup_gravity = preload("res://Prefabs/PowerUps/PowerUpGravity.tscn")

# bullet prefab for firing
onready var bullet_prefab = preload("res://Prefabs/Bullet/Bullet.tscn")
onready var granade_prefab = preload("res://Prefabs/Granade/Granade_0.tscn")

# Sound FX player
var player_sfx = null

# ---------------------------------------------------------------------------
# GAME Levels
# ---------------------------------------------------------------------------

