# Comment
def p():
	s = '# Comment\ndef p():\n\ts = %r\n\tprint(s %% s)\n\n\ndef main():\n\t# Another comment\n\tp()\n\n\nmain()'
	print(s % s)


def main():
	# Another comment
	p()


main()
