#!/bin/bash
sudo apt install figlet
sudo apt install ffmpeg
clear
figlet J-stream
echo "-------------------------------------------------------"
echo "> Live stream your content simultaneously to YouTube and Facebook"
echo "> we only allow pre - rec content, How can i start:"

echo "> 1.Type [1] for Youtube or [2] for Facebook to start"
echo "> 2.Enter your YouTube or Facebook stream key"
echo "> 3.Enter your video file / formats : mp4 , avi . webm"

echo "> press ctl+c to stop streaming"
echo "-------------------------------------------------------"
sleep 4
echo "Choose your streaming destination: [1] YouTube [2] Facebook"
read userinput
if [[ $userinput == "1" ]]; then

	echo "Enter your stream key:"

	read -s key

	echo "Plese Enter your input file:"

	read file

	ffmpeg \
	-i $file \
	-c:v libx264 \
	-b:v 2000k \
		-safe 0 \
	-f flv \
   rtmp://a.rtmp.youtube.com/live2/$key


else
 echo "Facebook  live streaming is still under development :)"
fi
#stream strart
echo "Starting Stream ..."
trap 'echo "Stream has ended i Hope you enjoyed your stream"; exit' SIGINT


