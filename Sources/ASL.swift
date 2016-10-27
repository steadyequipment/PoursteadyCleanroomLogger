//
//  ASL.swift
//  poursteady-api
//
//  Created by Ian Grossberg on 10/18/16.
//
//

#if os(OSX)
import CleanroomLogger

class ASLFormatter : ReadableLogFormatter {
    init() {
        super.init(
            timestampStyle: Configuration.timestampStyle,
            severityStyle: Configuration.severityStyle,
            delimiterStyle: Configuration.delimiterStyle,
            showCallSite: Configuration.showCallSite,
            showCallingThread: Configuration.showCallingThread,
            colorizer: nil,
            colorTable: DefaultColorTable()
        )
    }
}

extension ASLLogRecorder {
    init() {
        self.init(
            formatter: ASLFormatter(),
            echoToStdErr: false,
            addTraceAttributes: false
        )
    }
}
#endif
