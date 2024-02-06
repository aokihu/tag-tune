#ifndef FORMATTER_H
#define FORMATTER_H

#include "SongInfo.h"
#include <string>

// Convert a SongInfo instance to a JSON string
std::string toJsonString(const SongInfo& song);

// Convert a SongInfo instance to a YAML string
std::string toYamlString(const SongInfo& song);

// Convert a SongInfo instance to a plain text string
std::string toPlainText(const SongInfo& song);

#endif // FORMATTER_H
