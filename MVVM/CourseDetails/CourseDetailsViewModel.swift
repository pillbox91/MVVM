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
    var isFavorite: Bool { get }
    var viewModelDidChange: ((CourseDetailsViewModelProtocol) -> Void)? { get set }
    init(course: Course)
    func setFavoriteStatus()
    func changeFavoriteStatus()
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
        ImageManager.shared.getImage(from: course.imageUrl)
    }
    
    var viewModelDidChange: ((CourseDetailsViewModelProtocol) -> Void)?
    
    
    var isFavorite: Bool {
        didSet {
            viewModelDidChange?(self)
        }
    }
    
    private let course: Course
    
    required init(course: Course) {
        self.course = course
        isFavorite = false
    }
    
    func setFavoriteStatus() {
        isFavorite = DataManager.shared.loadFavoriteStatus(for: course.name ?? "")
    }
    
    func changeFavoriteStatus() {
        isFavorite.toggle()
        DataManager.shared.saveFavoriteStatus(for: course.name ?? "", with: isFavorite)
    }
}
