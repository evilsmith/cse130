
from misc import *
import crypt
import itertools
import string

def load_words(filename,regexp):
    """Load the words from the file filename that match the regular
       expression regexp.  Returns a list of matching words in the order
       they are in the file."""
    f = open(filename)
    return re.findall(regexp, f.read())

def transform_reverse(str):
    """return a list with the original string and the reversal of the original string."""
    return [str, ''.join(reversed(str))]

def transform_capitalize(str):
    """return a list of all the possible ways to capitalize the input string."""
    return [''.join(c) for c in itertools.product(*zip(str.lower(), str.upper()))]

def transform_digits(str):
    """return a list of all possible ways to replace letters with similar looking digits"""
    t1 = {
            'o': '0',
            'z': '2',
            'a': '4',
            'b': '6',
            'i': '1',
            'l': '1',
            'e': '3',
            's': '5',
            't': '7',
            'g': '9',
            'q': '9'
            }
    t2 = dict(t1)
    t2['b'] = '8'
    str1 = str
    str2 = ''.join([t1.get(c, c) for c in str1.lower()])
    str3 = ''.join([t2.get(c, c) for c in str1.lower()])
    return list(set(''.join(c) for c in itertools.product(*zip(str1, str2, str3))))

def check_pass(plain,enc):
    """return True if plain encrypts to enc using the function crypt"""
    return crypt.crypt(plain, enc[0:2]) == enc

def load_passwd(filename):
    """Load the password file filename and returns a list of
       dictionaries with fields "account", "password", "UID", "GID",
       "GECOS", "directory", and "shell", each mapping to the
       corresponding field of the file."""
    f = open(filename)
    result = []
    for line in f.read().split('\n'):
        if not line:
            continue
        entry = {}
        (entry['account'], entry['password'], entry['UID'], entry['GID'],
        entry['GECOS'], entry['directory'], entry['shell']) = line.split(':')
        result.append(entry)
    return result


def crack_pass_file(fn_pass,words,out):
    """Crack as many passwords in file fn_pass as possible using words
       in the file words"""
    raise Failure("to be written")

