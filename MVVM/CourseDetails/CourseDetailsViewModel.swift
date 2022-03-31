//
//  CourseDetailsViewModel.swift
//  MVVM
//
//  Created by Андрей Аверьянов on 18.03.2022.
//

import Foundation

protocol CourseDetailsViewModelProtocol {
    var courseName: String { get }
    init(course: Course)
}

//class CourseDetailsViewModel: CourseDetailsViewModelProtocol {
//    var courseName: String
//    
//    
//}
