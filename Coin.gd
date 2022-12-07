extends Area2D

signal collected_coin

func _ready():
	$AnimatedSprite.play()
	
	
func _on_Coin_body_entered(body):
	if "Player" in body.name:
		$CollisionShape2D.set_deferred("disabled", true)
		emit_signal("collected_coin")
		$coin_pickup.play()
		$AnimatedSprite.hide()
		yield(get_tree().create_timer(1), "timeout")
		queue_free()
