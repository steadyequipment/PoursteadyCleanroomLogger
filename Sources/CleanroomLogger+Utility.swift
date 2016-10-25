//
//  CleanroomLogger+Utility.swift
//  poursteady-api
//
//  Created by Ian Grossberg on 10/18/16.
//
//

import CleanroomLogger

public typealias Log = CleanroomLogger.Log

extension CleanroomLogger.LogSeverity {

    static var allSeverities : [LogSeverity] {
        return [
            .verbose,
            .debug,
            .info,
            .warning,
            .error
        ]
    }

    static func from(string : String) -> LogSeverity {

        guard let severity = self.allSeverities.filter({ $0.description.lowercased() == string }).first else {

            print("Invalid log severity specified ('\(string)'), defaulting to 'info'")
            return .info
        }

        return severity
    }
}

func ==(lhs: CleanroomLogger.Color, rhs: CleanroomLogger.Color) -> Bool {
    return lhs.r == rhs.r && lhs.g == rhs.g && lhs.b == rhs.b
}
