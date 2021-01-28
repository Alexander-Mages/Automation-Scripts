#\bin\bash

echo Would you like to compress or extract? enter compress or extract exactly
read action
echo Please enter the full path to your file
read path

if [ $action = "extract" ]
then
	tar -xzf $path
fi
	if [ $action = "compress" ]
	then
		tar -czf $path
fi
echo 'tar -xzf dont forget it this time dumbass'
