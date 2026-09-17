extends Area3D

func _on_body_entered(body: Node3D) -> void:
	if(body == $"../../../../Player"):
		self.monitoring = false
		$CollisionShape3D.disabled = true
		self.hide()
		$CollectCoin.play()
