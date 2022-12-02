//
//  Todos.swift
//  todosApi
//
//  Created by Mac on 01/12/22.
//

import Foundation


struct Todos : Decodable {
    let userId, id: Int
    let title: String
    let completed: Bool
}
