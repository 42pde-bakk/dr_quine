# Comment
def printer():
	exec(c := "# Comment print(f'exec(c := {chr(34) + c + chr(34)})')")


def main():
	# Comment
	printer()


if __name__ == '__main__':
	main()
