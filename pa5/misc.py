#PA 4

import re
import string

"Miscellaneous functions to practice Python"

class Failure(Exception):
	"""Failure exception"""
	def __init__(self,value):
		self.value=value
	def __str__(self):
		return repr(self.value)

# Problem 1

# data type functions

def closest_to(l,v):
	"""Return the element of the list l closest in value to v.  In the case of
	   a tie, the first such element is returned.  If l is empty, None is returned."""
	if not l:
		return l

	closest = l[0]
	for e in l:
		if abs(e - v) < abs(closest - v):
			closest = e
	return closest

def make_dict(keys,values):
	"""Return a dictionary pairing corresponding keys to values."""
	return dict(zip(keys,values))

# file IO functions
def word_count(fn):
	"""Open the file fn and return a dictionary mapping words to the number
	   of times they occur in the file.  A word is defined as a sequence of
	   alphanumeric characters and _.  All spaces and punctuation are ignored.
	   Words are returned in lower case"""
	counts = {}
	f = open(fn)
	words = "".join([c if c.isalnum() or c == '_' else ' ' for c in f.read().lower()])
	for word in words.split():
		counts[word] = counts.get(word, 0) + 1
	return counts

