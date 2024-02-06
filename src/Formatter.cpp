#include "Formatter.h"
#include <sstream>

std::string toJsonString(const SongInfo& song) {
    std::ostringstream jsonStream;
    jsonStream << "{\n"
               << "  \"title\": \"" << song.title << "\",\n"
               << "  \"artist\": \"" << song.artist << "\",\n"
               << "  \"album\": \"" << song.album << "\",\n"
               << "  \"year\": " << song.year << ",\n"
               << "  \"genre\": \"" << song.genre << "\",\n"
               << "  \"duration\": " << song.duration << ",\n"
               << "  \"channels\": " << song.channels << ",\n"
               << "  \"bitrate\": " << song.bitrate << "\n"
               << "}";
    return jsonStream.str();
}

std::string toYamlString(const SongInfo& song) {
    std::ostringstream yamlStream;
    yamlStream << "title: " << song.title << "\n"
               << "artist: " << song.artist << "\n"
               << "album: " << song.album << "\n"
               << "year: " << song.year << "\n"
               << "genre: " << song.genre << "\n"
               << "duration: " << song.duration << "\n"
               << "channels: " << song.channels << "\n"
               << "bitrate: " << song.bitrate << "\n";
    return yamlStream.str();
}

std::string toPlainText(const SongInfo& song) {
    std::ostringstream textStream;
    textStream << "Title: " << song.title << ", "
               << "Artist: " << song.artist << ", "
               << "Album: " << song.album << ", "
               << "Year: " << song.year << ", "
               << "Genre: " << song.genre << ", "
               << "Duration: " << song.duration << " seconds, "
               << "Channels: " << song.channels << ", "
               << "Bitrate: " << song.bitrate << " kbps";
    return textStream.str();
}
