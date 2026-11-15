//
//  DiscordTeamMember.swift
//  swift-discord
//
//  Created by Flaky le Flaker (Mineturtlee) on 27/9/26.
//

public struct DiscordTeamMember: Codable, Hashable {
    public var membershipState: DiscordTeamMembershipState
    public var teamID: Snowflake
    public var user: DiscordUser
    public var role: DiscordTeamRole?
    
    public enum CodingKeys: String, CodingKey {
        case membershipState = "membership_state"
        case teamID = "team_id"
        case user
        case role
    }
}
