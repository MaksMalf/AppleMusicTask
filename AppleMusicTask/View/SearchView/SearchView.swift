//
//  SearchViewUIKit.swift
//  AppleMusicTask
//
//  Created by Maksim Malofeev on 18/09/2022.
//

import UIKit
import SwiftUI

final class AlbumViewController: UIHostingController<AlbumView> {

    init() {
        super.init(rootView: AlbumView())
    }

    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SearchView: UIViewController, UICollectionViewDelegate {

    var model = Station().createModel()
    var filterModel = [Station]()
    var albumVC: AlbumViewController?

    private lazy var searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.placeholder = Strings.searchBarText
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()

    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width / 2 - 16,
                                 height: UIScreen.main.bounds.size.width / 2 - 20)

        let collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        collectionView.register(AlbumsCollectionViewCell.self,
                                forCellWithReuseIdentifier: AlbumsCollectionViewCell.identifire)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        searchBar.delegate = self
        filterModel = model
        setupCollectionView()
        setupHierarchy()
        setupConstrains()
    }

    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    private func setupHierarchy() {
        view.addSubview(searchBar)
        view.addSubview(collectionView)
    }

    private func setupConstrains() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),

            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension SearchView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterModel.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumsCollectionViewCell.identifire,
                                                      for: indexPath) as! AlbumsCollectionViewCell

        cell.imageButton.setBackgroundImage(UIImage(named: filterModel[indexPath.row].imageName), for: .normal)
        cell.imageButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        cell.lable.text = filterModel[indexPath.row].text
        return cell
    }

    @objc func buttonTapped() {
        navigationController?.pushViewController(AlbumViewController(), animated: true)
    }
}

extension SearchView {
    enum Strings {
        static let searchBarText = "Ваша медиатека"
    }
}

extension SearchView: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""

        searchBar.endEditing(true)
        filterModel = model
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterModel = searchText.isEmpty ? model : model.filter {
            $0.text.localizedCaseInsensitiveContains(searchText)
        }
        collectionView.reloadData()
    }
}
