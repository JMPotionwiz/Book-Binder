# Check if there is any data in the "pages" tag for storage "book_binder:pages"
# If not, imform the user and end the function early
execute unless data storage book_binder:pages pages run tellraw @s {"text":"No pages uploaded","color":"red"}
execute unless data storage book_binder:pages pages run return 0

# Summon a written book in entity form. Make sure the item entity is tagged "book_binder.export" to prevent targeting the wrong entity
summon item ~ ~ ~ {Age:5998,PickupDelay:1,Tags:["book_binder.export"],Item:{id:"minecraft:written_book",Count:1b,tag:{title:"",author:""}}}

# Set the pages of the book to the stored pages
execute as @e[tag=book_binder.export] run data modify entity @s Item.tag.pages set from storage book_binder:pages pages

# Remove the tag "book_binder.export" frome the item entity, thus preventing accidential modifications from other commands or functions
tag @e[tag=book_binder.export] remove book_binder.export


# In case anyone is wondering what the "Age" and "PickupDelay" tags are for:
# The "Age" tag is set to 5998, and will count up by 1 each game tick. When it reaches 6000, the item entity will dispawn. This is done to prevent clutter.
# The "PickupDelay" tag is set to 1, and will count down by 1 each tick. When it is 0 or less, the item can be picked up. This prevents the player from
# picking up the item before it's data can be modified.