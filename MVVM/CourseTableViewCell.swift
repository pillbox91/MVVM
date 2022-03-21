//
//  CourseTableViewCell.swift
//  MVVM
//
//  Created by Андрей Аверьянов on 21.03.2022.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    func configure(with course: Course) {
        textLabel?.text = course.name
        textLabel?.numberOfLines = 2
        guard let stringURL = course.imageUrl else {return}
        guard let imageURL = URL(string: stringURL) else {return}
        guard let imageData = try? Data(contentsOf: imageURL) else {return}
        imageView?.image = UIImage(data: imageData)
    }
}
