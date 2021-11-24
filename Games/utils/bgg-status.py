#!/usr/bin/python3

import csv

with open('collection.csv') as csvfile:
	reader = csv.DictReader(csvfile)
	for row in reader:
		name = row['objectname']
		plays = row['numplays']
		price = row['pricepaid'] 
		
		if (plays != ''):
			if (price != ''):
				print( name + " -> " + str(float(price) / int(plays)))
			else:
				print(name + " -> PON PRECIO ")
		else:
			print(name + " -> JUEGALO ")
		#print(row)
		