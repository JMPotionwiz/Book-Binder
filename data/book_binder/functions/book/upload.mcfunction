# Set the pages tag of storage "book_binder:pages" to the pages of the currently held item (if it has pages)
execute if data entity @s SelectedItem.tag.pages run data modify storage book_binder:pages pages set from entity @s SelectedItem.tag.pages

# If the currently held item doesn't have any pages, imform the executer
execute unless data entity @s SelectedItem.tag.pages run tellraw @s {"text":"Please hold a written book in your hand","color":"red"}