# Sorry, I ran out of motivation to add comments for this one.
# This function doesn't do anything extremely different from what some of the other functions do, so I'd suggest
# that you try reading the comments on the other functions to get a rough idea of what this one's doing.

$execute unless data storage book_binder:pages pages[$(page)] run tellraw @s {"text":"Page $(page) does not exist","color":"red"}
$execute unless data storage book_binder:pages pages[$(page)] run return 0
$data modify storage book_binder:pages construct append from storage book_binder:pages pages[$(page)]