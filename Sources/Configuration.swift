//
//  Configuration.swift
//  poursteady-api
//
//  Created by Ian Grossberg on 10/18/16.
//
//

import CleanroomLogger

public class Configuration : BasicLogConfiguration {

    static let timestampStyle = TimestampStyle.default
    static let severityStyle = SeverityStyle.custom(textRepresentation: SeverityStyle.TextRepresentation.uppercase, truncateAtWidth: nil, padToWidth: nil, rightAlign: false)
    static let delimiterStyle = DelimiterStyle.custom(" ▶ ")
    static let showCallSite = true
    static let showCallingThread = false

    public static let disabledOutputFolderValue = "__//disabled\\__"

    init(minimumSeverity: LogSeverity, outputFolder: String? = nil) throws {

        var configurations = [LogConfiguration]()
        #if os(OSX)
        if isDebuggerAttached() {
            let configuration = XcodeLogConfiguration(minimumSeverity: minimumSeverity)

            configurations.append(configuration)
        } else {

            let configuration = BasicLogConfiguration(
                minimumSeverity: minimumSeverity,
                recorders: [ASLLogRecorder(), StandardOutputLogRecorder()])

            configurations.append(configuration)
        }
        #else
            let configuration = BasicLogConfiguration(
                minimumSeverity: minimumSeverity,
                recorders: [StandardOutputLogRecorder()])

            configurations.append(configuration)
        #endif
        if let outputFolder = outputFolder,
            outputFolder != Configuration.disabledOutputFolderValue {

            let configuration = RotatingLogFileConfiguration(
                minimumSeverity: .verbose,
                daysToKeep: 31,
                directoryPath: outputFolder,
                synchronousMode: false,
                filters: [],
                formatters: [ReadableLogFormatter()])

            try configuration.createLogDirectory()

            configurations.append(configuration)
        }

        super.init(
            minimumSeverity: minimumSeverity,
            filters: [],
            recorders: [],
            synchronousMode: false,
            configurations: configurations)
    }

    public convenience init(minimumSeverity: String, outputFolder: String? = nil) throws {
        try self.init(minimumSeverity: LogSeverity.from(string: minimumSeverity), outputFolder: outputFolder)
    }
}
