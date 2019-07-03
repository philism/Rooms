//
//  ContentView.swift
//  Rooms
//
//  Created by Philip Smith on 6/29/19.
//  Copyright © 2019 Philip Smith. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @ObjectBinding var store = RoomStore()
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button(action: addRoom) {
                        Text("Add Room")
                    }
                }
                
                Section {
                    ForEach(store.rooms) { room in
                        RoomCell(room: room)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
            }
            .navigationBarTitle(Text("Rooms"))
            .navigationBarItems(trailing: EditButton())
            .listStyle(.grouped)
        }
    }
    
    func addRoom() {
        store.rooms.append(Room(name: "Hall 2", capacity: 2000))
    }
    
    func delete(at offsets: IndexSet) {
        if let first = offsets.first {
            store.rooms.remove(at: first)
        }
        
    }
    
    func move(from source: IndexSet, to destination: Int) {
        //store.rooms.move(fromOffsets: source, toOffset: destination)
        
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
           ContentView(store: RoomStore(rooms: testData))
        
           ContentView(store: RoomStore(rooms: testData))
            .environment(\.sizeCategory, .extraExtraLarge)
            
           ContentView(store: RoomStore(rooms: testData))
            .environment(\.colorScheme, .dark)
            
           /*ContentView(store: RoomStore(rooms: testData))
            .environment(\.layoutDirection, .rightToLeft)
            .environment(\.locale, Locale(identifier: "ar"))*/
        }
        
    }
}
#endif

struct RoomCell : View {
    let room: Room
    var body: some View {
        return NavigationButton(destination: RoomDetail(room:room)) {
            Image(room.thumbnailName)
                .cornerRadius(16)
            
                VStack(alignment: .leading) {
                    Text(room.name)
                    Text("\(room.capacity) people")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
