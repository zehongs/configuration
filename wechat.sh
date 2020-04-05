#bin/bash
docker run -d --rm --name wechat --device /dev/snd \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v $HOME/WeChatFiles:/WeChatFiles \
--ipc="host" \
-e DISPLAY=unix$DISPLAY \
-e XMODIFIERS=@im=fcitx \
-e QT_IM_MODULE=fcitx \
-e GTK_IM_MODULE=fcitx \
-e AUDIO_GID=`getent group audio | cut -d: -f3` \
-e GID=`id -g` \
-e UID=`id -u` \
bestwu/wechat

# Wait
read -s -k $'?After login, press any key to suppress the black box ... \n'


# Remove black box:
wmctrl -l -G -p -x | grep wechat.exe.Wine | grep -v 微信 | cut -c1-10 | while read line
do
 #echo "File:${line}"
  xdotool windowunmap ${line}
done
