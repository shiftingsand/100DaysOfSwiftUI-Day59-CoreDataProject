//
//  FilteredView.swift
//  CoreDataProject
//
//  Created by Chris Wu on 6/1/20.
//  Copyright © 2020 Chris Wu. All rights reserved.
//

import SwiftUI
import CoreData

struct FilteredView: View {
    var fetchRequest:FetchRequest<Singer>
    var body: some View {
        List(fetchRequest.wrappedValue, id:\.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
    
    init(filter: String) {
        fetchRequest = FetchRequest<Singer>(entity: Singer.entity(), sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
    }
}


