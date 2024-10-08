//
//  SettingsTableViewCell.swift
//  iOS13-HW13-AnnaButskevich
//
//  Created by Анна Буцкевич on 8.10.24.
//

import UIKit
import SnapKit

class SettingsTableViewCell: UITableViewCell {

    static let id = "SettingsTableViewCell"

    private var model: SettingsOption?

    // MARK: - UI

    private lazy var iconContainer: UIView = {
        let container = UIView()
        container.layer.cornerRadius = 6
        container.backgroundColor = .blue
        return container
    }()

    private lazy var iconImageView: UIImageView = {
        let icon = UIImageView()
        icon.tintColor = .white
        icon.contentMode = .scaleAspectFit
        return icon
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()

    private lazy var status: UILabel = {
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

    func configureWith(model: SettingsOption) {
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
        label.text = model.label
        status.text = model.status

        let settingOptionType = model.options
        let switchButton = UISwitch(frame: CGRectZero) as UISwitch
        switchButton.isOn = false
        accessoryType = .disclosureIndicator

        switch settingOptionType {
        case .staticCell:
            accessoryType = .disclosureIndicator
        case .detailCell:
            accessoryType = .detailDisclosureButton
        case .switchCell:
            selectionStyle = .none
            accessoryView = switchButton
        }
    }

    // MARK: - Reuse

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
        accessoryView = nil
    }
}
