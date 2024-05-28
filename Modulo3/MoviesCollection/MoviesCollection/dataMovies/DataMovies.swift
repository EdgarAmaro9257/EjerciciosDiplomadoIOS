//
//  DataMovies.swift
//  MoviesCollection
//
//  Created by Diplomado on 25/05/24.
//

import Foundation

struct GenreMovies {
    let nameGenre: String
    let movies: [Movies]
}

struct Movies {
    var imageMovie: String
    var nameMovie: String
}

let arrayMovies = [
    GenreMovies(nameGenre: "Acción", movies: [
        Movies(imageMovie: "Indestructibles", nameMovie: "Indestructibles"),
        Movies(imageMovie: "Origen", nameMovie: "El Origen"),
        Movies(imageMovie: "RisePlanetApes", nameMovie: "Rise of the Planet of the Apes"),
        Movies(imageMovie: "GodzillavsKong", nameMovie: "Godzilla vs Kong"),
    ]),
    GenreMovies(nameGenre: "Ciencia Ficción", movies: [
        Movies(imageMovie: "BackFutureII", nameMovie: "Back To The Future II"),
        Movies(imageMovie: "StarWarsIV", nameMovie: "Stars Wars IV: A New Hope"),
        Movies(imageMovie: "JurasicPark", nameMovie: "Jurassic Park"),
        Movies(imageMovie: "MIB", nameMovie: "Hombres de negro (MIB)"),
    ]),
    GenreMovies(nameGenre: "Terror y Suspenso", movies: [
        Movies(imageMovie: "Scream", nameMovie: "Scream"),
        Movies(imageMovie: "SilencioInocentes", nameMovie: "El Silencio de los inocentes"),
        Movies(imageMovie: "Exorcista", nameMovie: "El Exorcista"),
        Movies(imageMovie: "FNAF", nameMovie: "Five Nights at Freddy's: la película"),
    ]),
    
]
