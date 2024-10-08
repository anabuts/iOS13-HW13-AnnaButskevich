//
//  DetailViewController.swift
//  iOS13-HW13-AnnaButskevich
//
//  Created by Анна Буцкевич on 10.09.24.
//

import UIKit
import SnapKit

final class DetailViewController: UIViewController {

    var model: SettingsOption? {
        didSet {
            iconImageView.image = model?.icon
            iconContainer.backgroundColor = model?.iconBackgroundColor
            label.text = model?.label
        }
    }

    // MARK: - UI

    lazy var iconContainer: UIView = {
        let container = UIView()
        container.layer.cornerRadius = 6
        container.backgroundColor = .blue
        return container
    }()

    lazy var iconImageView: UIImageView = {
        let icon = UIImageView()
        icon.tintColor = .white
        icon.contentMode = .scaleAspectFill
        return icon
    }()

    lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupView() {
        view.backgroundColor = .systemBackground
    }

    private func setupHierarchy() {
        view.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        view.addSubview(label)
        view.clipsToBounds = true
    }

    private func setupLayout() {

        iconContainer.snp.makeConstraints {make in
            make.height.width.equalTo(120)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()}

        iconImageView.snp.makeConstraints {make in
            make.height.width.equalTo(60)
            make.centerX.equalTo(iconContainer)
            make.centerY.equalTo(iconContainer)
        }

        label.snp.makeConstraints {make in
            make.top.equalTo(iconContainer.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
    }
}
