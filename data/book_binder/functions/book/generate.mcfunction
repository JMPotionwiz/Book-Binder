# Check if there is any data in the "pages" tag for storage "book_binder:pages"
# If not, imform the user and end the function early
execute unless data storage book_binder:pages pages run tellraw @s {"text":"No pages uploaded","color":"red"}
execute unless data storage book_binder:pages pages run return 0

# Creates a scoreboard objective to help keep track of the pages
# While the name is arbitrary, I wanted to decrease the likelyhood of using a objective that somebody else might have made.
# Thus, "book_binder.reallylongnamethatihopenobodyisusing" (really long name that i hope nobody is using)
scoreboard objectives add book_binder.reallylongnamethatihopenobodyisusing dummy ""

# Track how many pages we're supposed to put in this random book
$scoreboard players set book_binder.pages book_binder.reallylongnamethatihopenobodyisusing $(pages)

# Figure out how many pages we have to work with
execute store result score book_binder.maxPages book_binder.reallylongnamethatihopenobodyisusing run data get storage book_binder:pages pages

# Make sure we don't try to generate a book with more pages than what we have to work with
scoreboard players operation book_binder.pages book_binder.reallylongnamethatihopenobodyisusing < book_binder.maxPages book_binder.reallylongnamethatihopenobodyisusing

# Decrease the maximum pages value by 1, to prevent targeting pages that don't actaully exist
scoreboard players remove book_binder.maxPages book_binder.reallylongnamethatihopenobodyisusing 1

# Store the scoreboard value of "book_binder.reallylongnamethatihopenobodyisusing" for "book_binder.maxPages" in a way that can be used as input for a
# function
execute store result storage book_binder:page_number maxPages int 1 run scoreboard players get book_binder.maxPages book_binder.reallylongnamethatihopenobodyisusing

# Make a copy of the pages we have to work with, so that we don't affect the original
data modify storage book_binder:pages randomPages set from storage book_binder:pages pages

# Start the loop!
function book_binder:system/random_page_loop with storage book_binder:page_number

# Clean up after the loop
scoreboard objectives remove book_binder.reallylongnamethatihopenobodyisusing
data remove storage book_binder:pages randomPages
data remove storage book_binder:page_number pages
data remove storage book_binder:page_number maxPages

# In the off chance that no pages were generated, end the function early
execute unless data storage book_binder:pages generated run return 0

# Summon a written book in entity form. Make sure the item entity is tagged "book_binder.export" to prevent targeting the wrong entity
summon item ~ ~ ~ {Age:5998,PickupDelay:1,Tags:["book_binder.export"],Item:{id:"minecraft:written_book",Count:1b,tag:{title:"",author:""}}}

# Set the pages of the book to the generated pages
execute as @e[tag=book_binder.export] run data modify entity @s Item.tag.pages set from storage book_binder:pages generated

# Clean up generated pages, since we won't be needing it anymore
data remove storage book_binder:pages generated

# Remove the tag "book_binder.export" frome the item entity, thus preventing accidential modifications from other commands or functions
tag @e[tag=book_binder.export] remove book_binder.export


# In case anyone is wondering what the "Age" and "PickupDelay" tags are for:
# The "Age" tag is set to 5998, and will count up by 1 each game tick. When it reaches 6000, the item entity will dispawn. This is done to prevent clutter.
# The "PickupDelay" tag is set to 1, and will count down by 1 each tick. When it is 0 or less, the item can be picked up. This prevents the player from
# picking up the item before it's data can be modified.