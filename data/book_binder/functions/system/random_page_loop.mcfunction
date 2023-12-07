# This function is disigned to form a loop from itself, and is relient on data created by other functions. IT SHOULD ONLY BE CALLED BY OTHER FUNCTIONS!


# If there is only one page left, add it to the generated pages and end, or break, the loop
execute if score book_binder.maxPages book_binder.reallylongnamethatihopenobodyisusing matches ..0 run function book_binder:system/random_page {page:0}
execute if score book_binder.maxPages book_binder.reallylongnamethatihopenobodyisusing matches ..0 run return 0

# Pick a random page
$execute store result storage book_binder:page_number page int 1 run random value 0..$(maxPages)
function book_binder:system/random_page with storage book_binder:page_number

# Decrement the number of pages to generate by 1, since a page was generated
scoreboard players remove book_binder.pages book_binder.reallylongnamethatihopenobodyisusing 1

# Decrement the number of pages to work with by 1, since a page was removed
scoreboard players remove book_binder.maxPages book_binder.reallylongnamethatihopenobodyisusing 1

# Store the scoreboard value of "book_binder.reallylongnamethatihopenobodyisusing" for "book_binder.maxPages" in a way that can be used as input for a
# function
execute store result storage book_binder:page_number maxPages int 1 run scoreboard players get book_binder.maxPages book_binder.reallylongnamethatihopenobodyisusing

# If all the pages asked to be generated have been, then end the loop
execute if score book_binder.pages book_binder.reallylongnamethatihopenobodyisusing matches ..0 run return 0

# Start the next iteration of the loop
function book_binder:system/random_page_loop with storage book_binder:page_number