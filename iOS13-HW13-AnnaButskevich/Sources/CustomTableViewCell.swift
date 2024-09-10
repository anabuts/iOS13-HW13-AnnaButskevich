//
//  CustomTableViewCell.swift
//  iOS13-HW13-AnnaButskevich
//
//  Created by Анна Буцкевич on 24.07.24.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {

    var model: SettingsOption? {
        didSet {
            iconImageView.image = model?.icon
            iconContainer.backgroundColor = model?.iconBackgroundColor
            label.text = model?.label
            status.text = model?.status
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
        icon.contentMode = .scaleAspectFit
        return icon
    }()

    lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()

    lazy var status: UILabel = {
        let status = UILabel()
        status.textColor = .systemGray
        return status
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(label)
        contentView.addSubview(status)
        contentView.clipsToBounds = true
    }

    private func setupLayout() {

        iconContainer.snp.makeConstraints {make in
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(30)
            make.centerY.equalToSuperview()}

        iconImageView.snp.makeConstraints {make in
            make.centerX.equalTo(iconContainer)
            make.centerY.equalTo(iconContainer)
        }

        label.snp.makeConstraints {make in
            make.leading.equalTo(iconContainer.snp.trailing).offset(16)
            make.centerY.equalToSuperview()
        }

        status.snp.makeConstraints {make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(contentView).offset(-10)
        }
    }

    // MARK: - Reuse

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
    }

}
