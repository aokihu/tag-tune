#include <taglib/fileref.h>
#include <taglib/tag.h>
#include <iostream>
#include <sstream>

std::string toJsonString(const std::string& title, const std::string& artist, 
                         const std::string& album, unsigned year, 
                         const std::string& genre, int duration, 
                         int channels, int bitrate) {
    std::ostringstream jsonStream;
    jsonStream << "{\n"
               << "  \"title\": \"" << title << "\",\n"
               << "  \"artist\": \"" << artist << "\",\n"
               << "  \"album\": \"" << album << "\",\n"
               << "  \"year\": " << year << ",\n"
               << "  \"genre\": \"" << genre << "\",\n"
               << "  \"duration\": " << duration << ",\n"
               << "  \"channels\": " << channels << ",\n"
               << "  \"bitrate\": " << bitrate << "\n"
               << "}";
    return jsonStream.str();
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        std::cerr << "Usage: " << argv[0] << " <filename>" << std::endl;
        return 1;
    }

    TagLib::FileRef f(argv[1]);

    if (!f.isNull()) {
        TagLib::Tag *tag = f.tag();
        TagLib::AudioProperties *properties = f.audioProperties();

        std::string json = toJsonString(
            tag->title().toCString(true), 
            tag->artist().toCString(true), 
            tag->album().toCString(true), 
            tag->year(), 
            tag->genre().toCString(true), 
            properties->lengthInSeconds(), 
            properties->channels(), 
            properties->bitrate()
        );

        std::cout << json << std::endl;
    } else {
        std::cerr << "Error reading file." << std::endl;
    }

    return 0;
}
