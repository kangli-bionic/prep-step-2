# Wordplay

Write a method that accepts two strings as arguments. If the second string can be spelled using letters from the first, return an array of the indices of the letters of the second string as they occur in the first (choose the earlier occurrence if a letter occurs more than once). Otherwise, return `false`. The second string may reuse letters from the first.

Examples:

`wordplay('substandard', 'bad') => [2, 5, 7]`

`wordplay('shadowless', 'dashes') => [3, 2, 0, 1, 7, 0]`

`wordplay('cartoon', 'lineograph') => false`

<iframe frameborder="0" width="100%" height="650" src="https://repl.it/GdYF/31?lite=true"></iframe>
