# TagTune

## Overview

TagTune is a C++ program designed to extract and format metadata from audio files. Utilizing the TagLib library, it provides functionality to output audio metadata in various formats, including JSON, YAML, and plain text.

## Features

- Extracts metadata from audio files, including title, artist, album, year, genre, duration, channels, and bitrate.
- Supports multiple output formats: JSON, YAML, and plain text.
- Command-line interface for ease of use and script integration.
- Version information display.

## Prerequisites

- C++ Compiler (GCC or equivalent)
- TagLib library installed on your system

## Installation

Clone the TagTune repository to your local machine:

```shell
git clone [repository URL]
```

Navigate to the TagTune project directory:

```shell
cd tagtune
```

Compile the program using the provided Makefile:

```shell
./action_linux.sh         # for Linux
./action_macos_intel.sh   # for macOS (Intel)
```

## Usage

To use TagTune, run the program with an audio file as an argument:

```shell
./tagtune [-v] [-t format] <filename>
```

## Options:

- '-v' : Display the software version.
- '-t format' : Specify the output format (json, yaml, text). Defaults to JSON if not specified.
- '<filename>' : Path to the audio file.
  Example:
  ./tagtune -t yaml song.mp3

## License

BSD-3-Clause

## Contributing

Contributions are welcome. Please adhere to standard Github pull request protocols for submitting changes.

## Authors

- aokihu <aokihu@gmail.com>

## Acknowledgments

- Special thanks to the TagLib library for its audio metadata extraction capabilities.
