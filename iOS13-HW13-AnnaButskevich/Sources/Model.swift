//
//  Model.swift
//  iOS13-HW13-AnnaButskevich
//
//  Created by Анна Буцкевич on 24.07.24.
//

import Foundation
import UIKit

struct SettingsOption: Hashable {
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let label: String
    let options: SettingsOptionType
    var status: String = ""
}

enum SettingsOptionType {
    case staticCell
    case detailCell
    case switchCell
}

extension SettingsOption {
    static var models: [[SettingsOption]] = [
        [SettingsOption(icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange, label: "Авиарежим", options: .switchCell),
         SettingsOption(icon: UIImage(systemName: "wifi"), iconBackgroundColor: .systemBlue, label: "Wi-Fi", options: .staticCell, status: "Не подключен"),
        SettingsOption(icon: UIImage(named: "bluetooth"), iconBackgroundColor: .systemBlue, label: "Bluetooth", options: .staticCell, status: "Вкл."),
        SettingsOption(icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconBackgroundColor: .systemGreen, label: "Сотовая связь", options: .staticCell, status: "Выкл."),
        SettingsOption(icon: UIImage(systemName: "personalhotspot"), iconBackgroundColor: .systemGreen, label: "Режим модема", options: .staticCell, status: "Выкл."),
        SettingsOption(icon: UIImage(systemName: "network"), iconBackgroundColor: .systemBlue, label: "VPN", options: .switchCell)],
        [SettingsOption(icon: UIImage(systemName: "bell.badge"), iconBackgroundColor: .systemRed, label: "Уведомления", options: .staticCell),
        SettingsOption(icon: UIImage(systemName: "speaker.wave.3.fill"), iconBackgroundColor: .systemPink, label: "Звуки, тактильные сигналы", options: .staticCell),
         SettingsOption(icon: UIImage(systemName: "moon.fill"), iconBackgroundColor: .systemIndigo, label: "Не беспокоить", options: .staticCell),
        SettingsOption(icon: UIImage(systemName: "hourglass"), iconBackgroundColor: .systemIndigo, label: "Экранное время", options: .staticCell)],
        [SettingsOption(icon: UIImage(systemName: "gear"), iconBackgroundColor: .systemGray, label: "Основные", options: .staticCell),
        SettingsOption(icon: UIImage(systemName: "switch.2"), iconBackgroundColor: .systemGray, label: "Пункт управления", options: .staticCell),
        SettingsOption(icon: UIImage(systemName: "sun.max.fill"), iconBackgroundColor: .systemBlue, label: "Экран и яркость", options: .staticCell),
        SettingsOption(icon: UIImage(systemName: "square.grid.3x3.fill"), iconBackgroundColor: .blue, label: "Экран «Домой»", options: .staticCell),
        SettingsOption(icon: UIImage(systemName: "accessibility"), iconBackgroundColor: .systemBlue, label: "Универсальный доступ", options: .staticCell)]]
}

