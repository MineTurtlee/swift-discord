//
//  DiscordApplicationEventWebhookStatus.swift
//  swift-discord
//
//  Created by Flaky le Flaker (Mineturtlee) on 27/9/26.
//

public enum DiscordApplicationEventWebhookStatus: Int, Codable, Hashable {
    case disabled = 1
    case enabled = 2
    case disabledByDiscord = 3
}
