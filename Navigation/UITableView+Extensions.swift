//
//  UITableView+Extensions.swift
//  Navigation
//
//  Created by Александр Ефименко on 28.02.2024.
//
import UIKit

extension UITableView {

    // @link https://stackoverflow.com/a/28102175

    func setAndLayout(headerView: UIView) {
        tableHeaderView = headerView
        headerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            headerView.widthAnchor.constraint(equalTo: widthAnchor)
        ])

        headerView.setNeedsLayout()
        headerView.layoutIfNeeded()
        headerView.frame.size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
}
