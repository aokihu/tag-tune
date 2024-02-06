#ifndef SONG_INFO_H
#define SONG_INFO_H

#include <string>

// Define a struct that describes the song info
struct SongInfo {
    std::string title;
    std::string artist;
    std::string album;
    unsigned year;
    std::string genre;
    int duration; // Unit: seconds
    int channels;
    int bitrate; // Unit: kbps
};

#endif // SONG_INFO_H
