# int_to_bin.py
# accepts a positive integer and returns the binary form
# use:
#   python int_to_bin.py 456
#   > 111001000

import sys

def is_intstring(s):
    try:
        int(s)
        return True
    except ValueError:
        return False

def step(n,bin_str=""):
  if (n == 0 and bin_str == ""): return "0"
  elif n == 0: return bin_str
  else:
    q, r = divmod(n,2)
    bin_str = str(r) + bin_str
    return step(q,bin_str)

def main(arg):
  if not is_intstring(arg):
    sys.exit("Argument must be an integer. Exit.")
  if int(arg) < 0:
    sys.exit("Argument must be a positive integer. Exit.")
  else:
    print('%s in binary is:\n%s' % (arg,step(int(arg))))

if __name__ == "__main__":
   main(sys.argv[1])