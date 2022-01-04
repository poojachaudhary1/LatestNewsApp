//
//  SourcesPresentation.swift
//  LatestNews
//
//  Created by Pooja on 2/1/22.
//

import Foundation
import RxDataSources

final class SourcesPresentation {
    let sourceId, name: String
    let url: String
    let category: SourceCategories
    
    init(sourceId: String, name: String, url: String, category: SourceCategories) {
        self.sourceId = sourceId
        self.name = name
        self.url = url
        self.category = category
    }
    convenience init(sources: Sources) {
        self.init(sourceId: sources.sourceId, name: sources.name, url: sources.url, category: sources.category)
    }
}

extension SourcesPresentation: Equatable {
    static func == (lhs: SourcesPresentation, rhs: SourcesPresentation) -> Bool {
        return lhs.category == rhs.category && lhs.name == rhs.name && lhs.sourceId == rhs.sourceId && lhs.url == rhs.url
    }
    
    
}
struct SourcesPresentationSection {
    var header: String
    var items: [SourcesPresentation]
}
extension SourcesPresentationSection: SectionModelType {
    init(original: SourcesPresentationSection, items: [SourcesPresentation]) {
        self = original
        self.items = items
    }
}
