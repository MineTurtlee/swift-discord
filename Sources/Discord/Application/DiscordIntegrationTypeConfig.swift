//
//  DiscordIntegrationTypeConfig.swift
//  swift-discord
//
//  Created by Flaky le Flaker (Mineturtlee) on 9/10/26.
//

public struct DiscordIntegrationTypeConfiguration: Codable, Hashable {
    let oauth2InstallParams: DiscordApplicationInstallParams?

    enum CodingKeys: String, CodingKey {
        case oauth2InstallParams = "oauth2_install_params"
    }
}
