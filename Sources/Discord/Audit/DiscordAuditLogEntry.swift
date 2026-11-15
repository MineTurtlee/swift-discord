// The MIT License (MIT)
// Copyright (c) 2017 Erik Little

// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
// documentation files (the "Software"), to deal in the Software without restriction, including without
// limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
// Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
// Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
// BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
// EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
// ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
// DEALINGS IN THE SOFTWARE.

import Foundation

/// Represents an audit entry.
public struct DiscordAuditLogEntry: Decodable, Identifiable {
    public enum CodingKeys: String, CodingKey {
        case actionType = "action_type"
        case changes
        case id
        case options
        case reason
        case targetId = "target_id"
        case userId = "user_id"
    }

    // MARK: Properties

    /// The type of this entry.
    public let actionType: DiscordAuditLogActionType

    /// The changes done in this entry.
    public let changes: [DiscordAuditLogChange]?

    /// The id of this entry.
    public let id: Snowflake

    /// Optional audit entry information for certain action types.
    public let options: Options?

    /// The reason for this entry.
    public let reason: String?

    /// The id of the effected entity.
    public let targetId: String

    /// The user's id who caused this entry.
    public let userId: Snowflake

    /// Additional info.
    public struct Options: Codable {
        public enum CodingKeys: String, CodingKey {
            case deleteMemberDays = "delete_member_days"
            case membersRemoved = "members_removed"
            case channelId = "channel_id"
            case messageId = "message_id"
            case count
            case id
            case type
            case roleName = "role_name"
            case applicationId = "application_id"
            case autoModerationRuleName = "auto_moderation_rule_name"
            case autoModerationRuleTriggerType = "auto_moderation_rule_trigger_type"
            case integrationType = "integration_type"
            case status
        }

        /// Number of days after which inactive members were kicked.
        public var deleteMemberDays: String?

        /// Number of members removed from the prune.
        public var membersRemoved: String?

        /// Channel in which the entities were targeted.
        public var channelId: ChannelID?

        /// ID of the message which was targeted.
        public var messageId: MessageID?
        
        /// Number of entities that were targeted.
        public var count: String?

        /// ID of the overwritten entry.
        public var id: Snowflake?

        /// Type of overwritten entity - "0" for "role", "1" for "member"
        public var type: String?

        /// Name of the role if type is not "0" (not present if type is "1")
        public var roleName: String?
        
        public var applicationId: Snowflake?
        public var autoModerationRuleName: String?
        public var autoModerationRuleTriggerType: String?
        public var integrationType: String?
        public var status: String?
    }
}

// TODO Better types for this
/// Represents a change.
public struct DiscordAuditLogChange: Decodable {
    public enum CodingKeys: String, CodingKey {
        case key
        case newValue = "new_value"
        case oldValue = "old_value"
    }

    // MARK: Properties

    /// The key for this change. Determines the types of the values.
    public let key: String

    /// The new value.
    public let newValue: Any

    /// The old value.
    public let oldValue: Any

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        key = try container.decode(String.self, forKey: .key)
        newValue = try container.decodePrimitiveAny(forKey: .newValue)
        oldValue = try container.decodePrimitiveAny(forKey: .oldValue)
    }
}

/// The types of audit actions.
public struct DiscordAuditLogActionType: RawRepresentable, Codable {
    public var rawValue: Int

    public static let guildUpdate = DiscordAuditLogActionType(rawValue: 1)
    
    public static let channelCreate = DiscordAuditLogActionType(rawValue: 10)
    public static let channelUpdate = DiscordAuditLogActionType(rawValue: 11)
    public static let channelDelete = DiscordAuditLogActionType(rawValue: 12)
    
    public static let channelOverwriteCreate = DiscordAuditLogActionType(rawValue: 13)
    public static let channelOverwriteUpdate = DiscordAuditLogActionType(rawValue: 14)
    public static let channelOverwriteDelete = DiscordAuditLogActionType(rawValue: 15)
    
    public static let channelPositionUpdate = DiscordAuditLogActionType(rawValue: 16)
    
    public static let memberKick = DiscordAuditLogActionType(rawValue: 20)
    public static let memberPrune = DiscordAuditLogActionType(rawValue: 21)
    public static let memberBanAdd = DiscordAuditLogActionType(rawValue: 22)
    public static let memberBanRemove = DiscordAuditLogActionType(rawValue: 23)
    public static let memberUpdate = DiscordAuditLogActionType(rawValue: 24)
    public static let memberRoleUpdate = DiscordAuditLogActionType(rawValue: 25)
    
    public static let memberMove = DiscordAuditLogActionType(rawValue: 26)
    public static let memberDisconnect = DiscordAuditLogActionType(rawValue: 27)
    
    public static let botAdd = DiscordAuditLogActionType(rawValue: 28)
    
    public static let roleCreate = DiscordAuditLogActionType(rawValue: 30)
    public static let roleUpdate = DiscordAuditLogActionType(rawValue: 31)
    public static let roleDelete = DiscordAuditLogActionType(rawValue: 32)
    public static let rolePositionUpdate = DiscordAuditLogActionType(rawValue: 33)
    
    public static let inviteCreate = DiscordAuditLogActionType(rawValue: 40)
    public static let inviteUpdate = DiscordAuditLogActionType(rawValue: 41)
    public static let inviteDelete = DiscordAuditLogActionType(rawValue: 42)
    
    public static let webhookCreate = DiscordAuditLogActionType(rawValue: 50)
    public static let webhookUpdate = DiscordAuditLogActionType(rawValue: 51)
    public static let webhookDelete = DiscordAuditLogActionType(rawValue: 52)
    
    public static let emojiCreate = DiscordAuditLogActionType(rawValue: 60)
    public static let emojiUpdate = DiscordAuditLogActionType(rawValue: 61)
    public static let emojiDelete = DiscordAuditLogActionType(rawValue: 62)
    
    public static let messageDelete = DiscordAuditLogActionType(rawValue: 72)
    public static let messageBulkDelete = DiscordAuditLogActionType(rawValue: 73)
    public static let messagePin = DiscordAuditLogActionType(rawValue: 74)
    public static let messageUnpin = DiscordAuditLogActionType(rawValue: 75)
    
    public static let integrationCreate = DiscordAuditLogActionType(rawValue: 80)
    public static let integrationUpdate = DiscordAuditLogActionType(rawValue: 81)
    public static let integrationDelete = DiscordAuditLogActionType(rawValue: 82)
    
    public static let stageInstanceCreate = DiscordAuditLogActionType(rawValue: 83)
    public static let stageInstanceUpdate = DiscordAuditLogActionType(rawValue: 84)
    public static let stageInstanceDelete = DiscordAuditLogActionType(rawValue: 85)
    
    public static let stickerCreate = DiscordAuditLogActionType(rawValue: 90)
    public static let stickerUpdate = DiscordAuditLogActionType(rawValue: 91)
    public static let stickerDelete = DiscordAuditLogActionType(rawValue: 92)
    
    public static let guildScheduledEventCreate = DiscordAuditLogActionType(rawValue: 100)
    public static let guildScheduledEventUpdate = DiscordAuditLogActionType(rawValue: 101)
    public static let guildScheduledEventDelete = DiscordAuditLogActionType(rawValue: 102)
    
    public static let threadCreate = DiscordAuditLogActionType(rawValue: 110)
    public static let threadUpdate = DiscordAuditLogActionType(rawValue: 111)
    public static let threadDelete = DiscordAuditLogActionType(rawValue: 112)
    
    public static let applicationCommandPermissionUpdate = DiscordAuditLogActionType(rawValue: 121)
    
    public static let soundboardSoundCreate = DiscordAuditLogActionType(rawValue: 130)
    public static let soundboardSoundUpdate = DiscordAuditLogActionType(rawValue: 131)
    public static let soundboardSoundDelete = DiscordAuditLogActionType(rawValue: 132)
    
    public static let autoModRuleCreate = DiscordAuditLogActionType(rawValue: 140)
    public static let autoModRuleUpdate = DiscordAuditLogActionType(rawValue: 141)
    public static let autoModRuleDelete = DiscordAuditLogActionType(rawValue: 142)
    
    public static let autoModBlockMessage = DiscordAuditLogActionType(rawValue: 143)
    public static let autoModFlagToChannel = DiscordAuditLogActionType(rawValue: 144)
    
    public static let autoModUserCommunicationDisabled = DiscordAuditLogActionType(rawValue: 145)
    
    public static let autoModQuarantineUser = DiscordAuditLogActionType(rawValue: 146)
    
    public static let creatorMonetizationReqCreated = DiscordAuditLogActionType(rawValue: 150)
    public static let creatorMonetizationTermsAccepted = DiscordAuditLogActionType(rawValue: 151)
    
    public static let onboardingPromptCreate = DiscordAuditLogActionType(rawValue: 163)
    public static let onboardingPromptUpdate = DiscordAuditLogActionType(rawValue: 164)
    public static let onboardingPromptDelete = DiscordAuditLogActionType(rawValue: 165)
    
    public static let onboardingCreate = DiscordAuditLogActionType(rawValue: 166)
    public static let onboardingUpdate = DiscordAuditLogActionType(rawValue: 167)
    
    public static let homeSettingsCreate = DiscordAuditLogActionType(rawValue: 190)
    public static let homeSettingsUpdate = DiscordAuditLogActionType(rawValue: 191)
    
    public static let voiceChannelStatusCreate = DiscordAuditLogActionType(rawValue: 192)
    public static let voiceChannelStatusDelete = DiscordAuditLogActionType(rawValue: 193)

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}
