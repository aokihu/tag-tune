#include <taglib/fileref.h>
#include <taglib/tag.h>
#include <iostream>

int main(int argc, char *argv[]) {
    if (argc < 2) {
        std::cerr << "Usage: " << argv[0] << " <filename>" << std::endl;
        return 1;
    }

    TagLib::FileRef f(argv[1]);

    if (!f.isNull() && f.audioProperties()) {
        TagLib::AudioProperties *properties = f.audioProperties();

        int length = properties->length(); // Duration in seconds
        int channels = properties->channels(); // Number of channels

        std::cout << "Duration: " << length << " seconds\n";
        std::cout << "Channels: " << channels << std::endl;
    } else {
        std::cerr << "Error reading file." << std::endl;
    }

    return 0;
}
