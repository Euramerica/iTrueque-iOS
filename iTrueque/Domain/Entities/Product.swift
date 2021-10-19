//
//  Product.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 18/10/21.
//

import Foundation


struct Product: Requestable {
    let id:  String
    let userId: String
    let exchangeId: String
    let title: String
    let author: String
    let condition: String
    let createdAt: Date
    let modAt:Date
    let img: String
    
    
    static func latestProducts() -> [Product]{
        
       return [
        Product(id: "1", userId: "1", exchangeId: "1", title: "The hobbit", author: "Tolkien", condition: "nuevo", createdAt: Date(), modAt: Date(), img: "www.google.com"),
        
        Product(id: "2", userId: "2", exchangeId: "2", title: "Codigo Limpio", author: "Bob", condition: "nuevo", createdAt: Date(), modAt: Date(), img: "www.google.com"),
        
        Product(id: "3", userId: "3", exchangeId: "3", title: "Harry Potter", author: "JK", condition: "nuevo", createdAt: Date(), modAt: Date(), img: "www.google.com"),
        
        Product(id: "4", userId: "4", exchangeId: "4", title: "Aprende Cobol", author: "Rodrigo", condition: "nuevo", createdAt: Date(), modAt: Date(), img: "www.google.com"),
       ]
        
        
    }
    
    static func popularProducts() -> [Product]{
        return [
         Product(id: "1", userId: "1", exchangeId: "1", title: "The hobbit", author: "Tolkien", condition: "nuevo", createdAt: Date(), modAt: Date(), img: "www.google.com"),
         
         Product(id: "2", userId: "2", exchangeId: "2", title: "Codigo Limpio", author: "Bob", condition: "nuevo", createdAt: Date(), modAt: Date(), img: "www.google.com"),
         
         Product(id: "3", userId: "3", exchangeId: "3", title: "Harry Potter", author: "JK", condition: "nuevo", createdAt: Date(), modAt: Date(), img: "www.google.com"),
         
         Product(id: "4", userId: "4", exchangeId: "4", title: "Aprende Cobol", author: "Rodrigo", condition: "nuevo", createdAt: Date(), modAt: Date(), img: "www.google.com"),
        ]
    }
}
