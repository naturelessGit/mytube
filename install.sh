#!/bin/bash

clear 
echo "====================================="
echo "|~    MyTube Installer - 1.0.0     ~|"
echo "====================================="
echo
echo "-- OS --"
echo "What OS are you using?"
echo "1) Linux"
echo "2) macOS"
echo "3) Use Python Install"
read -p "> " os

case $os in
        1)
                OS="linux"
                ;;
        2)      
                OS="macos"
                ;;
        3)      
                echo "[*] Using python install. Please make sure you have Python installed."
                sleep 4
                clear
                wget https://github.com/yt-dlp/yt-dlp/releases/download/2025.06.30/yt-dlp
                clear
                echo "[*] Finished."
                sleep 2
                clear
                ;;
        *)      
                echo "[!] Invalid option."
                exit 1
                ;;
esac

# Linux specific architecture handling
if [ "$OS" == "linux" ]; then
        echo "-- Arch --"
        echo "What architecture do you have?"
        echo "1) x86 or x86_64"
        echo "2) aarch64"
        echo "3) armv7l"
        read -p "> " arch

        case $arch in
                1)
                        ARCH="x86_64"
			clear
                        wget https://github.com/yt-dlp/yt-dlp/releases/download/2025.06.30/yt-dlp_linux
			clear
                        ;;
                2)
                        ARCH="aarch64"
			clear
                        wget https://github.com/yt-dlp/yt-dlp/releases/download/2025.06.30/yt-dlp_linux_aarch64
			clear
                        ;;
                3)
                        ARCH="armv7l"
			clear
                        wget https://github.com/yt-dlp/yt-dlp/releases/download/2025.06.30/yt-dlp_linux_armv7l
			clear
                        ;;
                *)
                        echo "[!] Invalid architecture."
                        exit 1
                        ;;
        esac

        echo "[*] Making dependency executable."
        chmod +x yt-dlp
	echo "[*] Finished."
        sleep 2
        clear
fi

# macOS handling
if [ "$OS" == "macos" ]; then
        echo "[*] Installing yt-dlp for macOS..."
	clear
        brew install yt-dlp
	clear
        if [ $? -eq 0 ]; then
                echo "[*] yt-dlp installed successfully using Homebrew."
        else
                echo "[!] Failed to install yt-dlp using Homebrew. Please check if Homebrew is installed."
                exit 1
        fi
        sleep 2
        clear
fi


