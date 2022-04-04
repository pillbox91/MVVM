//
//  CourseListViewModel.swift
//  MVVM
//
//  Created by Андрей Аверьянов on 02.04.2022.
//

import Foundation

protocol CourseListViewModelProtocol {
    var courses: [Course] {get}
    func fetchCourses(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> CourseTableViewCellViewModelProtocol?
    func selectRow(at indexPath: IndexPath)
    func viewModelForSelectedRow() -> CourseDetailsViewModelProtocol?
}

class CourseListViewModel: CourseListViewModelProtocol {
    var courses: [Course] = []
    
    private var indexPath: IndexPath?
    
    func fetchCourses(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchData { courses in
            self.courses = courses
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func numberOfRows() -> Int {
        courses.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> CourseTableViewCellViewModelProtocol? {
        let course = courses[indexPath.row]
        return CourseTableViewCellViewModel(course: course)
    }
    
    func selectRow(at indexPath: IndexPath) {
        self.indexPath = indexPath
    }
    
    func viewModelForSelectedRow() -> CourseDetailsViewModelProtocol? {
        guard let indexPath = indexPath else {return nil}
        let course = courses[indexPath.row]
        return CourseDetailsViewModel(course: course)
    }
}
