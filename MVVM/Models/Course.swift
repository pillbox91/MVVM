//
//  Course.swift
//  MVVM
//
//  Created by Андрей Аверьянов on 21.03.2022.
//

struct Course: Decodable {
    let name: String?
    let imageUrl: String?
    let numberOfLessons: Int?
    let numberOfTests: Int?
}
