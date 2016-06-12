'''
10.2 Write a program to read through the mbox-short.txt and figure out the
distribution by hour of the day for each of the messages. You can pull the
hour out from the 'From ' line by finding the time and then splitting the
string a second time using a colon.

From stephen.marquard@uct.ac.za Sat Jan  5 09:14:16 2008

Once you have accumulated the counts for each hour, print out the counts,
sorted by hour as shown below.
'''

#fname = raw_input("D:\course\python\mbox-short.txt")
#if len(name) < 1 : name = "mbox-short.txt"
fh = open("D:\course\python\mbox-short.txt")

count={}

#dic=dict()

for line in fh:
    if line.startswith('From '):
#        words=line.split()
         ind=line.find(":")
        # print (ind)
         tm=line[ind-2:ind]
         #print (tm)
         count[tm]=count.get(tm,0)+1
#print (count)
lst=list(count.items())
#for key, val in count.items():
 #   lst (key,val)

lst.sort()

for key, val in lst:
    print (key,val)
