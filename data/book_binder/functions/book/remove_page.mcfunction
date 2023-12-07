# Check if the targeted page exists in storage "book_binder:pages"
# If not, imform the user and end the function early
$execute unless data storage book_binder:pages pages[$(page)] run tellraw @s {"text":"Page $(page) does not exist","color":"red"}
$execute unless data storage book_binder:pages pages[$(page)] run return 0

# Remove the targeted page
$data remove storage book_binder:pages pages[$(page)]