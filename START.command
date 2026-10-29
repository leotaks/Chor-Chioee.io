#!/bin/bash
cd "$(dirname "$0")"
PORT=4173
IP=$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null)
if [ -z "$IP" ]; then
  IP=$(python3 -c 'import socket; s=socket.socket(socket.AF_INET,socket.SOCK_DGRAM); s.connect(("10.255.255.255",1)); print(s.getsockname()[0]); s.close()' 2>/dev/null)
fi
echo ""
echo "Chor Chioée 局域网展示已启动"
echo "本机打开: http://localhost:$PORT"
if [ -n "$IP" ]; then
  echo "同事打开: http://$IP:$PORT"
else
  echo "未能自动获取局域网地址，请在 系统设置 > Wi-Fi > 详细信息 中查看 IP。"
fi
echo ""
echo "请保持此窗口和电脑开启。按 Control+C 停止。"
echo "如果 macOS 询问是否允许网络连接，请选择允许。"
echo ""
open "http://localhost:$PORT" >/dev/null 2>&1
python3 -m http.server "$PORT" --bind 0.0.0.0 --directory site
