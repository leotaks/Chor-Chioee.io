#!/bin/bash
pkill -f "python3 -m http.server 4173" 2>/dev/null || true
echo "局域网展示已停止。"
sleep 2
