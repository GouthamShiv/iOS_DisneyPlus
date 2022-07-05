//
//  MovieGroupView.swift
//  DisneyPlus
//
//  Created by Goutham S on 05/07/22.
//

import SwiftUI

struct MovieGroupView: View {
    @Environment(\.dismiss) var dismiss
    var movieGroup: MovieGroup
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("bg-\(movieGroup.rawValue)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]),
                                         startPoint: .top,
                                         endPoint: .bottom))
                    .frame(height: 50)
                    .offset(y: -55)
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)
            
            Text("")
                .toolbar() {
                    ToolbarItem(placement: .principal) {
                        Image("logo-\(movieGroup.rawValue)")
                            .resizable()
                            .aspectRatio(2.8, contentMode: .fit)
                            .frame(height: 25)
                    }
                }
            
            ScrollView(showsIndicators: false, content: {
                VStack(alignment: .center, spacing: 10, content: {
                    Image("logo-\(movieGroup.rawValue)")
                        .resizable()
                        .aspectRatio(2.8, contentMode: .fit)
                        .frame(height: 75)
                        .padding(.top, 130)
                        .padding(.bottom, 20)
                    
                    HorizontalList(group: .recommendation)
                    HorizontalList(group: .new)
                    HorizontalList(group: .recommendation)
                    HorizontalList(group: .new)
                    HorizontalList(group: .recommendation)
                    
                    Spacer()
                })
            })
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading, content: {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "arrowtriangle.backward.circle.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20)
                })
            })
        }
    }
}

struct MovieGroupView_Previews: PreviewProvider {
    static var previews: some View {
        MovieGroupView(movieGroup: .marvel)
    }
}
