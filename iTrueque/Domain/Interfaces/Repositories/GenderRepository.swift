//
//  GenderRepository.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 18/10/21.
//

import Foundation
import Combine
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift


final class GenderRepository{
    
//    let path = "genre"
//    private let store = Firestore.firestore()
//
//    func getGenres() -> [Genre]{
//
//        var genres: [Genre] = []
//
//        store.collection(path)
//            .addSnapshotListener { query, error in
//                if let error = error{
//                  print("Error getting genres: \(error.localizedDescription)")
//                  return
//                }
//
//                let genresDoc = query?.documents.compactMap{ document in
//                    try? document.data(as: Genre.self)
//                }
//
//                genres = genresDoc ?? []
//
//            }
//
//        return genres
//
//    }
    
}
