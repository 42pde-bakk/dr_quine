import os
i = 5
if i > 0:
	i -= 1
	s = 'import os\ni = %s\nif i > 0:\n\ti -= 1\n\ts = %r\n\tfilename = f"Sully_{i}"\n\twith open(filename, "w") as f:\n\t\tprint(s %% s, file=f)\n\tos.system(f"python {filename}")'
	filename = f'Sully_{i}.py'
	with open(filename, 'w') as f:
		print(s % (i, s), file=f)
	os.system(f'python {filename}')
