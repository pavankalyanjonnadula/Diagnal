//
//  Movies.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on June 06, 2020
//
import Foundation

struct Movies: Codable {

	let page: Page

	private enum CodingKeys: String, CodingKey {
		case page = "page"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		page = try values.decode(Page.self, forKey: .page)
	}

}