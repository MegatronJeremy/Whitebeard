import os
#global data, defining the ISA
arithmetic = {"addc":"01", "add":"00", "sub":"10", "subc":"11"}
#proveriti tacnost ovoga
branch = {
    "br": "0000",
    "brd":"0001",
    "bz":"0010",
    "beq":"0010",
    "bnz":"0011",
    "bneq":"0011",
    "blu":"0100",
    "bc":"0100",
    "bgeu":"0101",
    "bnc":"0101",
    "bleu":"0110",
    "bgu":"0111",
    "blt":"1000",
    "bge":"1001",
    "ble":"1010",
     "bgt":"1011"}
empty = ["nop", "halt", "rti"]
memcmp = ["st", "ld", "ldi", "andi", "cmpa", "cmp", "jmp", "out", "in"]
addi = ["addi"]
poi = ["poi"]

shift={
    "shl" : "00",
    "shr" : "01",
    "ror" : "10",
    "sar" : "11"
}
shiftimmed={
    "shli" : "00",
    "shri" : "01",
    "rori" : "10",
    "sari" : "11"
}
logic={
    "implies" : "00",
    "xor" : "01",
    "and" : "10",
    "or" : "11"
}

opcodes = {
    "nop": "00000",
    "halt": "00001",
    "rti" : "10010",
    "jmp": "00010",
    "out": "00011",
    "in" : "00100",
    "branch": "00101",
    "poi": "00110",
    "st": "00111",
    "ld": "01000",
    "ldi": "01001",
    "andi": "01010",
    "cmp": "01011",
    "cmpa": "01100",
    "arithmetic" : "01101",
    "addi" : "01110",
    "logic" : "01111",
    "shf" : "10000",
    "shfi" : "10001"

}
registers={
    "r0" : "000",
    "r1" : "001",
    "r2" : "010",
    "r3" : "011",
    "r4" : "100",
    "r5" : "101",
    "r6" : "110",
    "r7" : "111"
}


def decode(a):
    a=a.split("#", 1)[0] #comment support
    words=a.split(" ")

    words= [x.strip().lower() for x in words if x.strip()]
    if len(words)==0: return words
    ret=[]
    if words[0] in arithmetic.keys():
        str1='"' + opcodes.get("arithmetic") + registers.get(words[1].replace(",", "")) +'"'
        ret.append(str1)
        str2= '"' +  registers.get(words[2].replace(",", "")) + arithmetic.get(words[0]) + registers.get(words[3].replace(",", "")) +'"'
        ret.append(str2)

    elif words[0] in branch:
        str1='"' + opcodes.get("branch") + branch.get(words[0])[:3] + '"'
        ret.append(str1)
        str2='"' + branch.get(words[0])[3] + str(bin(int(words[1].replace("x", ""), 16)))[2:].zfill(7) +'"'
        ret.append(str2)
    elif words[0] in memcmp:

        str1='"' +  opcodes.get(words[0]) + registers.get(words[1].replace(",", "")) +'"'
        ret.append(str1)
        str2= '"' + str(bin(int(words[2].replace("x", ""), 16)))[2:].zfill(8) +'"'
        ret.append(str2)
    elif words[0] in empty:
        str1='"' + opcodes.get(words[0]) + "000" + '"'
        ret.append(str1)
        str2='"'+"00000000" + '"'
        ret.append(str2)

    elif words[0] in addi:
        str1='"' + opcodes.get(words[0]) + registers.get(words[1].replace(",", "")) +'"'
        ret.append(str1)
        str2='"' + registers.get(words[2].replace(",", "")) + str(bin(int(words[3].replace("x", ""), 16)))[2:].zfill(5) +'"'
        ret.append(str2)
    elif words[0] in poi:
        str1='"' + opcodes.get(words[0]) +"000"  + '"'
        ret.append(str1)
        str2='"'+ "00000" + registers.get(words[1]) + '"'
        ret.append(str2)
    elif words[0] in shift:
        str1='"' + opcodes.get("shf") + registers.get(words[1].replace(",", "")) +'"'
        ret.append(str1)
        str2= '"' +  registers.get(words[2].replace(",", "")) + shift.get(words[0]) + registers.get(words[3].replace(",", "")) +'"'
        ret.append(str2)
    elif words[0] in shiftimmed:
        str1='"' + opcodes.get("shfi") + registers.get(words[1].replace(",", "")) +'"'
        ret.append(str1)
        str2= '"' +  registers.get(words[2].replace(",", "")) + shiftimmed.get(words[0]) + str(bin(int(words[3].replace("x", ""), 16)))[3:].zfill(3) +'"'
        ret.append(str2)
    elif words[0] in logic:
        str1 = '"' + opcodes.get("logic") + registers.get(words[1].replace(",", "")) + '"'
        ret.append(str1)
        str2 = '"' + registers.get(words[2].replace(",", "")) + logic.get(words[0]) + registers.get(words[3].replace(",", "")) + '"'
        ret.append(str2)
    else:
       raise TypeError

    return ret


inp=input("input file: ")


with open(inp, "r") as infile, open("prog.S", "w+") as outfile:

    try:
        L=infile.readlines()
        i=0
        output=[]
        for line in L:

            l =decode(line) #bice lista, prvi i drugi bajt
            i += 1
            if len(l)>0: output.append(l)


        i=0
        for elem in output:
            writestring1=str(i) +"=>" + elem[0] + ",\n"
            i+=1
            writestring2=str(i) + "=>" + elem[1] +",\n"
            i+=1
            outfile.write(writestring1)
            outfile.write(writestring2)
        outfile.write("others => (others=>'0')")
        print("OK")
    except TypeError:
       print("invalid instruction on line ", i)
    except FileNotFoundError:
        print("DAT_GRESKA")
    except:
        print("unkown error")
