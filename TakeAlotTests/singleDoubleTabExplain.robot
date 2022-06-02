# If we need to separate a keyword from argument, or two arugments from another,
# you need to put at least 2 spaces between them
# It can be more, but not less

# If there is only a single space between two words, it's going to be seen as
# belonging to the same keyword or the same argument

#for example (using asterix instead of space for clarity):

    input*Text**Locator**Text*to*Type (correct)
    input*Text*Locator**Text*To*Type (will give error)
    Input*Text**Locator*Text*To*Type (will give error)
