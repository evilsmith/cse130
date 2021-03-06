from misc import Failure

class Vector(object):
	"""a fixed length vector"""

	def __init__(self, n):
		"""initialize the vector to the given length"""
		try:
			if n < 0:
				raise ValueError("length cannot be negative")
		except TypeError:
			pass

		try:
			self.data = [0.0] * n
		except Exception:
			self.data = list(n)
	
	def __len__(self):
		"""return the number of elements in the vector"""
		return len(self.data)

	def __iter__(self):
		"""return an iterator to the vector"""
		for e in self.data:
			yield e
	
	def __add__(self, other):
		"""add the vector and another sequence"""
		return Vector(([x + y for x, y in zip(list(self), list(other))]))

	def __radd__(self, other):
		"""add the vector and another sequence"""
		return Vector(([x + y for x, y in zip(list(self), list(other))]))

	def __iadd__(self, other):
		"""add another sequence to the vector"""
		self.data =  Vector(([x + y for x, y in zip(list(self), list(other))]))
		return self.data

	def dot(self, other):
		"""return the dot product of a vector and another sequence"""
		try:
			return sum([x * y for x, y in zip(self, other)])
		except:
			return sum([str(x) + str(y) for x, y in zip(self, other)])

	def __getitem__(self, n):
		"""return the nth element in the vector"""
		return self.data[n]

	def __setitem__(self, n, x):
		"""set the nth element in the vector"""
		self.data[n] = x

	def cmp_helper(self, other):
		"""return the sequence in descending order"""
		return zip(sorted(self, reverse=True), sorted(other, reverse=True))

	def __gt__(self, other):
		if not isinstance(other, Vector):
			return self > other
		for x, y in self.cmp_helper(other):
			if not x > y:
				return False
		return True

	def __ge__(self, other):
		if not isinstance(other, Vector):
			return self >= other
		for x, y in self.cmp_helper(other):
			if not x >= y:
				return False
		return True

	def __lt__(self, other):
		return not self.__ge__(other)

	def __repr__(self):
		"""return the string representation of the vector"""
		return "Vector(" + repr(self.data) + ")"
