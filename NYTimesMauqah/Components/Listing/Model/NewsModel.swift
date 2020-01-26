//
//  NewsModel.swift
//  NYTimesMauqah
//
//  Created by aadilkhaskheli on 25/01/2020.
//  Copyright © 2020 aadilkhaskheli. All rights reserved.
//

import Foundation

// MARK: - Result
struct Results: Codable {
    let status, copyright: String?
    let numResults: Int?
    let results: [News]?
    
    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
}

// MARK: - News
struct News: Codable {
    let url: String?
    let adxKeywords: String?
    let column: String?
    let section, byline: String?
    let type: ResultType?
    let title, abstract, publishedDate: String?
    let source: Source?
    let id, assetID, views: Int?
    let desFacet, orgFacet, perFacet, geoFacet: Facet?
    let media: [Media]?
    
    
    init(title: String? = nil, abstract: String? = nil,media: [Media]? = nil,url: String? = nil,
         adxKeywords: String? = nil,column: String? = nil,section : String? = nil, byline: String? = nil,type: ResultType? = nil, source: Source? = nil,id : Int? = 0, assetID : Int? = 0, views: Int? = 0,desFacet : Facet? = nil, orgFacet : Facet? = nil, perFacet : Facet? = nil, geoFacet: Facet? = nil, publishedDate : String? = nil)
    {
        self.title = title
        self.abstract = abstract
        self.media = media
        
        self.url = url
        self.adxKeywords = adxKeywords
        self.column = column
        self.section = section
        self.byline = byline
        self.type = type
        self.publishedDate = publishedDate
        self.source = source
        self.id = id
        self.assetID = assetID
        self.views = views
        self.desFacet = desFacet
        self.orgFacet = orgFacet
        self.perFacet = perFacet
        self.geoFacet = geoFacet
    }
    enum CodingKeys: String, CodingKey {
        case url
        case adxKeywords = "adx_keywords"
        case column, section, byline, type, title, abstract
        case publishedDate = "published_date"
        case source, id
        case assetID = "asset_id"
        case views
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media
    }
}

enum Facet: Codable {
    case string(String)
    case stringArray([String])
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([String].self) {
            self = .stringArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Facet.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Facet"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .stringArray(let x):
            try container.encode(x)
        }
    }
}

// MARK: - Media
struct Media: Codable {
    let type: MediaType?
    let subtype: Subtype?
    let caption, copyright: String?
    let approvedForSyndication: Int?
    let mediaMetadata: [MediaMetadatum]?
    
    init(type : MediaType? = nil, subType : Subtype? = nil, caption : String? = nil, copyright : String? = nil, approvedForSyndication : Int? = 0, mediaMetadata  : [MediaMetadatum]? = nil) {
        self.type =  type
        self.subtype = subType
        self.caption = caption
        self.copyright = copyright
        self.approvedForSyndication = approvedForSyndication
        self.mediaMetadata = mediaMetadata
    }
    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadatum
struct MediaMetadatum: Codable {
    let url: String?
    let format: Format?
    let height, width: Int?
    
    init(url : String? = nil, format : Format? = nil, height : Int? = 0, width : Int? = 0) {
        self.url = url
        self.format = format
        self.height = height
        self.width = width
    }
}

enum Format: String, Codable {
    case jumbo = "Jumbo"
    case large = "Large"
    case largeThumbnail = "Large Thumbnail"
    case mediumThreeByTwo210 = "mediumThreeByTwo210"
    case mediumThreeByTwo440 = "mediumThreeByTwo440"
    case normal = "Normal"
    case square320 = "square320"
    case square640 = "square640"
    case standardThumbnail = "Standard Thumbnail"
    case superJumbo = "superJumbo"
}

enum Subtype: String, Codable {
    case photo = "photo"
}

enum MediaType: String, Codable {
    case image = "image"
}

enum Source: String, Codable {
    case theNewYorkTimes = "The New York Times"
}

enum ResultType: String, Codable {
    case article = "Article"
    case interactive = "Interactive"
    case image = "image"
}
