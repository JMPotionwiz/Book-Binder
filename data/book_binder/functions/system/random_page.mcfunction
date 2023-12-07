# If the targeted page dosen't exist, end the function early
$execute unless data storage book_binder:pages randomPages[$(page)] run return 0

# Add the targeted page to the list of generated pages
$data modify storage book_binder:pages generated append from storage book_binder:pages randomPages[$(page)]

# Remove the targeted page from the copied list of pages. This prevents the same page from being pick multiple times
$data remove storage book_binder:pages randomPages[$(page)]