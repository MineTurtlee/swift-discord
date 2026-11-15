//
//  DiscordAutoModerationRule.swift
//  swift-discord
//
//  Created by Flaky le Flaker (Mineturtlee) on 30/10/26.
//

import Foundation

public struct DiscordAutoModerationRule: Equatable, Identifiable, Codable {
    public static func == (lhs: DiscordAutoModerationRule, rhs: DiscordAutoModerationRule) -> Bool {
        return lhs.id == rhs.id
    }
    
    public var id: Snowflake
    public var guildId: Snowflake
    public var name: String
    public var creatorId: Snowflake
    public var eventType: DiscordAutoModerationEventType
    public var triggerType: DiscordAutoModerationTriggerType
    public var triggerMetadata: DiscordAutoModerationTriggerMetadata
    public var actions: [DiscordAutoModerationAction]
    public var enabled: Bool
    public var exemptRoles: [Snowflake]
    public var exemptChannels: [Snowflake]
    
    enum CodingKeys: String, CodingKey {
        case id
        case guildId = "guild_id"
        case name
        case creatorId = "creator_id"
        case eventType = "event_type"
        case triggerType = "trigger_type"
        case triggerMetadata = "trigger_metadata"
        case actions
        case enabled
        case exemptRoles = "exempt_roles"
        case exemptChannels = "exempt_channels"
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.eventType, forKey: .eventType)
        try container.encode(self.triggerMetadata, forKey: .triggerMetadata)
        try container.encode(self.actions, forKey: .actions)
        try container.encode(self.enabled, forKey: .enabled)
        try container.encode(self.exemptRoles, forKey: .exemptRoles)
        try container.encode(self.exemptChannels, forKey: .exemptChannels)
    }
}

public struct DiscordAutoModerationEventType: RawRepresentable, Codable {
    public let rawValue: Int
    
    public static let messageSend = DiscordAutoModerationEventType(rawValue: 1)
    public static let memberUpdate = DiscordAutoModerationEventType(rawValue: 2)
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

public struct DiscordAutoModerationKeywordPresetType: RawRepresentable, Codable {
    public let rawValue: Int
    public init(rawValue r: Int) {
        rawValue = r
    }
    
    public static let profanity = Self(rawValue: 1)
    public static let sexualContent = Self(rawValue: 2)
    public static let slurs = Self(rawValue: 3)
}
