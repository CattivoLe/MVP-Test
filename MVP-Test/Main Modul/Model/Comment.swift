//
//  Comment.swift
//  MVP-Test
//
//  Created by Александр Омельчук on 20.04.2020.
//  Copyright © 2020 Александр Омельчук. All rights reserved.
//

import Foundation

struct Comment: Decodable {
    
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
    
}
