different(red, green) .
different(red, blue) .
different(green, red) .
different(green, blue) .
different(blue, red) .
different(blue, green) .

coloring(Alabama, Mississippi, Georgia, Tennesee, Florida) :-
  different(Mississippi, Tennesee),
  different(Mississippi, Alabama),
  different(Alabama, Tennesee),
  different(Alabama, Mississippi),
  different(Alabama, Georgia),
  different(Alabama, Florida),
  different(Georgia, Florida),
  different(Georgia, Tennesse) .
