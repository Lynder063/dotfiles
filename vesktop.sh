#/bin/bash

#script to start vesktop with some args

vesktop \
  --ozone-platform-hint=auto \
  --enable-webrtc-pipewire-capturer \
  --enable-features=WaylandWindowDecorations \
  --enable-features=UseOzonePlatform \
  --ozone-platform=wayland \
  --use-gl=angle \
  --use-angle=gl \
  --enable-features=VaapiVideoDecodeLinuxGL,VaapiVideoEncoder
