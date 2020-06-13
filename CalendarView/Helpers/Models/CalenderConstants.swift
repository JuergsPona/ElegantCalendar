// Kevin Li - 11:00 AM - 6/7/20

import SwiftUI

let screen = UIScreen.main.bounds
let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
let statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0

struct CalendarConstants {

    static let topPadding: CGFloat = cellHeight * 0.078
    static let horizontalPadding: CGFloat = cellWidth * 0.058
    static let gridSpacing: CGFloat = cellWidth * 0.038

    static let daysInRow: CGFloat = 7
    static let cellHeight: CGFloat = screen.height
    static let cellWidth: CGFloat = screen.width

    static let dayWidth: CGFloat = {
        let totalHorizontalPadding: CGFloat = 2 * horizontalPadding
        let innerGridSpacing: CGFloat = (daysInRow - 1) * gridSpacing
        return (cellWidth - totalHorizontalPadding - innerGridSpacing) / daysInRow
    }()

}
