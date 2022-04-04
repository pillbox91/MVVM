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
    
    var viewModel: CourseDetailsViewModelProtocol!
    
    private var isFavorite = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func toggleFavorite(_ sender: UIButton) {
        viewModel.changeFavoriteStatus()
        setImageForFavoriteButton()
    }
    
    private func setupUI() {
        viewModel.viewModelDidChange = { [unowned self] viewModel in
            self.isFavorite = viewModel.isFavorite
        }
        
        viewModel.setFavoriteStatus()
        isFavorite = viewModel.isFavorite
        
        setImageForFavoriteButton()
        courseNameLabel.text = viewModel.courseName
        numberOfLessonsLabel.text = viewModel.numberOfLessons
        numberOfTestsLabel.text = viewModel.numberOfTests
        
        guard let imageData = viewModel.imageData else {return}
        courseImage.image = UIImage(data: imageData)
    }

    private func setImageForFavoriteButton() {
        favoriteButton.tintColor = isFavorite ? .red : .gray
    }
}
