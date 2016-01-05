fname = raw_input("Enter file name: ")
fh = open(fname)
lst = []
for line in fh:
    ws=line.split()
    ln=len(ws)
    print ln
    for i in range(ln):
        if (ws[i] in lst)==True: 
            continue
        else:
            ap=ws[i]
            lst.append(ap)
lst.sort()
print lst
