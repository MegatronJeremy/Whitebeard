#global data, defining the ISA

arithmetic = {"addc": "01", "add": "00", "sub": "10", "subc": "11"}

branch = {
    "br": "0000",
    "brd": "0001",
    "bz": "0010",
    "beq": "0010",
    "bnz": "0011",
    "bneq": "0011",
    "blu": "0100",
    "bc": "0100",
    "bgeu": "0101",
    "bnc": "0101",
    "bleu": "0110",
    "bgu": "0111",
    "blt": "1000",
    "bge": "1001",
    "ble": "1010",
    "bgt": "1011"
}

empty = ["nop", "halt", "rti"]

memcmp = ["st", "ld", "ldi", "andi", "cmpa", "cmp", "jmp", "out", "in"]

addi = ["addi"]

poi = ["poi"]

shift = {"shl": "00", "shr": "01", "ror": "10", "sar": "11"}
shiftimmed = {"shli": "00", "shri": "01", "rori": "10", "sari": "11"}
logic = {"implies": "00", "xor": "01", "and": "10", "or": "11"}

opcodes = {
    "nop": "00000",
    "halt": "00001",
    "rti": "10010",
    "jmp": "00010",
    "out": "00011",
    "in": "00100",
    "branch": "00101",
    "poi": "00110",
    "st": "00111",
    "ld": "01000",
    "ldi": "01001",
    "andi": "01010",
    "cmp": "01011",
    "cmpa": "01100",
    "arithmetic": "01101",
    "addi": "01110",
    "logic": "01111",
    "shf": "10000",
    "shfi": "10001"
}
registers = {
    "r0": "000",
    "r1": "001",
    "r2": "010",
    "r3": "011",
    "r4": "100",
    "r5": "101",
    "r6": "110",
    "r7": "111"
}


def firstpass(a, address, symbols):
    #adds the key, value pair to the symbol table, either with return or here (a should be the line read)
    #TODO: reorganize, no syntax check necessary so far.
    a = a.split("#", 1)[0]  #comment support
    if (len(a) == 0): return address
    if(":" in a):
        a=a.split(":")
        a=[x.strip().lower() for x in a if x.strip()]
        if(len(a)==0): return address
        elif(len(a)==1):
            # if len is 1 its just a symbol, if 2 its symbol + instruction
            symbols[a[0]]=address

        elif(len(a)==2):
            symbols[a[0]] = address
            address+=2
        else:
            raise TypeError #or something else
    else:
        address+=2 #this should also work

    return address


def secondpass(a, symbols, address):
    a = a.split("#", 1)[0]  #comment support
    if (":" in a ): a=a.split(":")[1]#should work
    words = a.split(" ")

    words = [x.strip().lower() for x in words if x.strip()]


    if len(words) == 0: return words, address
    address+=2 #current value of pc
    ret = []
    if words[0] in arithmetic.keys():
        str1 = '"' + opcodes.get("arithmetic") + registers.get(
            words[1].replace(",", "")) + '"'
        ret.append(str1)
        str2 = '"' + registers.get(words[2].replace(",", "")) + arithmetic.get(
            words[0]) + registers.get(words[3].replace(",", "")) + '"'
        ret.append(str2)

    elif words[0] in branch:
        if words[1] in symbols.keys():

            if(address-symbols.get(words[1])>0 and address-symbols.get(words[1])<=2**6): #call to an earlier label, displacement NEGATIVE

                str1 = '"' + opcodes.get("branch") + branch.get(words[0])[:3] + '"'
                ret.append(str1)
                str2='"'+  branch.get(words[0])[3]+str(bin(int((address-symbols.get(words[1]))^63)+1))[2:].rjust(7, '1')[-7:] + '"'
                ret.append(str2)
            elif(address-symbols.get(words[1])<=0 and address-symbols.get(words[1])>-(2**6)): #check conditions, displacement POSITIVE
                str1 = '"' + opcodes.get("branch") + branch.get(words[0])[:3] + '"'
                ret.append(str1)
                str2='"' + branch.get(words[0])[3]+str(bin(symbols.get(words[1])-address))[2:].zfill(8)[-7:] + '"'
                ret.append(str2)
            else: raise ValueError;

        else: #normal branch, should work or raise an error
            str1 = '"' + opcodes.get("branch") + branch.get(words[0])[:3] + '"'
            ret.append(str1)
            str2 = '"' + branch.get(words[0])[3] + str(bin(int(words[1].replace("x", ""), 16)))[2:].zfill(8)[-7:] + '"' #replaced with [-7:], test this
            ret.append(str2)
    elif words[0] in memcmp:

        str1 = '"' + opcodes.get(words[0]) + registers.get(words[1].replace(
            ",", "")) + '"'
        ret.append(str1)
        str2 = '"' + str(bin(int(words[2].replace("x", ""),
                                 16)))[2:].zfill(8)[-8:] + '"'#replaced with [-8:], test this
        ret.append(str2)
    elif words[0] in empty:
        str1 = '"' + opcodes.get(words[0]) + "000" + '"'
        ret.append(str1)
        str2 = '"' + "00000000" + '"'
        ret.append(str2)

    elif words[0] in addi:
        str1 = '"' + opcodes.get(words[0]) + registers.get(words[1].replace(
            ",", "")) + '"'
        ret.append(str1)
        str2 = '"' + registers.get(words[2].replace(",", "")) + str(
            bin(int(words[3].replace("x", ""), 16)))[2:].zfill(8)[-5:] + '"'
        ret.append(str2)
    elif words[0] in poi:
        str1 = '"' + opcodes.get(words[0]) + "000" + '"'
        ret.append(str1)
        str2 = '"' + "00000" + registers.get(words[1]) + '"'
        ret.append(str2)
    elif words[0] in shift:
        str1 = '"' + opcodes.get("shf") + registers.get(words[1].replace(
            ",", "")) + '"'
        ret.append(str1)
        str2 = '"' + registers.get(words[2].replace(",", "")) + shift.get(
            words[0]) + registers.get(words[3].replace(",", "")) + '"'
        ret.append(str2)
    elif words[0] in shiftimmed:
        str1 = '"' + opcodes.get("shfi") + registers.get(words[1].replace(
            ",", "")) + '"'
        ret.append(str1)
        str2 = '"' + registers.get(words[2].replace(
            ",", "")) + shiftimmed.get(words[0]) + str(
                bin(int(words[3].replace("x", ""), 16)))[2:].zfill(3)[-3:] + '"' #added [-3:]
        ret.append(str2)
    elif words[0] in logic:
        str1 = '"' + opcodes.get("logic") + registers.get(words[1].replace(
            ",", "")) + '"'
        ret.append(str1)
        str2 = '"' + registers.get(words[2].replace(",", "")) + logic.get(
            words[0]) + registers.get(words[3].replace(",", "")) + '"'
        ret.append(str2)
    elif words[0].lower() == "org":
        str1 = words[0]
        ret.append(str1)
        str2 = str(int(words[1].replace("x", ""), 16))
        ret.append(str2)
    else:
        address-=2 #return pc to previous value, wont affect anything
        raise TypeError

    return ret, address


inp = input("input file: ")
out = input("output file: ")

with open(inp, "r") as infile, open(out, "w+") as outfile:
    #maybe intermediate files, especially for "call" or similar instructions
    #or alternatively, making and modifying a list in the first pass, for the second, which is more efficient
    try:
        L = infile.readlines()
        i = 0  #i (or beter yet, address) should be a parameter for firstpass or global
        symbols = {}  #empty dictionary for symbols (either here or as global)
        #firstpass call should probably be somewhere around here, in a similar for loop
        output = []
        address=0
        for line in L:
            address=firstpass(line, address, symbols)
        address=0
        for line in L:

            l,address = secondpass(line, symbols, address)  #bice lista, prvi i drugi bajt
            i += 1
            if len(l) > 0: output.append(l)

        i = 0
        for elem in output:
            if (elem[0] == "org"):
                i = int(elem[1])
            else:
                writestring1 = str(i) + "=>" + elem[0] + ",\n"
                i += 1
                writestring2 = str(i) + "=>" + elem[1] + ",\n"
                i += 1
                outfile.write(writestring1)
                outfile.write(writestring2)
        outfile.write("others => (others=>'0')")
        print("OK")
    except TypeError:
        print("invalid instruction on line ", i)
    except FileNotFoundError:
        print("DAT_GRESKA")
