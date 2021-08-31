# ffmpeg -re -f concat -safe 0 -i <(for i in {1..9999}; do printf "file '%s'\n" /home/user/Downloads/dejavu.mp4; done) -f v4l2 /dev/video1 && !!
# sudo modprobe v4l2loopback
# ffmpeg -stream_loop -1 -re -i bruh.mp4 -map 0:v -f v4l2 /dev/video0
ffmpeg -stream_loop -1 -re -i bruh.mp4 -map 0:v -vf format=yuv420p -f v4l2 /dev/video0