# Book Binder
A Minecraft data pack for generating random books. Mainly meant to be incorporated into other data packs.<br/><br/><br/>


### Functions

> Store your book in the clouds! (disclaimer: only one book can be stored per world)

<br/>

`book_binder:book/upload {no arguments}`: Attempts to upload the pages of the currently held book to storage. Fails if the executer isn't a player with a book and quill or written book in their main-hand. Overwrites any previous data if successful.

`book_binder:book/add_pages {no arguments}`: Attempts to append the pages of the currently held book to the pages within storage. Fails if the executer isn't a player with a book and quill or written book in their main-hand.

`book_binder:book/add_page {page:<string>}`: Appends the data of argument "page" to the pages within storage. Data of argument "page" is treated as a string enclosed in double quotes, even if it wasn't originally. In most cases, I'd suggest using `book_binder:book/add_pages` instead.

`book_binder:book/clear {no arguments}`: Removes all pages within storage. Simple as that.

`book_binder:book/remove_page {page:<integer>}`: Attempts to remove the page at index "page" within storage. Fails if the targeted page doesn't exist.

`book_binder:book/output {no arguments}`: Attempts to create a writen book item entity containing a copy of the pages within storage. Note: said item entity despawns in 2 game ticks, to prevent clutter. Fails if there aren't any pages within storage.

`book_binder:book/generate {pages:<integer>}`: Attempts to create a writen book item entity containing "pages" number of random pages from storage. Note: said item entity despawns in 2 game ticks, to prevent clutter. Each page within storage can occur only once in the generated book, and are randomly arranged in said book. Attempting to generate a book with more pages then what's been stored will result in a book with as many pages as what's in storage. Attempting to use integers less than or equal to one for the argument "pages" results in a book with only one page. Fails if there aren't any pages within storage.

<br/>
WIP, I'll continue working on this tomorrow...
