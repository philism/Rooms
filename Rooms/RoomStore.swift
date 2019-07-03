//
//  RoomStore.swift
//  Rooms
//
//  Created by Philip Smith on 6/29/19.
//  Copyright © 2019 Philip Smith. All rights reserved.
//

import SwiftUI
import Combine

class RoomStore : BindableObject {
    var rooms: [Room] {
        didSet { didChange.send() }
    }
    
    init( rooms: [Room] = [] ) {
        self.rooms = rooms
    }
    
    var didChange = PassthroughSubject<Void, Never>()
}
