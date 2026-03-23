@echo off
cd /d %~dp0
pip install pyinstaller
pyinstaller --noconfirm --onefile --windowed audio_splitter_gui.py
pause
