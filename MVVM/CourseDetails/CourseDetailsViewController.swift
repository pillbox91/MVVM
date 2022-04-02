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
        }
    }
    
    private var isFavorite = false

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CourseDetailsViewModel(course: course)
        loadFavoriteStatus()
        setupUI()
    }
    
    
    @IBAction func toggleFavorite(_ sender: UIButton) {
        isFavorite.toggle()
        setImageForFavoriteButton()
        DataManager.shared.saveFavoriteStatus(for: course.name ?? "", with: isFavorite)
    }
    
    private func setupUI() {
        guard let stringURL = course.imageUrl else {return}
        guard let imageURL = URL(string: stringURL) else {return}
        guard let imageData = try? Data(contentsOf: imageURL) else {return}
        courseImage.image = UIImage(data: imageData)
        
        setImageForFavoriteButton()
    }

    private func setImageForFavoriteButton() {
        favoriteButton.tintColor = isFavorite ? .red : .gray
    }
    
    private func loadFavoriteStatus() {
        isFavorite = DataManager.shared.loadFavoriteStatus(for: course.name ?? "")
    }
}
