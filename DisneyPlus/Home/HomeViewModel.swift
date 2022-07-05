//
//  HomeViewModel.swift
//  DisneyPlus
//
//  Created by Goutham S on 05/07/22.
//

import Foundation
import SwiftUI

enum ListGroup {
    case recommendation
    case new
    
    var list: [Image] {
        switch self {
        case .recommendation:
            return HomeViewModel().recommendations
        case .new:
            return HomeViewModel().newPosters
        }
    }
    
    var title: String {
        switch self {
        case .recommendation:
            return "Recommended For You"
        case .new:
            return "New to Disney+"
        }
    }
}

class HomeViewModel: ObservableObject, Identifiable {
    @Published var pageViews = [Image]()
    @Published var newPosters = [Image]()
    @Published var recommendations = [Image]()
    
    init() {
        setupPageViews()
        setupRecommendations()
        setupNewMovies()
    }
    
    private func setupPageViews() {
        pageViews = [
            Image("pg-mandalorian"),
            Image("pg-sorcererApprentice"),
            Image("pg-mulan"),
            Image("pg-animalKingdom"),
        ]
    }
    
    private func setupRecommendations() {
        recommendations = [
            Image("poster-avengers"),
            Image("poster-sorcerer"),
            Image("poster-moana"),
            Image("poster-solo"),
            Image("poster-hocusPocus"),
        ]
    }
    
    private func setupNewMovies() {
        newPosters = [
            Image("poster-mandalorian"),
            Image("poster-snowman"),
            Image("poster-sorcerer"),
            Image("poster-animalKingdom"),
            Image("poster-toyStory"),
        ]
    }
}
