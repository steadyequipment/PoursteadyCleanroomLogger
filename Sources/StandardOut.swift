//
//  StandardOut.swift
//  poursteady-api
//
//  Created by Ian Grossberg on 10/18/16.
//
//

import CleanroomLogger
import Rainbow

// TODO: actually match color values
public struct StandardOutColorTable: ColorTable
{
    /** A light gray `Color` (`#999999`) used as the foreground color
     for the `.verbose` severity. */
    public static let verboseCleanroomColor  = CleanroomLogger.Color(r: 0x99, g: 0x99, b: 0x99)

    /** A dark gray `Color` (`#666666`) used as the foreground color
     for the `.debug` severity. */
    public static let debugCleanroomColor    = CleanroomLogger.Color(r: 0x66, g: 0x66, b: 0x66)

    /** A blue `Color` (`#0000CC`) used as the foreground color
     for the `.info` severity. */
    public static let infoCleanroomColor     = CleanroomLogger.Color(r: 0x00, g: 0x00, b: 0xCC)

    /** An orange `Color` (`#DD7722`) used as the foreground color
     for the `.warning` severity. */
    public static let warningCleanroomColor  = CleanroomLogger.Color(r: 0xDD, g: 0x77, b: 0x22)

    /** A red `Color` (`#CC0000`) used as the foreground color
     for the `.error` severity. */
    public static let errorCleanroomColor    = CleanroomLogger.Color(r: 0xCC, g: 0x00, b: 0x00)

    public init() {}

    public func foreground(forSeverity severity: LogSeverity)
        -> CleanroomLogger.Color?
    {
        switch severity {
        case .verbose:      return type(of: self).verboseCleanroomColor
        case .debug:        return type(of: self).debugCleanroomColor
        case .info:         return type(of: self).infoCleanroomColor
        case .warning:      return type(of: self).warningCleanroomColor
        case .error:        return type(of: self).errorCleanroomColor
        }
    }

    public static func applyRainbowForegroundColor(to: String, forColor: CleanroomLogger.Color) -> String {
        if forColor == self.verboseCleanroomColor {

            return to.cyan
        } else if forColor == self.debugCleanroomColor {

            return to.green
        } else if forColor == self.infoCleanroomColor {

            return to
        } else if forColor == self.warningCleanroomColor {

            return to.yellow
        } else if forColor == self.errorCleanroomColor {

            return to.red
        }

        return to
    }

    public static func applyRainbowBackgroundColor(to: String, forColor: CleanroomLogger.Color) -> String {
        if forColor == self.verboseCleanroomColor {

            return to.onCyan
        } else if forColor == self.debugCleanroomColor {

            return to.onGreen
        } else if forColor == self.infoCleanroomColor {

            return to
        } else if forColor == self.warningCleanroomColor {

            return to.onYellow
        } else if forColor == self.errorCleanroomColor {

            return to.onRed
        }
        
        return to
    }
}

public struct StandardOutTextColorizer: TextColorizer
{
    public init()
    {
    }

    public func colorize(_ str: String, foreground: CleanroomLogger.Color?, background: CleanroomLogger.Color?)
        -> String
    {
        var result = str

        if let foreground = foreground {
            result = StandardOutColorTable.applyRainbowForegroundColor(to: result, forColor: foreground)
        }

        if let background = background {
            result = StandardOutColorTable.applyRainbowBackgroundColor(to: result, forColor: background)
        }

        return result
    }
}

public class StandardOutFormatter: ReadableLogFormatter {
    init() {
        super.init(
            timestampStyle: Configuration.timestampStyle,
            severityStyle: Configuration.severityStyle,
            delimiterStyle: Configuration.delimiterStyle,
            showCallSite: Configuration.showCallSite,
            showCallingThread: Configuration.showCallingThread,
            colorizer: StandardOutTextColorizer(),
            colorTable: StandardOutColorTable())
    }
}

extension StandardOutputLogRecorder {
    convenience init() {
        self.init(formatters: [StandardOutFormatter()])
    }
}
