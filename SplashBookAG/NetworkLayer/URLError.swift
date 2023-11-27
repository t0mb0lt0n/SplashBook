//
//  URLError.swift
//  SplashBookAG
//
//  Created by Alexander on 23.11.2023.
//

import Foundation

enum URLError: String, Error {
    case composingError = "URL Error - Composing Failure"
    case BadTunnel = "URL Error - Wrong Tunnel"
    case BadServer = "URL Error - Wrong Server"
    case BadEndPoint = "URL Error - Wrong EndPoint"
}
