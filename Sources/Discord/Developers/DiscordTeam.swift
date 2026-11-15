//
//  DiscordTeam.swift
//  swift-discord
//
//  Created by Flaky le Flaker (Mineturtlee) on 27/9/26.
//

public struct DiscordTeam: Codable, Hashable {
    public let icon: String?
    public let id: String
    public let members: [DiscordTeamMember]
    public let name: String
    public let ownerUserID: Snowflake
    
    public enum CodingKeys: String, CodingKey {
        case icon
        case id
        case members
        case name
        case ownerUserID = "owner_user_id"
    }
}
