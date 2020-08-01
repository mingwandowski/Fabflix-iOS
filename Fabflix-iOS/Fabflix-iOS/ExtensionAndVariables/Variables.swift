//
//  Variables.swift
//  Fabflix-iOS
//
//  Created by Zidan Li on 7/26/20.
//  Copyright © 2020 Haoming Gao. All rights reserved.
//

import Foundation

let http = "http://"
let ipAddress = "3.101.19.225"
let port = ":8080"
let homePath = "/fabflix/"

var baseUrl: String {
    return http + ipAddress + port + homePath
}
