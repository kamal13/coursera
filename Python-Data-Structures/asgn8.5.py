# mbox-short.txt
fname = raw_input("Enter file name: ")
fh = open(fname)
count = 0
for line in fh:
    if line.startswith('From '):
	ws=line.split()
	print ws[1]
        count=count+1
print "There were", count, "lines in the file with From as the first word"
