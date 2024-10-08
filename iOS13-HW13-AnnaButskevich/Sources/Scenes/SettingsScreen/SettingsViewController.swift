//
//  ViewController.swift
//  iOS13-HW13-AnnaButskevich
//
//  Created by Анна Буцкевич on 15.07.24.
//

import UIKit
import SnapKit

final class SettingsViewController: UIViewController {

    // MARK: - UI

    private var models: [[SettingsOption]]?

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.id)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        models = SettingsOption.models
        setupHierarchy()
        setupView()
        setupNavigationBar()
        setupLayout()
    }

    // MARK: - Setup

    private func setupView() {
        view.backgroundColor = .systemBackground
    }

    private func setupHierarchy() {
        view.addSubview(tableView)
    }

    private func setupNavigationBar() {
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return models?.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models?[section].count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.id, for: indexPath) as? SettingsTableViewCell

        if let cellSetting = models?[indexPath.section][indexPath.row] {
            cell?.configureWith(model: cellSetting)
        }

        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        45
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if models?[indexPath.section][indexPath.row].options == .switchCell {
            return
        }

        let viewController = DetailViewController()
        tableView.deselectRow(at: indexPath, animated: true)
        viewController.model = models?[indexPath.section][indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
}
