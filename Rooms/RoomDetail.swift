//
//  RoomDetail.swift
//  Rooms
//
//  Created by Philip Smith on 6/29/19.
//  Copyright © 2019 Philip Smith. All rights reserved.
//

import SwiftUI

struct RoomDetail : View {
    let room: Room
    @State private var zoomed = false
    
    var body: some View {
        ZStack(alignment: Alignment.topLeading) {
            Image(room.imageName)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .navigationBarTitle(Text(room.name), displayMode: .inline)
                .tapAction {
                    withAnimation(.basic(duration: 2))
                        { self.zoomed.toggle() }
                }
                .frame(minWidth: 0, idealWidth: 300, maxWidth: CGFloat.infinity, minHeight: 0, idealHeight: 200, maxHeight: CGFloat.infinity, alignment: .center)
            if room.hasVideo && !zoomed {
                Image(systemName: "video.fill")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding(.all)
                    .transition(.move(edge: .leading))
            }
        }
    }
}

#if DEBUG
struct RoomDetail_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {RoomDetail(room: testData[0])}
            NavigationView {RoomDetail(room: testData[1])}
        }
    }
}
#endif
