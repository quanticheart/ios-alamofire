//
//  ContentView.swift
//  alamofire
//
//  Created by Jonn Alves on 11/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        List(viewModel.chats, id: \.id) { chat in
            HStack {
                // you can show image here by importing SDWebImageSwiftUI
                VStack(alignment: .leading) {
                    Text(chat.name)
                        .foregroundColor(.white)
                        .font(.custom("Avenir", size: 16))
                        .fontWeight(.heavy)
                    
                    if chat.character != nil {
                        HStack {
                            Text(chat.gameSeries)
                                .foregroundColor(.white)
                                .font(.custom("Avenir", size: 14))
                                .lineLimit(1)
                            
                            Text(chat.release.au ?? "--")
                                .foregroundColor(.white)
                                .font(.custom("Avenir", size: 14))
                        }
                        
                    }
                    
                }.padding(.horizontal)
                Spacer()
            }.padding(.vertical, 8)
                .padding(.horizontal)
                .background(Color(UIColor(red: 83/255, green: 90/255, blue: 97/255, alpha: 1)))
        }.onAppear {
            viewModel.getChatList()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
