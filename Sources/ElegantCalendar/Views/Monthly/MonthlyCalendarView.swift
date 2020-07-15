// Kevin Li - 2:26 PM - 6/14/20

import ElegantPages
import SwiftUI

public struct MonthlyCalendarView: View, MonthlyCalendarManagerDirectAccess {

    var theme: CalendarTheme = .default

    @ObservedObject public var calendarManager: MonthlyCalendarManager

    private var isTodayWithinDateRange: Bool {
        Date() >= calendar.startOfDay(for: startDate) &&
            calendar.startOfDay(for: Date()) <= endDate
    }

    private var isCurrentMonthYearSameAsTodayMonthYear: Bool {
        calendar.isDate(currentMonth, equalTo: Date(), toGranularities: [.month, .year])
    }

    public init(calendarManager: MonthlyCalendarManager) {
        self.calendarManager = calendarManager
    }

    public var body: some View {
        ZStack(alignment: .top) {
            monthsList
            if isTodayWithinDateRange && !isCurrentMonthYearSameAsTodayMonthYear {
                leftAlignedScrollBackToTodayButton
                    .padding(.trailing, CalendarConstants.Monthly.outerHorizontalPadding)
                    .offset(y: CalendarConstants.Monthly.topPadding + 3)
                    .transition(.opacity)
            }
        }
    }

    private var monthsList: some View {
        ElegantVList(manager: calendarManager.pagerManager, width: CalendarConstants.Monthly.cellWidth)
    }

    private var leftAlignedScrollBackToTodayButton: some View {
        HStack {
            Spacer()
            ScrollBackToTodayButton(scrollBackToToday: { self.calendarManager.scrollBackToToday() },
                                    color: theme.primary)
        }
    }

}

struct MonthlyCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        LightDarkThemePreview {
            MonthlyCalendarView(calendarManager: .mock)

            MonthlyCalendarView(calendarManager: .mockWithInitialMonth)
        }
    }
}
