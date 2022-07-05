//
//  HomeView.swift
//  DisneyPlus
//
//  Created by Goutham S on 05/07/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var homeVM: HomeViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [Color.black, Color.darkGrey.opacity(0.9)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing))
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .center, spacing: 10) {
                        Image("logo")
                            .resizable()
                            .frame(width: 75, height: 40)
                            .aspectRatio(2, contentMode: .fit)
                        
                        MovieCarouselView(pageViews: homeVM.pageViews)
                        
                        ButtonGroupView()
                            .padding(.top, -15)
                            .padding(.bottom, 15)
                        
                        HorizontalList(group: .recommendation)
                        HorizontalList(group: .new)
                        
                        Spacer()
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environment(\.colorScheme, .light)
            .environmentObject(HomeViewModel())
        HomeView()
            .environment(\.colorScheme, .dark)
            .environmentObject(HomeViewModel())
    }
}
