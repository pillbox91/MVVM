//
//  CourseDetailsViewModel.swift
//  MVVM
//
//  Created by Андрей Аверьянов on 18.03.2022.
//

import Foundation

protocol CourseDetailsViewModelProtocol {
    var courseName: String { get }
    var numberOfLessons: String { get }
    var numberOfTests: String { get }
    var imageData: Data? { get }
    init(course: Course)
}

class CourseDetailsViewModel: CourseDetailsViewModelProtocol {
    var courseName: String {
        course.name ?? ""
    }
    
    var numberOfLessons: String {
        "Number of lessons: \(course.numberOfLessons ?? 0)"
    }
    
    var numberOfTests: String {
        "Number of tests: \(course.numberOfTests ?? 0)"
    }
    
    var imageData: Data? {
        getImage()
    }
    
    private let course: Course
    
    required init(course: Course) {
        self.course = course
    }
    
    private func getImage() -> Data? {
        guard let stringURL = course.imageUrl else {return nil}
        guard let imageURL = URL(string: stringURL) else {return nil}
        guard let imageData = try? Data(contentsOf: imageURL) else {return nil}
        return imageData
    }
}
