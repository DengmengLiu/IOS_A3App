//
//  MovieService.swift
//  IOS_A3App
//
//  Created by shihao lin on 23/5/2023.
//

import Foundation
import SwiftUI
import Combine

class MovieService: ObservableObject {
    @Published var movies: [Movie] = []
    
    @MainActor
    func fetchMovies() async {
        do {
            let headers = [
                "accept": "application/json",
                          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyYzc2ZDE3OGQzZGZmMzY2OTkxOWZkZGU2NzkyZjdhYyIsInN1YiI6IjY0NWYxMGEyZWY4YjMyMDBlM2FjYWYxZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cmI9cbqIaSIYy7VlnPqpfIYKIAGYYCYuydFW-42W0jM"
            ]

            let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1")!
            var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers
            
            let (data, _) = try await URLSession.shared.data(for: request)
            let moviesResponse = try JSONDecoder().decode(MoviesResponse.self, from: data)
            movies = moviesResponse.results
        } catch {
            print("Error: \(error)")
        }
    }
}
