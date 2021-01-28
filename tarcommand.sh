#\bin\bash
dir=pwd
printf "Would you like to compress or extract? (c/x)\n#>"
read action
printf "Enter path to file. note: current working directory is: $dir\n#>"
read path

if [ $action = "x" ]
then
	tar -xzvf $path
fi
	if [ $action = "compress" ]
	then
		tar -cvzf $path
fi
echo 'tar -xzf is the command, remember it next time :)'
