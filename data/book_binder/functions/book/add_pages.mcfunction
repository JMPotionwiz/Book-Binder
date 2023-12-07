# Check if the user's selected item has pages
# If not, imform the user and end the function early
execute unless data entity @s SelectedItem.tag.pages run tellraw @s {"text":"Please hold a written book in your hand","color":"red"}
execute unless data entity @s SelectedItem.tag.pages run return 0

# Check if the user's selected item has a first page
# If not, imform the user and end the function early. I don't expect anyone to actaully run into this, but better safe than sorry
execute unless data entity @s SelectedItem.tag.pages[0] run tellraw @s {"text":"This book has no pages!?","color":"red"}
execute unless data entity @s SelectedItem.tag.pages[0] run return 0

# Creates a scoreboard objective to help keep track of the pages
# While the name is arbitrary, I wanted to decrease the likelyhood of using a objective that somebody else might have made.
# Thus, "book_binder.reallylongnamethatihopenobodyisusing" (really long name that i hope nobody is using)
scoreboard objectives add book_binder.reallylongnamethatihopenobodyisusing dummy ""

# We'll start with page 0
scoreboard players set book_binder.pageNumber book_binder.reallylongnamethatihopenobodyisusing 0

# Store the scoreboard value of "book_binder.reallylongnamethatihopenobodyisusing" for "book_binder.pageNumber" in a way that can be used as input for a
# function
execute store result storage book_binder:page_number page int 1 run scoreboard players get book_binder.pageNumber book_binder.reallylongnamethatihopenobodyisusing

# Start the loop!
function book_binder:system/append_page_loop with storage book_binder:page_number

# Clean up after the loop
scoreboard objectives remove book_binder.reallylongnamethatihopenobodyisusing
data remove storage book_binder:page_number page