//
//  System+Utility.swift
//  poursteady-api
//
//  Created by Ian Grossberg on 10/18/16.
//
//

#if os(OSX)
import SystemConfiguration

func isDebuggerAttached() -> Bool {

    var info = kinfo_proc()
    var mib : [Int32] = [CTL_KERN, KERN_PROC, KERN_PROC_PID, getpid()]
    var size = MemoryLayout<kinfo_proc>.stride
    let junk = sysctl(&mib, UInt32(mib.count), &info, &size, nil, 0)
    assert(junk == 0, "sysctl failed")
    return (info.kp_proc.p_flag & P_TRACED) != 0
}
#endif
