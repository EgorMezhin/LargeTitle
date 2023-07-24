//
//  ViewController.swift
//  LargeTitle
//
//  Created by Egor Mezhin on 22.07.2023.
//

import UIKit

class ViewController: UIViewController {

    private struct Constants {
        static let ImageSizeForLargeState: CGFloat = 36
        static let ImageRightMargin: CGFloat = 16
        static let ImageBottomMarginForLargeState: CGFloat = 12
        static let contentHeight: CGFloat = 2000
        static let image = UIImage(systemName: "person.crop.circle.fill")
        static let title = "Large Title"
        static let largeTitle = "UINavigationBarLargeTitleView"
    }

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.image
        imageView.clipsToBounds = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .cyan
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setupUI()
    }
}

extension ViewController {
    private func setupUI() {
        title = Constants.title
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        for subview in navigationBar.subviews {
            if NSStringFromClass(subview.classForCoder).contains(Constants.largeTitle) {
                subview.addSubview(imageView)
                NSLayoutConstraint.activate([
                    imageView.trailingAnchor.constraint(equalTo: subview.trailingAnchor,
                                                        constant: -Constants.ImageRightMargin),
                    imageView.bottomAnchor.constraint(equalTo: subview.bottomAnchor,
                                                      constant: -Constants.ImageBottomMarginForLargeState),
                    imageView.heightAnchor.constraint(equalToConstant: Constants.ImageSizeForLargeState),
                    imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
                ])
            }
        }
        
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])

        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: Constants.contentHeight)
        ])
    }
}
