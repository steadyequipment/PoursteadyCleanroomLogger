//
//  Debug.swift
//  poursteady-api
//
//  Created by Ian Grossberg on 10/18/16.
//
//

import CleanroomLogger

public struct Debug {
    
    public static func severities() {
        Log.error?.message("Error")
        Log.warning?.message("Warning")
        Log.info?.message("Info")
        Log.debug?.message("Debug")
        Log.verbose?.message("Verbose")
    }
}
