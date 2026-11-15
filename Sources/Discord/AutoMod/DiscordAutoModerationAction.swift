//
//  DiscordAutoModerationAction.swift
//  swift-discord
//
//  Created by Flaky le Flaker (Mineturtlee) on 15/11/26.
//

public struct DiscordAutoModerationAction: Codable {
    public var type: DiscordAutoModerationActionType
    public var metadata: DiscordAutoModerationActionMetadata?
}

public struct DiscordAutoModerationActionType: RawRepresentable, Codable {
    public let rawValue: Int;
    public init(rawValue r: Int) {
        rawValue = r
    }
    
    public static let blockMessage = Self(rawValue: 1)
    public static let sendAlertMessage = Self(rawValue: 2)
    public static let timeout = Self(rawValue: 3)
    public static let blockMemberInteraction = Self(rawValue: 4)
}

public struct DiscordAutoModerationActionMetadata: Codable {
    public let channelId: Snowflake?
    public let duration: Int?
    public let customMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case channelId = "channel_id"
        case duration = "duration"
        case customMessage = "custom_message"
    }
}
