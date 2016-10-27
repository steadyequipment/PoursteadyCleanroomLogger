//
//  Xcode.swift
//  poursteady-api
//
//  Created by Ian Grossberg on 10/18/16.
//
//

#if os(OSX)
import CleanroomLogger

extension XcodeLogFormatter {
    convenience init() {
        self.init(
            timestampStyle: Configuration.timestampStyle,
            severityStyle: Configuration.severityStyle,
            delimiterStyle: Configuration.delimiterStyle,
            showCallSite: Configuration.showCallSite,
            showCallingThread: Configuration.showCallingThread,
            colorizer: XcodeColorsTextColorizer(),
            colorTable: DefaultColorTable()
        )
    }
}

extension XcodeLogConfiguration {
    convenience init(minimumSeverity: LogSeverity) {
        self.init(
            minimumSeverity: minimumSeverity,
            debugMode: false,
            verboseDebugMode: false,
            logToASL: false,
            colorizer: nil,
            colorTable: nil,
            filters: [],
            formatter: XcodeLogFormatter()
        )
    }
}
#endif
