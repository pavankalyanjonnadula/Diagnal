//
//  Content-items.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on June 06, 2020
//
import Foundation

struct Content_items: Codable {

	let content: [Content]

	private enum CodingKeys: String, CodingKey {
		case content = "content"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		content = try values.decode([Content].self, forKey: .content)
	}

}
