//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Chris Wu on 5/30/20.
//  Copyright © 2020 Chris Wu. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
    // day 59 - challenge 1
    let howToSort : [NSSortDescriptor] = [
        NSSortDescriptor(keyPath: \Singer.lastName, ascending: false),
        NSSortDescriptor(keyPath: \Singer.firstName, ascending: false)
    ]
    @State private var whatPredicate = MyPredicates.beginsWith
    
    var body: some View {
        VStack {
            //FilteredView(filter: lastNameFilter)
            FilteredView(filterKey: "lastName", filterValue: lastNameFilter, howToSort: howToSort, whatPredicate: whatPredicate) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }

            Button("Add Examples") {
                let taylor = Singer(context: self.moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let taylor2 = Singer(context: self.moc)
                             taylor2.firstName = "Mary"
                             taylor2.lastName = "Swift"

                let ed = Singer(context: self.moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"

                let adele = Singer(context: self.moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"

                try? self.moc.save()
            }

            Button("Show A") {
                self.lastNameFilter = "A"
            }

            Button("Show S") {
                if self.whatPredicate == MyPredicates.beginsWith {
                    self.lastNameFilter = "S"
                } else {
                    self.lastNameFilter = "wif"
                }
            }
            
            // day 59 - challenge 3
            Button("Switch") {
                if self.whatPredicate == .beginsWith {
                    self.whatPredicate = .contains
                } else {
                    self.whatPredicate = .beginsWith
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
