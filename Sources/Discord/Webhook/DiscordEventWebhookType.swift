//
//  DiscordEventWebhookTypes.swift
//  swift-discord
//
//  Created by Flaky le Flaker (Mineturtlee) on 27/9/26.
//

public enum DiscordApplicationEventWebhookType: String, Codable, Hashable {
    // authorization
    case applicationAuthorized = "APPLICATION_AUTHORIZED"
    case applicationDeauthorized = "APPLICATION_DEAUTHORIZED"
    
    // entitlement
    case entitlementCreate = "ENTITLEMENT_CREATE"
    case entitlementUpdate = "ENTITLEMENT_UPDATE"
    case entitlementDelete = "ENTITLEMENT_DELETE"
    
    // quest
    case questUserEnrollment = "QUEST_USER_ENROLLMENT"
    
    // lobbies
    case lobbyMessageCreate = "LOBBY_MESSAGE_CREATE"
    case lobbyMessageUpdate = "LOBBY_MESSAGE_UPDATE"
    case lobbyMessageDelete = "LOBBY_MESSAGE_DELETE"
    
    // g(ame)dm
    case gameDirectMessageCreate = "GAME_DIRECT_MESSAGE_CREATE"
    case gameDirectMessageUpdate = "GAME_DIRECT_MESSAGE_UPDATE"
    case gameDirectMessageDelete = "GAME_DIRECT_MESSAGE_DELETE"
}
