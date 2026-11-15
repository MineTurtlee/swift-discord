//
//  DiscordApplicationInstallParams.swift
//  swift-discord
//
//  Created by Flaky le Flaker (Mineturtlee) on 27/9/26.
//

public struct DiscordApplicationInstallParams: Codable, Hashable {
    public let scopes: [DiscordApplicationScopes]
    public let permissions: DiscordPermissions
}
