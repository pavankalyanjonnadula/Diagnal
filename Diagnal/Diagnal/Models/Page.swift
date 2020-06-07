//
//  Page.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on June 06, 2020
//
import Foundation

struct Page: Codable {

	let title: String
	let total_content_items: String
	let page_num: String
	let page_size: String
	let content_items: Content_items

	private enum CodingKeys: String, CodingKey {
		case title = "title"
		case total_content_items = "total-content-items"
		case page_num = "page-num"
		case page_size = "page-size"
		case content_items = "content-items"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		title = try values.decode(String.self, forKey: .title)
		total_content_items = try values.decode(String.self, forKey: .total_content_items)
		page_num = try values.decode(String.self, forKey: .page_num)
		page_size = try values.decode(String.self, forKey: .page_size)
		content_items = try values.decode(Content_items.self, forKey: .content_items)
	}

}
