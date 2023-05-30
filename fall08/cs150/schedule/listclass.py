class OurList:
	
	def __init__(self):
		self._head = None
		self._rest = None
		
	def _isEmpty(self):
		return self._rest is None
		
	def append(self, value):
		if self._isEmpty():
			self._head = value
			self._rest = OurList()
		else:
			self._rest.append(value)
			
	def count(self, value):
		if self._isEmpty():
			return 0
		else:
			subtotal = self._rest.count(value)
			if self._head == value:
				subtotal += 1
			return subtotal
			
	def __contains__(self, value):
		if self._isEmpty():
			return False
		else:
			if self._head == value:
				return True
			else:
				return value in self._rest
			
	def __getitem__(self, i):
		if self._isEmpty():
			raise IndexError('list index out of range')
		elif i == 0:
			return self._head
		else:
			return self._rest[i-1]
		
	def __str__(self):
		if self._isEmpty():
			return ''
		else:
			return '[' + str(self._head) + ', ' + self._rest.convertToStr() + ']'
		
		
	def convertToStr(self):
		if self._isEmpty():
			return ''
		else:
			if self._rest._isEmpty():
				return str(self._head)
			else:
				return str(self._head) + ', ' + self._rest.convertToStr() 
		
	def remove(self, value):
		if self._isEmpty():
			raise ValueError('value not in list')
		elif self._head == value:
			self._head = self._rest._head
			self._rest = self._rest._rest
		else:
			self._rest.remove(value)
		
	def pop(self, index):
		if self._isEmpty():
			raise IndexError('list index out of range')
		elif index == 0:
			temp = self._head
			self.remove(self._head)
			return temp
		else: 
			self._rest.pop(index - 1)
			
	def reverse(self):
		if not self._isEmpty():
			self._rest.reverse()
			self.append(self._head)
			self.remove(self._head)
