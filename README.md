# Audio Splitter GUI

一個用 Python + Tkinter 製作的音訊分割工具，適合處理大型錄音檔、訪談檔、會議錄音或長音訊素材。

這個工具使用 **FFmpeg** 做實際切檔，因此支援格式廣、穩定性高，並提供簡單的 **GUI 圖形介面**，不需要打指令也能操作。

## 功能特色

- 支援多種音訊格式：
  - `mp3`, `wav`, `m4a`, `aac`, `flac`, `ogg`, `opus`, `wma`, `aiff`, `aif`, `amr`, `mka`
- 也支援常見含音訊的影片容器：
  - `mp4`, `mov`, `mkv`, `webm`, `3gp`, `ts`, `m2ts`
- 可選擇兩種分割方式：
  - **平均分成 N 份**
  - **依固定時間分割**（例如每 10 分鐘一段）
- 固定時間模式可限制 **最多輸出幾份**
- 可選擇輸出副檔名：
  - `keep`, `.mp3`, `.wav`, `.m4a`, `.aac`, `.flac`, `.ogg`, `.opus`
- 有執行紀錄視窗與進度條
- 適合處理「錄音檔太大，無法上傳或無法直接使用」的情境

## 適合用途

- 長時間會議錄音切段
- 訪談音檔分段備份
- 將超大錄音切成可上傳到 AI / 雲端平台的大小
- 從影片中切出純音訊並分段

## 執行需求

- Python 3.10 以上
- 已安裝並可在系統 PATH 中使用的 `ffmpeg` 與 `ffprobe`

## 快速開始

### 1. 下載專案

```bash
git clone <your-repo-url>
cd audio-splitter-gui
```

### 2. 安裝 FFmpeg

#### Windows

可用 `winget`：

```bash
winget install Gyan.FFmpeg
```

安裝後請重新開啟終端機或重新登入系統，確認以下指令可用：

```bash
ffmpeg -version
ffprobe -version
```

#### macOS

```bash
brew install ffmpeg
```

#### Ubuntu / Debian

```bash
sudo apt update
sudo apt install ffmpeg
```

### 3. 執行程式

```bash
python audio_splitter_gui.py
```

Windows 也可以直接雙擊：

- `start_windows.bat`

## 操作方式

### 模式 A：平均分成 N 份

例如：
- 一個 60 分鐘音檔
- 設成 4 份
- 程式會切成約 15 分鐘 x 4 段

### 模式 B：每段固定時間

例如：
- 每段 `00:10:00`
- 代表每 10 分鐘切一段

支援以下時間格式：

- `600` → 600 秒
- `10:00` → 10 分 0 秒
- `00:10:00` → 10 分 0 秒

### 最多輸出份數

這個欄位可留白。

若你只想先切前幾段，例如：
- 每段 10 分鐘
- 最多輸出 3 份

那就只會輸出前 30 分鐘內容。

## 輸出格式說明

- `keep`：保留原始副檔名
- 其他格式：轉成指定音訊格式輸出

注意：
本工具目前會 **重新編碼輸出**，不是直接 stream copy。
這樣做的好處是切段相容性通常更穩，較不容易遇到某些容器或編碼在切割後無法正常播放的問題。

## 專案結構

```text
audio-splitter-gui/
├─ audio_splitter_gui.py
├─ README.md
├─ requirements.txt
├─ LICENSE
├─ .gitignore
├─ start_windows.bat
└─ build_exe.bat
```

## 打包成 Windows EXE

如果你想提供給不懂 Python 的使用者，可以用 PyInstaller 打包：

```bash
pip install pyinstaller
pyinstaller --noconfirm --onefile --windowed audio_splitter_gui.py
```

或直接在 Windows 雙擊：

- `build_exe.bat`

打包後成品通常會在：

```text
dist/audio_splitter_gui.exe
```

## 常見問題

### 1. 開啟程式後顯示找不到 ffmpeg / ffprobe

代表你的電腦還沒安裝 FFmpeg，或安裝了但沒有加入 PATH。

請先確認以下指令是否可執行：

```bash
ffmpeg -version
ffprobe -version
```

### 2. 為什麼切檔速度有時比較慢？

因為本工具目前採用重新編碼輸出，不是單純切封裝。

### 3. 可以處理影片嗎？

可以。只要影片內有音訊軌，程式可用 `-vn` 方式忽略畫面，只輸出音訊分段。

### 4. 可不可以批次處理多個檔案？

目前版本是單檔處理 GUI。之後可以擴充成批次模式。

## 後續可擴充方向

- 拖曳檔案進視窗
- 批次處理多個檔案
- 依檔案大小自動切割
- 顯示預估每段大小
- 直接封裝成 Windows `.exe`
- 保留 metadata 選項

## 授權

本專案使用 MIT License。
