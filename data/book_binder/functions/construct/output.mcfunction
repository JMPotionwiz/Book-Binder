# Sorry, I ran out of motivation to add comments for this one.
# This function doesn't do anything extremely different from what some of the other functions do, so I'd suggest
# that you try reading the comments on the other functions to get a rough idea of what this one's doing.

# In particular, try checking the function "book/output"

execute unless data storage book_binder:pages construct run tellraw @s {"text":"No pages found","color":"red"}
execute unless data storage book_binder:pages construct run return 0
summon item ~ ~ ~ {Age:5998,PickupDelay:1,Tags:["book_binder.export"],Item:{id:"minecraft:written_book",Count:1b,tag:{title:"",author:""}}}
execute as @e[tag=book_binder.export] run data modify entity @s Item.tag.pages set from storage book_binder:pages construct
tag @e[tag=book_binder.export] remove book_binder.export