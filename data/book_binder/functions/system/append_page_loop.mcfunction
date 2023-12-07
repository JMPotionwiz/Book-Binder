# This function is disigned to form a loop from itself, and is relient on data created by other functions. IT SHOULD ONLY BE CALLED BY OTHER FUNCTIONS!


# If the targeted page dosen't exist, end (or break) the loop
$execute unless data entity @s SelectedItem.tag.pages[$(page)] run return 0

# Add the targeted page to the "pages" tag for storage "book_binder:pages"
$data modify storage book_binder:pages pages append from entity @s SelectedItem.tag.pages[$(page)]

# Increment scoreboard value by 1, to target the next page
scoreboard players add book_binder.pageNumber book_binder.reallylongnamethatihopenobodyisusing 1

# Store the scoreboard value of "book_binder.reallylongnamethatihopenobodyisusing" for "book_binder.pageNumber" in a way that can be used as input for a
# function
execute store result storage book_binder:page_number page int 1 run scoreboard players get book_binder.pageNumber book_binder.reallylongnamethatihopenobodyisusing

# Start the next iteration of the loop. Once started, we will then figure out if there even is a next page
function book_binder:system/append_page_loop with storage book_binder:page_number