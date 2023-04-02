//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by admin on 02.04.2023..
//

import Foundation
import UIKit
import PureLayout
import MovieAppData

class MovieDetailsViewController: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var imageView: UIImageView!
        
        if let details = MovieUseCase().getDetails(id: 111161) {
            
            print(details)
            
            let imageUrlString = details.imageUrl
            if let imageUrl = URL(string: imageUrlString) {
                DispatchQueue.global().async {
                    if let imageData = try? Data(contentsOf: imageUrl),
                       let image = UIImage(data: imageData) {
                        DispatchQueue.main.async {
                            
                            imageView = UIImageView(image: image)
                            imageView.contentMode = .scaleToFill
                            
                            //imageView.frame.size.height = 327
                            self.view.addSubview(imageView)
                            
                            imageView.autoPinEdge(toSuperviewEdge: .top)
                            imageView.autoPinEdge(toSuperviewEdge: .leading)
                            imageView.autoPinEdge(toSuperviewEdge: .trailing)
                            imageView.autoSetDimension(.height, toSize: self.view.frame.height / 2)
                            
                            let ratingLabel = UILabel()
                            ratingLabel.text = String(details.rating)
                            ratingLabel.textColor = UIColor.white
                            ratingLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
                            self.view.addSubview(ratingLabel)
                            
                            let userScoreLabel = UILabel()
                            userScoreLabel.text = "user score"
                            userScoreLabel.textColor = UIColor.white
                            userScoreLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
                            self.view.addSubview(userScoreLabel)
                            
                            let titleLabel = UILabel()
                            titleLabel.text = details.name
                            titleLabel.textColor = UIColor.white
                            titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
                            titleLabel.numberOfLines = 0
                            self.view.addSubview(titleLabel)
                            
                            let yearLabel = UILabel()
                            yearLabel.text = "(" + String(details.year)  + ")"
                            yearLabel.textColor = UIColor.white
                            yearLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
                            yearLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
                            self.view.addSubview(yearLabel)
                            
                            let releaseDateLabel = UILabel()
                            releaseDateLabel.text = self.formatDate(inputDate: details.releaseDate)
                            releaseDateLabel.textColor = UIColor.white
                            releaseDateLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
                            self.view.addSubview(releaseDateLabel)
                            
                            let categoryLabel = UILabel()
                            categoryLabel.text = self.getCategoryNames(categories: details.categories)
                            categoryLabel.textColor = UIColor.white
                            categoryLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
                            self.view.addSubview(categoryLabel)
                            
                            let durationLabel = UILabel()
                            durationLabel.text = self.formatDuration(minutes: details.duration)
                            durationLabel.textColor = UIColor.white
                            durationLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
                            self.view.addSubview(durationLabel)
                            
                            let favoritesIcon = UIImageView(image: UIImage(named: "favorites.png"))
                            favoritesIcon.frame.size.width = 32
                            favoritesIcon.frame.size.height = 32
                            self.view.addSubview(favoritesIcon)
                            
                            let overviewLabel = UILabel()
                            overviewLabel.text = "Overview"
                            overviewLabel.textColor = UIColor.black
                            overviewLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
                            self.view.addSubview(overviewLabel)
                            
                            let overviewText = UILabel()
                            overviewText.text = details.summary
                            overviewText.textColor = UIColor.black
                            overviewText.font = UIFont.systemFont(ofSize: 14, weight: .regular)
                            overviewText.numberOfLines = 0
                            self.view.addSubview(overviewText)
                            
                            
                            
                            ratingLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 135)
                            ratingLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
                            
                            userScoreLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 134)
                            userScoreLabel.autoPinEdge(.leading, to: .trailing, of: ratingLabel, withOffset: 8)
                            
                            titleLabel.autoPinEdge(.top, to: .bottom, of: ratingLabel, withOffset: 16)
                            titleLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
                            titleLabel.autoPinEdge(.trailing, to: .leading, of: yearLabel, withOffset: 8)
                            
                            yearLabel.autoPinEdge(.top, to: .bottom, of: ratingLabel, withOffset: 16)
                            yearLabel.autoPinEdge(.leading, to: .trailing, of: titleLabel, withOffset: 8)
                            yearLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
                            
                            releaseDateLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 16)
                            releaseDateLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
                            
                            categoryLabel.autoPinEdge(.top, to: .bottom, of: releaseDateLabel)
                            categoryLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
                            
                            durationLabel.autoPinEdge(.top, to: .bottom, of: releaseDateLabel)
                            durationLabel.autoPinEdge(.leading, to: .trailing, of: categoryLabel, withOffset: 8)
                            
                            favoritesIcon.autoPinEdge(.top, to: .bottom, of: categoryLabel, withOffset: 16)
                            favoritesIcon.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
                            
                            overviewLabel.autoPinEdge(.top, to: .bottom, of: imageView, withOffset: 22)
                            overviewLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
                            
                            overviewText.autoPinEdge(.top, to: .bottom, of: overviewLabel, withOffset: 16)
                            overviewText.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
                            overviewText.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
                            
                            let container = UIView()
                            self.view.addSubview(container)
                            //container.autoPinEdgesToSuperviewEdges()
                            container.autoPinEdge(.top, to: .bottom, of: overviewText, withOffset: 28)
                            container.autoPinEdge(toSuperviewEdge: .leading)
                            container.autoPinEdge(toSuperviewEdge: .trailing)

                            let column1 = UIView()
                            container.addSubview(column1)

                            let column2 = UIView()
                            container.addSubview(column2)

                            let column3 = UIView()
                            container.addSubview(column3)

                            column1.autoPinEdge(toSuperviewEdge: .leading)
                            column1.autoMatch(.width, to: .width, of: container, withMultiplier: 0.33)
                            column1.autoPinEdge(toSuperviewEdge: .top)
                            column1.autoPinEdge(toSuperviewEdge: .bottom)

                            column2.autoPinEdge(.leading, to: .trailing, of: column1)
                            column2.autoMatch(.width, to: .width, of: column1)
                            column2.autoPinEdge(toSuperviewEdge: .top)
                            column2.autoPinEdge(toSuperviewEdge: .bottom)

                            column3.autoPinEdge(.leading, to: .trailing, of: column2)
                            column3.autoMatch(.width, to: .width, of: column1)
                            column3.autoPinEdge(toSuperviewEdge: .top)
                            column3.autoPinEdge(toSuperviewEdge: .bottom)

                   
                            for (index, crewMember) in details.crewMembers.enumerated() {
                                let item = UIView()
                                
                                let crewLabel = UILabel()
                                crewLabel.text = crewMember.name
                                crewLabel.textColor = UIColor.black
                                crewLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
                                item.addSubview(crewLabel)
                                
                                let roleLabel = UILabel()
                                roleLabel.text = crewMember.role
                                roleLabel.textColor = UIColor.black
                                roleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
                                item.addSubview(roleLabel)
                                
                                crewLabel.autoPinEdge(toSuperviewEdge: .top)
                                crewLabel.autoAlignAxis(toSuperviewAxis: .vertical)
                                roleLabel.autoPinEdge(.top, to: .bottom, of: crewLabel, withOffset: 8)
                                roleLabel.autoAlignAxis(toSuperviewAxis: .vertical)
                                
                                
                                switch (index % 3) {
                                case 1:
                                    column2.addSubview(item)
                                    item.autoPinEdge(toSuperviewEdge: .leading)
                                    print("1 " + details.crewMembers[index].name)
                                case 2:
                                    column3.addSubview(item)
                                    item.autoPinEdge(toSuperviewEdge: .leading)
                                    print("2 " + details.crewMembers[index].name)
                                case 0:
                                    column1.addSubview(item)
                                    item.autoPinEdge(toSuperviewEdge: .leading)
                                    print("0 " + details.crewMembers[index].name)
                                default:
                                    break // or handle the default case if necessary
                                }
                                
                                item.autoPinEdge(toSuperviewEdge: .trailing)
                                item.autoPinEdge(toSuperviewEdge: .top, withInset: CGFloat((64 * (index/3))))
                                item.autoPinEdge(toSuperviewEdge: .bottom, withInset: 16)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func getCategoryNames(categories: [MovieCategoryModel]) -> String {
        return categories.map { category -> String in
            switch category {
            case .action: return "Action"
            case .adventure: return "Adventure"
            case .comedy: return "Comedy"
            case .crime: return "Crime"
            case .drama: return "Drama"
            case .fantasy: return "Fantasy"
            case .romance: return "Romance"
            case .scienceFiction: return "Science Fiction"
            case .thriller: return "Thriller"
            case .western: return "Western"
            }
        }.joined(separator: ", ")
    }
    
    func formatDuration(minutes: Int) -> String {
        let hours = minutes / 60
        let remainingMinutes = minutes % 60
        return "\(hours)h \(remainingMinutes)m"
    }
    
    func formatDate(inputDate: String) -> String? {
        let dateFormatterInput = DateFormatter()
        dateFormatterInput.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatterInput.date(from: inputDate) {
            let dateFormatterOutput = DateFormatter()
            dateFormatterOutput.dateFormat = "dd/MM/yyyy"
            return dateFormatterOutput.string(from: date)
        }
        return nil
    }
}
