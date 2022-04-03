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
}

class CourseListViewModel: CourseListViewModelProtocol {
    var courses: [Course] = []
    
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
}
