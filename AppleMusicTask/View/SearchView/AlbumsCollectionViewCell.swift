//
//  AlbumsCollectionViewCell.swift
//  AppleMusicTask
//
//  Created by Maksim Malofeev on 18/09/2022.
//
import UIKit

class AlbumsCollectionViewCell: UICollectionViewCell {

    static let identifire = "AlbumsCollectionViewCell"

    var imageButton: UIButton = {
        let button = UIButton()
        button.contentMode = .scaleAspectFill
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var lable: UILabel = {
        let lable = UILabel()
        lable.textColor = .white
        lable.numberOfLines = 2
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = .systemBlue
        contentView.addSubview(imageButton)
        contentView.addSubview(lable)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        NSLayoutConstraint.activate([
            imageButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            lable.leadingAnchor.constraint(equalTo: imageButton.leadingAnchor, constant: 10),
            lable.trailingAnchor.constraint(equalTo: imageButton.trailingAnchor, constant: -10),
            lable.bottomAnchor.constraint(equalTo: imageButton.bottomAnchor, constant: -10)
        ])
    }
}

