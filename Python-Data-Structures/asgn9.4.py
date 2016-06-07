"""
9.4 Write a program to read through the mbox-short.txt and figure out who has
the sent the greatest number of mail messages. The program looks for 'From '
lines and takes the second word of those lines as the person who sent the mail.
The program creates a Python dictionary that maps the sender's mail address to
a count of the number of times they appear in the file. After the dictionary is
produced, the program reads through the dictionary using a maximum loop to find
the most prolific committer.
"""


#fname = raw_input("D:\course\python\mbox-short.txt")
#if len(name) < 1 : name = "mbox-short.txt"
fh = open("D:\course\python\mbox-short.txt")

count={}

#dic=dict()

for line in fh:
    if line.startswith('From '):
        words=line.split()
        wd=words[1]
        count[wd]=count.get(wd,0)+1
#print (count)           
#mx = max(count, key=count.get)
#print (mx, count[mx])
#sorted_count = sorted(count.values())
#from operator import itemgetter
#sorted_count = sorted(count.items(), key=itemgetter(1), reverse=True)

#lst =list()
lst=list(count.values())
#print(lst)

# Loop through dict to find max value
mx = lst[0]
#print (mx)
for keys in count:
    val= count.get(keys)
    #print(lol)
    if val > mx:
        mx = val
for key, values in count.items():
    if mx== values:
        print (key, mx)  # REMOVE BRACKERS IF YOU USE PY 2.7
        
#print(mx)
#values=mx
#print(count.popitem())
#print (sorted_count[0])
