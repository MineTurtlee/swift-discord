//
//  DiscordApplicationScopes.swift
//  swift-discord
//
//  Created by Flaky le Flaker (Mineturtlee) on 27/9/26.
//

public enum DiscordApplicationScopes: String, Codable, Hashable {
    case readActivities = "activities.read"
    case writeActivities = "activities.write"
    
    case readApplicationBuilds = "applications.builds.read"
    case uploadApplicationsBuilds = "applications.builds.upload"
    
    case applicationsCommands = "applications.commands"
    case updateApplicationsCommands = "applications.commands.update"
    case updateApplicationsCommandsPermissions = "applications.commands.permissions.update"
    
    case applicationsEntitlements = "applications.entitlements"
    
    case updateApplicationsStore = "applications.store.update"
    
    case bot
    case connections
    
    case readDMChannels = "dm_channels.read"
    case email
    case joinGDMs = "gdm.join"
    
    case guilds
    case joinGuilds = "guilds.join"
    case readGuildsMembers = "guilds.members.read"
    
    case identify
    case premiumIdentify = "identify.premium"
    
    case readMessages = "messages.read"
    case readRelationships = "relationships.read"
    
    case writeRoleConnections = "role_connections.write"
    
    case rpc
    case readRPCNotifications = "rpc.notifications.read"
    case readRPCVoice = "rpc.voice.read"
    case writeRPCVoice = "rpc.voice.write"
    case voice
    case incomingWebhook = "webhook.incoming"
}
