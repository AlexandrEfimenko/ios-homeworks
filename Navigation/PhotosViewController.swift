//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Александр Ефименко on 19.03.2024.
//

import UIKit

class PhotosViewController: UIViewController {

    fileprivate lazy var photos: [UIImage?] = Photos.getPhotos()

    private let collectionView: UICollectionView = {
         let viewLayout = UICollectionViewFlowLayout()

         let collectionView = UICollectionView(
             frame: .zero,
             collectionViewLayout: viewLayout
         )

         collectionView.translatesAutoresizingMaskIntoConstraints = false
         collectionView.backgroundColor = .systemBackground

         collectionView.register(PhotosCollectionViewCell.self,
                                 forCellWithReuseIdentifier: PhotosCollectionViewCell.cellId
         )

         return collectionView
     }()


    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupSubviews()
        setupConstraints()
    }

    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }



    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "Photo gallery"
    }

    private func setupSubviews() {
        setupCollectionView()
    }


    private func setupCollectionView() {
        view.addSubview(collectionView)

        collectionView.dataSource = self
        collectionView.delegate = self
    }


    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor)
        ])
    }



    private enum LayoutConstant {
        static let spacing: CGFloat = 8.0
        static let itemHeight: CGFloat = 180.0
    }

}


extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
            let itemsInRow: CGFloat = 3

            let totalSpacing: CGFloat = 2 * spacing + (itemsInRow - 1) * spacing
            let finalWidth = (width - totalSpacing) / itemsInRow

            return floor(finalWidth)
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.cellId,
                            for: indexPath) as! PhotosCollectionViewCell

        let photo = photos[indexPath.row]

        cell.updateData(image: photo)

        return cell
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
           sizeForItemAt indexPath: IndexPath) -> CGSize {

           let width = itemWidth(
               for: view.frame.width,
               spacing: LayoutConstant.spacing
           )

           return CGSize(width: width, height: LayoutConstant.itemHeight)
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {

        UIEdgeInsets(
            top: LayoutConstant.spacing,
            left: LayoutConstant.spacing,
            bottom: LayoutConstant.spacing,
            right: LayoutConstant.spacing
        )
    }

    func collectionView(
            _ collectionView: UICollectionView,
            layout collectionViewLayout: UICollectionViewLayout,
            minimumLineSpacingForSectionAt section: Int
        ) -> CGFloat {
            LayoutConstant.spacing
        }


    func collectionView(
           _ collectionView: UICollectionView,
           layout collectionViewLayout: UICollectionViewLayout,
           minimumInteritemSpacingForSectionAt section: Int ) -> CGFloat {

           LayoutConstant.spacing
    }



}
