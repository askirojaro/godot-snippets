# Godot Snippets
## spriteToMouse

```gdscript
# Set sprite to mouse cursor
onready var logo = get_node("Logo")
	
func _process(delta):
	logo.set_global_position(get_viewport().get_mouse_position())
```
