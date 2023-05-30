class LanguageHelper:
  "Encapsulate a dictionary used by the Spell Checker"
  def __init__(self, dictFile):
    dictFile = open(dictFile)
    self.dict = list()
    for l in dictFile:
      self.dict.append(l.strip('\n'))
    self.word = ''

  def __contains__(self, word):
    "Implements the 'in' operator"
    # we will save enough to not have to redo search (normally)
    # self.i will point to found word or where word would be inserted
    self.word = word
    self.wordlo = word[0].lower() + word[1:]
    # linear search for word
#    for self.i in xrange(len(self.dict)):
#      w = self.dict[self.i]
#      if w == word or w == self.wordlo:
#        return True
#      wlo = w.lower()
#      if wlo > self.wordlo:
#        return False
#    self.i += 1
#    return False
    # binary search for word
    j = 0
    k = len(self.dict) - 1
    while j<=k:
      i = (j+k)/2
      w = self.dict[i]
      if w == word or w == self.wordlo:
        self.i = i
        return True
      wlo = w.lower()
      if wlo <= self.wordlo:
        j = i + 1
      else:
        k = i - 1
    self.i = j
    return False

  def getSuggestions(self, word):
    "Provides words near where the misspelled word would be"
    if word != self.word:
      self.__contains__(word)
    if self.i == 0:
      return self.dict[0:1]
    suggest =  self.dict[self.i-1:self.i+1]
    if word[0].isupper():
      for i in range(len(suggest)):
        suggest[i] = suggest[i].capitalize()
    return suggest

