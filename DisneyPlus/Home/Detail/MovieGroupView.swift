//
//  MovieGroupView.swift
//  DisneyPlus
//
//  Created by Goutham S on 05/07/22.
//

import SwiftUI

struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct MovieGroupView: View {
    @Environment(\.dismiss) var dismiss
    @State private var _logoOpacity: CGFloat = 0
    @State private var _bgOpacity: CGFloat = 0
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
                    .opacity(Double(_bgOpacity))
                
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
                            .opacity(1 - Double(_logoOpacity))
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
                        .opacity(Double(_logoOpacity))
                    
                    HorizontalList(group: .recommendation)
                    HorizontalList(group: .new)
                    HorizontalList(group: .recommendation)
                    HorizontalList(group: .new)
                    HorizontalList(group: .recommendation)
                    
                    Spacer()
                })
                GeometryReader { geo in
                    let offset = geo.frame(in: .named("scrollView")).maxY
                    Color.clear.preference(key: ScrollViewOffsetPreferenceKey.self, value: offset)
                }
            })
            .coordinateSpace(name: "scrollView")
            .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { offsetValue in
                if ScrollViewOffsetPreferenceKey.defaultValue == 0 {
                    ScrollViewOffsetPreferenceKey.defaultValue = offsetValue
                }
                // approx value to get the fade-in fade-out animation
                let logoHeightToFade: CGFloat = 75
                self._logoOpacity = (logoHeightToFade - max((ScrollViewOffsetPreferenceKey.defaultValue - offsetValue), 0)) / logoHeightToFade
                
                // approx value to get the fade-in fade-out animation
                let bgHeightToFade: CGFloat = 275
                self._bgOpacity = (bgHeightToFade - max((ScrollViewOffsetPreferenceKey.defaultValue - offsetValue), 0)) / bgHeightToFade
            }
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
        .background()
    }
}

struct MovieGroupView_Previews: PreviewProvider {
    static var previews: some View {
        MovieGroupView(movieGroup: .marvel)
    }
}
