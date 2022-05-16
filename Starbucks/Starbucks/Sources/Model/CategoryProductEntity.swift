//
//  CategoryProductEntity.swift
//  Starbucks
//
//  Created by YEONGJIN JANG on 2022/05/16.
//

import Foundation

struct CategoryProductEntity: Decodable {
    let products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case products = "list"
    }
}

// MARK: - Product
struct Product: Decodable {
    let productCode, productName, filePath: String
    let imgUploadPath: URL

    enum CodingKeys: String, CodingKey {
        case productCode = "product_CD"
        case productName = "product_NM"
        case filePath = "file_PATH"
        case imgUploadPath = "img_UPLOAD_PATH"
    }
}