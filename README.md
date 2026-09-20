# Auto Directory Organizer

A lightweight Windows batch script that organizes scattered files in any directory based on their file extensions.

The script can be placed in any folder and run directly. It only processes loose files in that directory. Existing folders and everything inside them are left untouched.

## How it works

Place `organize.bat` in any directory containing scattered files.

For example:

```text
My Project/
├── organize.bat
├── report.pdf
├── photo.jpg
├── song.mp3
├── video.mp4
├── setup.exe
├── backup.zip
├── Research/
│   ├── paper.pdf
│   └── data.csv
└── Photos/
    └── old_photo.jpg
```

Run the script.

The loose files are organized:

```text
My Project/
├── organize.bat
├── Documents/
│   └── report.pdf
├── Images/
│   └── photo.jpg
├── Music/
│   └── song.mp3
├── Videos/
│   └── video.mp4
├── Installers/
│   └── setup.exe
├── Archives/
│   └── backup.zip
├── Research/
│   ├── paper.pdf
│   └── data.csv
└── Photos/
    └── old_photo.jpg
```

Files inside `Research` and `Photos` are not touched.

## Folder behavior

The script only scans files directly inside the directory where `organize.bat` is located.

It does not recursively scan folders.

This means:

```text
Directory/
├── file.pdf          <- processed
├── image.jpg         <- processed
└── Existing Folder/
    ├── file.pdf      <- ignored
    └── image.jpg     <- ignored
```

Existing folders are treated as separate areas and are completely ignored.

Category folders such as `Documents` or `Images` are created only when a matching loose file needs to be moved.

## Supported file types

| Folder        | Extensions                                                                                                                                                               |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Documents     | `.pdf`, `.doc`, `.docx`, `.txt`, `.rtf`, `.odt`, `.md`                                                                                                                   |
| Spreadsheets  | `.xls`, `.xlsx`, `.xlsm`, `.csv`, `.ods`                                                                                                                                 |
| Presentations | `.ppt`, `.pptx`, `.pptm`, `.odp`                                                                                                                                         |
| Images        | `.jpg`, `.jpeg`, `.png`, `.gif`, `.bmp`, `.webp`, `.svg`, `.ico`, `.tif`, `.tiff`, `.heic`, `.avif`                                                                      |
| Videos        | `.mp4`, `.mkv`, `.avi`, `.mov`, `.wmv`, `.webm`, `.flv`, `.m4v`                                                                                                          |
| Music         | `.mp3`, `.wav`, `.flac`, `.aac`, `.m4a`, `.ogg`, `.wma`                                                                                                                  |
| Archives      | `.zip`, `.rar`, `.7z`, `.tar`, `.gz`, `.bz2`, `.xz`                                                                                                                      |
| Installers    | `.exe`, `.msi`, `.msix`, `.appx`                                                                                                                                         |
| Code          | `.c`, `.cpp`, `.h`, `.hpp`, `.py`, `.js`, `.ts`, `.java`, `.cs`, `.go`, `.rs`, `.php`, `.html`, `.css`, `.json`, `.xml`, `.yaml`, `.yml`, `.toml`, `.sql`, `.ps1`, `.sh` |
| Disk Images   | `.iso`, `.img`, `.vhd`, `.vhdx`                                                                                                                                          |
| Fonts         | `.ttf`, `.otf`, `.woff`, `.woff2`                                                                                                                                        |
| Ebooks        | `.epub`, `.mobi`, `.azw`, `.azw3`                                                                                                                                        |

## Conflict handling

The script never overwrites an existing file.

If a destination already contains a file with the same name:

```text
Directory/
├── report.pdf
└── Documents/
    └── report.pdf
```

The loose `report.pdf` is skipped.

```text
[SKIP] report.pdf
```

The original file remains exactly where it was.

No file is deleted, replaced, renamed, or modified to resolve the conflict.

## Unknown files

Files with unsupported extensions are ignored.

For example:

```text
file.xyz
data.bin
README
```

remain untouched unless their extensions are added to the script's classification list.

## Safety

The script is intentionally non destructive.

It:

* Never deletes files
* Never overwrites files
* Never modifies file contents
* Never recursively scans folders
* Never moves files from existing folders
* Never moves unknown file types
* Never moves the batch file itself
* Skips destination conflicts
* Leaves unclassified files untouched

## Usage

1. Copy `organize.bat` into the directory you want to organize.
2. Run the batch file.
3. Review the output.
4. The scattered files are moved into their corresponding folders.

The same script can be reused in any directory.

No installation or external software is required.

## Requirements

* Windows
* Command Prompt
* No external dependencies

## License

MIT
