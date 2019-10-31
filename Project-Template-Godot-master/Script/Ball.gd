extends RigidBody2D

func _ready():
 contact_monitor = true
 set_max_contacts_reported(4)
 var BreakoutNode = get_node("/root/Breakout")
 connect("score", BreakoutNode, "increase_score")
 connect("lives", BreakoutNode, "decrease_lives")

func _physics_process(delta):
 var bodies = get_colliding_bodies()
 for body in bodies:
  if body.is_in_group("Tile"):
   var BreakoutNode = get_node("/root/Breakout")
   BreakoutNode.increase_score(body.score)
   body.queue_free()

 if position.y > get_viewport_rect().end.y:
  var BreakoutNode = get_node("/root/Breakout")
  BreakoutNode.decrease_lives()
  emit_signal("lives")
  queue_free()