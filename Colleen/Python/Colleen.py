# Comment
def p():
	s = '# Comment\ndef p():\n\ts = %r\n\tprint(s %% s)\n\ndef main():\n\tp()\n\nmain()'
	print(s % s)

def main():
	p()

main()
