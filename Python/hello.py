# coding=UTF-8
filename = raw_input('Filename: ')

f = open(filename, 'r')
b_str = f.read()
f.close()

print b_str.decode('utf-8') # What's this?
print b_str.decode('utf-8').encode('utf-8') # What's this?

