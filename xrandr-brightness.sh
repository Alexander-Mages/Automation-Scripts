#!\bin\bash

#note: you could grep the output of xrandr to automatically specify the outputs

#naming scheme: output + iteration number
output1="DP-2"
output2="DP-3"
output3="HDMI-1"

#iterationCount is the number of outputs to be affected by the script
iterationCount="3"



echo 'Enter screen brightness value (30-100)'

read inputBrightness

if [ $inputBrightness == "100" ]
	then
	brightness="1"
elif [ $inputBrightness < "30" ]
	then
	brightness="1"
	printf "Brightness is set below 30%, This will make screen too dark to see. Script restarting"
	exec bash "$0" "$@"
else
	brightness=.${inputBrightness}
fi

#sets iteration at one
iteration=1

#loops through all the specified outputs
for i in $iterationCount
do
	
	output=echo "${output}${iteration}"
	finaloutput=echo $output
	xrandr --output ${finaloutput} --brightness $brightness
	(( iteration++ ))
done
