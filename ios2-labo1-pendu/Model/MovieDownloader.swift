//
//  MovieDownloader.swift
//  ios2-labo1-pendu
//
//  Created by Simon Turcotte (2395412) et Mathieu Hatin (2296939)
//  API KeY : 691c8ed9
    
import Foundation

struct Movie: Codable {
    var imdbID: String
    var Title: String
    var Year: String
    var Rated: String
    var Released: String
    var Genre: String
    var Director : String
    var Actors: String
    
}

class MovieDownloader {
    static let shared = MovieDownloader()
    private init() {}

    func fetchRandomMovie(completion: @escaping (Result<Movie, Error>) -> Void) {
        let apiKey = "691c8ed9"

        if let randomTitleID = listeFilms.randomElement() {
            let urlString = "https://www.omdbapi.com/?apikey=\(apiKey)&i=\(randomTitleID)"

            if let url = URL(string: urlString) {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let error = error {
                        completion(.failure(error))
                        return
                    }

                    if let data = data {
                        do {
                            let decoder = JSONDecoder()
                            let movie = try decoder.decode(Movie.self, from: data)
                            self.printMovieInfo(movie) // Print movie details to console
                            completion(.success(movie))
                        } catch {
                            completion(.failure(error))
                        }
                    }
                }.resume()
            }
        } else {
            let error = NSError(domain: "MovieDownloader", code: -1, userInfo: [NSLocalizedDescriptionKey: "No movie title IDs available"])
            completion(.failure(error))
        }
    }

    private func printMovieInfo(_ movie: Movie) {
        print("Movie Title: \(movie.Title)")
        print("Year: \(movie.Year)")        
        print("Rated: \(movie.Rated)")
        print("Released: \(movie.Released)")
        print("Genre: \(movie.Genre)")
        print("Director: \(movie.Director)")
        print("Actors: \(movie.Actors)")
    }
}
