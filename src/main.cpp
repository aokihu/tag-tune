#include "Formatter.h"
#include "SongInfo.h"
#include <taglib/fileref.h>
#include <taglib/tag.h>
#include <iostream>
#include <cstring>

// Version
const std::string VERSION = "1.0.3";


// Program entry point
int main(int argc, char *argv[]) {
    std::string format = "json"; // default format


    // parse command line arguments
    for (int i = 1; i < argc; ++i) {
        if (strcmp(argv[i], "-v") == 0) {
            std::cout << "Software Version: " << VERSION << std::endl;
            return 0;
        } else if (strcmp(argv[i], "-t") == 0 && i + 1 < argc) {
            format = argv[++i];
        }
    }

    // at least one command line argument should be given
    if (argc < 2) {
        std::cerr << "Usage: " << argv[0] << " [-v] [-t format] <filename>" << std::endl;
        return 1;
    }

    TagLib::FileRef f(argv[argc - 1]); // read the audio file

    if (!f.isNull()) {
        TagLib::Tag *tag = f.tag();
        TagLib::AudioProperties *properties = f.audioProperties();

        // 填充 SongInfo 结构体

        SongInfo song = {
            tag->title().toCString(true),
            tag->artist().toCString(true),
            tag->album().toCString(true),
            tag->year(),
            tag->genre().toCString(true),
            properties->lengthInSeconds(),
            properties->channels(),
            properties->bitrate()
        };

        // output the song info in the specified format
        if (format == "json") {
            std::cout << toJsonString(song) << std::endl;
        } else if (format == "yaml") {
            std::cout << toYamlString(song) << std::endl;
        } else if (format == "text") {
            std::cout << toPlainText(song) << std::endl;
        } else {
            std::cerr << "Invalid format specified." << std::endl;
            return 1;
        }
    } else {
        std::cerr << "Error reading file." << std::endl;
        return 1;
    }

    return 0;
}
