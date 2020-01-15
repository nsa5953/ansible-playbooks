# Python script to convert yaml/yml file to python style syntax 
# useful to when using ansible 
# Use: change yml file name 

import yaml, pprint
pprint.pprint(yaml.load(open("test.yml").read()))
