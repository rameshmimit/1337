import urllib
import json
import argparse

parser = argparse.ArgumentParser(description='DnD Die Roller')

# parser.add_argument('-r')

# TODO:
# - make cached result mode
#	- use generator to query list
# - make this take arguments
# - turn this into a pip installable module (ch. 21 Learning Python)
# - create r20-like syntax
#	- '/r 1d20+1, 1d6+2, 2d6-1'
# - create API for web application
# - port some of this to js to calculate nums from int list (so i don't have to hit the server each time)
# - build chat application that integrates with this service
# 	- web
# 	- cli (maybe?)
#	- web & cli see same chat stream? eh? maybe?:) 

URL = 'https://qrng.anu.edu.au/API/jsonI.php'
MAX_RESULTS = 1024  # api example: https://qrng.anu.edu.au/API/api-demo.php
MAX_INT = 65536  # see: http://en.wikipedia.org/wiki/65536_(number)


def get_nums(num_results=MAX_RESULTS):
    url = URL + '?' + urllib.urlencode({
        'type': 'uint16',
        'length': num_results,
        'size': 1024,
    })
    # print url

    result = json.loads(urllib.urlopen(url).read())
    assert result['success'] is True, result
    assert result['length'] == num_results, result

    # print 'success!'
    return result['data']


def rand_int_list(min=1, max=8):
	range = max - min
	mod = MAX_INT / range
	nums = get_nums(10)
	results = []

	for x in nums:
		results.append(x / mod + min)

	print results
    # return rand / mod + min

def rand_int(max=20, min=1):
	range = max-min
	modulus = MAX_INT / range

	# TODO: use generator to handle multiple rolls
	num = get_nums(1)[0]
	result = num / modulus + min

	return result

def roll_d20(modifier=0):
	print 'rolling d20'
	result = rand_int(20) + modifier
	print result

def roll_d10(modifier=0):
	print 'rolling d10'
	result = rand_int(10)
	print result

def roll_d8(modifier=0):
	print 'rolling d8'
	result = rand_int(8)
	print result

def roll_d6(modifier=0):
	print 'rolling d6'
	result = rand_int(6)
	print result

def roll_d3(modifier=0):
	print 'rolling d3'
	result = rand_int(3)
	print result

# roll_d20()
# roll_d10()
# roll_d8()
# roll_d6()
# roll_d3()

# print "your result is %d" % rand_int()
# rand_int_list()
