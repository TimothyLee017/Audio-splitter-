# Audio Splitter GUI

A simple audio-splitting tool built with Python and Tkinter for large recordings, interviews, meetings, podcasts, and long-form audio files.

This tool uses **FFmpeg** for the actual splitting process, which gives it broad format support and solid reliability, while keeping the workflow easy through a **GUI desktop interface**.

## Features

- Supports many audio formats:
  - `mp3`, `wav`, `m4a`, `aac`, `flac`, `ogg`, `opus`, `wma`, `aiff`, `aif`, `amr`, `mka`
- Also supports common video containers with audio tracks:
  - `mp4`, `mov`, `mkv`, `webm`, `3gp`, `ts`, `m2ts`
- Two split modes:
  - **Split evenly into N parts**
  - **Split by fixed duration** (for example, every 10 minutes)
- In fixed-duration mode, you can optionally limit the **maximum number of output files**
- Choose an output extension:
  - `keep`, `.mp3`, `.wav`, `.m4a`, `.aac`, `.flac`, `.ogg`, `.opus`
- Includes a log panel and progress bar
- Useful when a recording is too large to upload, share, or process directly

## Good Use Cases

- Splitting long meeting recordings
- Breaking interview audio into smaller backup segments
- Cutting large recordings into upload-friendly files for AI or cloud tools
- Extracting and splitting audio from video files

## Requirements

- Python 3.10 or later
- `ffmpeg` and `ffprobe` installed and available in your system PATH

## Quick Start

### 1. Clone the project

```bash
git clone <your-repo-url>
cd audio-splitter-gui
```

### 2. Install FFmpeg

#### Windows

Using `winget`:

```bash
winget install Gyan.FFmpeg
```

After installation, reopen your terminal or sign out and back in, then verify:

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

### 3. Run the app

```bash
python audio_splitter_gui.py
```

On Windows, you can also double-click:

- `start_windows.bat`

## How to Use

### Mode A: Split into N equal parts

Example:
- A 60-minute audio file
- Set the number of parts to 4
- The app will create about 15 minutes × 4 output files

### Mode B: Split by fixed duration

Example:
- Segment length: `00:10:00`
- This means one output file every 10 minutes

Supported time formats:

- `600` → 600 seconds
- `10:00` → 10 minutes 0 seconds
- `00:10:00` → 10 minutes 0 seconds

### Max Output Files

This field can be left blank.

If you only want the first few segments, for example:
- 10 minutes per segment
- Max output files = 3

Then only the first 30 minutes will be exported.

## Output Format Notes

- `keep`: keep the original file extension
- Other formats: re-export as the selected audio format

Important:
This tool currently **re-encodes output files** instead of using direct stream copy.
That improves compatibility after splitting and reduces the chance of playback issues with certain containers or codecs.

## Project Structure

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

## Build a Windows EXE

If you want to distribute the app to users who do not use Python, you can package it with PyInstaller:

```bash
pip install pyinstaller
pyinstaller --noconfirm --onefile --windowed audio_splitter_gui.py
```

Or on Windows, just double-click:

- `build_exe.bat`

The packaged executable will usually be created at:

```text
dist/audio_splitter_gui.exe
```

## FAQ

### 1. The app says ffmpeg / ffprobe was not found

This means FFmpeg is not installed, or it is installed but not added to PATH.

Check whether these commands work:

```bash
ffmpeg -version
ffprobe -version
```

### 2. Why can splitting sometimes feel slow?

Because the tool currently re-encodes output files instead of just cutting the container.

### 3. Can it process video files?

Yes. As long as the video contains an audio track, the app uses `-vn` to ignore video and export audio-only segments.

### 4. Can it batch-process multiple files?

Not in the current version. This release is a single-file GUI app.

## Possible Future Improvements

- Drag and drop files into the window
- Batch processing for multiple files
- Split automatically by target file size
- Show estimated output size per segment
- Ship a ready-made Windows `.exe`
- Add an option to preserve metadata

## License

This project is licensed under the MIT License.
