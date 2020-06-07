//
//  Content.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on June 06, 2020
//
import Foundation

struct Content: Codable {

	let name: String
	let poster_image: String

	private enum CodingKeys: String, CodingKey {
		case name = "name"
		case poster_image = "poster-image"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decode(String.self, forKey: .name)
		poster_image = try values.decode(String.self, forKey: .poster_image)
	}

}
