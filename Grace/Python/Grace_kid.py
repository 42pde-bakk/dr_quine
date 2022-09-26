# Comment
S = '# Comment\nS = %r\nGRACE = exec\nfname = "Grace_kid.py"\nPROG = %cwith open(fname, "w") as f: print(S %% (S, 39, 39), file=f)%c\n\nGRACE(PROG)'
GRACE = exec
fname = "Grace_kid.py"
PROG = 'with open(fname, "w") as f: print(S % (S, 39, 39), file=f)'

GRACE(PROG)
