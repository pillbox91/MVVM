//
//  CourseDetailsViewController.swift
//  MVVM
//
//  Created by Андрей Аверьянов on 18.03.2022.
//

import UIKit

class CourseDetailsViewController: UIViewController {
    
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var numberOfLessonsLabel: UILabel!
    @IBOutlet weak var numberOfTestsLabel: UILabel!
    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var course: Course!
    var viewModel: CourseDetailsViewModelProtocol! {
        didSet {
            self.courseNameLabel.text = viewModel.courseName
            self.numberOfLessonsLabel.text = viewModel.numberOfLessons
            self.numberOfTestsLabel.text = viewModel.numberOfTests
            
            guard let imageData = viewModel.imageData else {return}
            courseImage.image = UIImage(data: imageData)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CourseDetailsViewModel(course: course)
        setupUI()
    }
    
    @IBAction func toggleFavorite(_ sender: UIButton) {
        viewModel.isFavorite.toggle()
        setImageForFavoriteButton()
    }
    
    private func setupUI() {
        setImageForFavoriteButton()
    }

    private func setImageForFavoriteButton() {
        favoriteButton.tintColor = viewModel.isFavorite ? .red : .gray
    }
}
