//
//  DiscordAutoModerationTrigger.swift
//  swift-discord
//
//  Created by Flaky le Flaker (Mineturtlee) on 15/11/26.
//

public struct DiscordAutoModerationTriggerType: RawRepresentable, Codable {
    public let rawValue: Int
    public init(rawValue r: Int) {
        rawValue = r
    }
    
    public static let keyword = Self(rawValue: 1)
    public static let spam = Self(rawValue: 3)
    public static let keywordPreset = Self(rawValue: 4)
    public static let mentionSpam = Self(rawValue: 5)
    public static let memberProfile = Self(rawValue: 6)
}

public struct DiscordAutoModerationTriggerMetadata: Codable {
    public var keywordFilter: [String]
    public var regexPatterns: [String]
    public var presets: [DiscordAutoModerationKeywordPresetType]
    public var allowList: [String]
    public var mentionTotalLimit: Int
    public var mentionRaidProtectionEnabled: Bool
    
    enum CodingKeys: String, CodingKey {
        case keywordFilter = "keyword_filter"
        case regexPatterns = "regex_patterns"
        case presets
        case allowList = "allow_list"
        case mentionTotalLimit = "mention_total_limit"
        case mentionRaidProtectionEnabled = "mention_raid_protection_enabled"
    }
}
