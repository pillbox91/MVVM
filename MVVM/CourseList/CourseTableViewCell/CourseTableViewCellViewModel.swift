//
//  CourseTableViewCellViewModel.swift
//  MVVM
//
//  Created by Андрей Аверьянов on 04.04.2022.
//

import Foundation

protocol CourseTableViewCellViewModelProtocol {
    var courseName: String {get}
    var imageData: Data? {get}
    init(course: Course)
}

class CourseTableViewCellViewModel: CourseTableViewCellViewModelProtocol {
    var courseName: String {
        course.name ?? ""
    }
    
    var imageData: Data? {
        ImageManager.shared.getImage(from: course.imageUrl)
    }
    
    private let course: Course
    
    required init(course: Course) {
        self.course = course
    }
}
