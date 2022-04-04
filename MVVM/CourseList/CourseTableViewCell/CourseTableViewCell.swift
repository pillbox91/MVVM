//
//  CourseTableViewCell.swift
//  MVVM
//
//  Created by Андрей Аверьянов on 21.03.2022.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    var viewModel: CourseTableViewCellViewModelProtocol! {
        didSet {
            textLabel?.text = viewModel.courseName
            guard let imageData = viewModel.imageData else {return}
            imageView?.image = UIImage(data: imageData)
        }
    }
}
