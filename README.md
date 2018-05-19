# Android Data Pull (android-db-dump)

Shell script for pulling data of available packages via adb

## Installation

```sh
$ chmod +x dump.sh
```

## Usage

list available packages found on device

```sh
$ dump.sh info
Packages found on device:
com.android.bluetooth
com.android.bluetoothmidiservice
com.android.browser
com.android.calculator2
com.android.calendar
com.android.camera2
...
success
```

list all files inside the data directory of (package-name)

```sh
$ dump.sh list com.android.music
files found on com.android.music:
cache
code_cache
shared_prefs
success
```
dump data of (package-name) to (dir)

```sh
$ dump.sh dump com.android.music ./
/data/data/com.android.music/: 1 file pulled. 0.0 MB/s (260 bytes in 0.029s)
success
```

## License

Licensed under the Apache license.
