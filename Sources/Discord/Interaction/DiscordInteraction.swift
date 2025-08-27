import Foundation

/// Represents a slash-command invocation by the user.
public struct DiscordInteraction: Identifiable, Codable, Hashable {
    public enum CodingKeys: String, CodingKey {
        case id
        case type
        case data
        case message
        case guildId = "guild_id"
        case channelId = "channel_id"
        case member
        case token
        case version
    }

    // MARK: Properties

    /// ID of the interaction
    public let id: InteractionID

    /// Type of the interaction
    public let type: DiscordInteractionType?


    /// Command data payload
    /// Always specified for DiscordApplicationCommand interaction
    /// types, but optional for future-proofing.
    public let data: DiscordInteractionData?

    /// The message a user interacted with, e.g. when pressing a button.
    public let message: DiscordMessage?

    /// Guild it was sent from
    public let guildId: GuildID

    /// Channel it was sent from
    public let channelId: ChannelID

    /// Guild member data for the invoking user
    public let member: DiscordGuildMember?

    /// Continuation token for responding to the interaction
    public let token: String

    /// Read-only property, always 1
    public let version: Int
}

public struct DiscordInteractionType: RawRepresentable, Hashable, Codable {
    public var rawValue: Int

    public static let ping = DiscordInteractionType(rawValue: 1)
    public static let applicationCommand = DiscordInteractionType(rawValue: 2)
    public static let messageComponent = DiscordInteractionType(rawValue: 3)

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

public struct DiscordInteractionData: Codable, Hashable {
    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case customId = "custom_id"
        case options
    }

    /// The ID of the invoked command
    public var id: CommandID?

    /// The name of the invoked command
    public var name: String?

    /// A custom (developer-defined) id attached to e.g. a button interaction.
    public var customId: String?

    /// The params + values by the user
    public var options: [DiscordInteractionDataOption]?
}

public struct DiscordInteractionDataOption: Codable, Hashable {
    /// The name of the parameter.
    public var name: String
    
    /// The type of the option (string, int, user, etc.)
    public var type: Int
    
    /// The value provided by the user (if this is not a subcommand).
    public var value: OptionValue?
    
    /// Present if this option is a group or subcommand.
    public var options: [DiscordInteractionDataOption]?
    
    /// Wrapper for different possible value types.
    public enum OptionValue: Codable, Hashable {
        case string(String)
        case int(Int)
        case bool(Bool)
        case double(Double)
        case snowflake(String)
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let s = try? container.decode(String.self) {
                self = .string(s)
            } else if let i = try? container.decode(Int.self) {
                self = .int(i)
            } else if let b = try? container.decode(Bool.self) {
                self = .bool(b)
            } else if let d = try? container.decode(Double.self) {
                self = .double(d)
            } else {
                throw DecodingError.typeMismatch(
                    OptionValue.self,
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unsupported option value type"
                    )
                )
            }
        }
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .string(let s): try container.encode(s)
            case .int(let i): try container.encode(i)
            case .bool(let b): try container.encode(b)
            case .double(let d): try container.encode(d)
            case .snowflake(let id): try container.encode(id)
            }
        }
    }
}
