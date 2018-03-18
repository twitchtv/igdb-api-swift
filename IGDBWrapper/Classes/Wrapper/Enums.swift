//
//  Enums.swift
//  IGDBWrapper
//
//  Created by Filip on 2018-03-18.
//

import Foundation

// Enums of IGDB endpoints.
public enum Endpoint: String {
    case CHARACTERS, COLLECTIONS, COMPANIES, CREDITS, FEEDS, FRANCHISES, GAME_ENGINES, GAME_MODES, GAMES,
    GENRES, KEYWORDS, PAGES, PEOPLE, PLATFORMS, PLAYER_PERSPECTIVES, PULSE_GROUPS,
    PULSE_SOURCES, PULSES, RELEASE_DATES, REVIEWS, THEMES, TITLES
}

// Emuns of api versions, Standard or Pro.
public enum UserVersion: String {
    case Pro, Standard
}

// Enums of HTTP methods for requests.
public enum HttpMethod: String {
    case GET, POST, PATCH, DELETE
}
