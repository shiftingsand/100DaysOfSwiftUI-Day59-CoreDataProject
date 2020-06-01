//
//  FilteredView.swift
//  CoreDataProject
//
//  Created by Chris Wu on 6/1/20.
//  Copyright © 2020 Chris Wu. All rights reserved.
//

import SwiftUI
import CoreData

struct FilteredView<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var singers: FetchedResults<T> { fetchRequest.wrappedValue }
    var howToSort : [NSSortDescriptor]

    // this is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content

    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            self.content(singer)
        }
    }

    init(filterKey: String, filterValue: String, howToSort : [NSSortDescriptor], @ViewBuilder content: @escaping (T) -> Content) {
        self.howToSort = howToSort
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: howToSort, predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
}

//struct FilteredView: View {
//    var fetchRequest:FetchRequest<Singer>
//    var body: some View {
//        List(fetchRequest.wrappedValue, id:\.self) { singer in
//            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
//        }
//    }
//
//    init(filter: String) {
//        fetchRequest = FetchRequest<Singer>(entity: Singer.entity(), sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
//    }
//}


