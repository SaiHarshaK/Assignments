lines_seen = []#set()  # holds lines already seen
lines_seen.append("fakeval")
lines_seen.append("fakeval2")

outfile = open('rating_nodupes.sql', "w")
infile = open('sql-files/rating.sql', "r")
# print "Input file"
for line in infile:
	# print line
	if line not in lines_seen:  # not a duplicate
		# print lines_seen
		outfile.write(line)
		lines_seen.pop()
		lines_seen.append(line)
		# print lines_seen
# print(lines_seen)
outfile.close()
# lines_seen.clear()
