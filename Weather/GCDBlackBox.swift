//
//  GCDBlackBox.swift
//  Weather
//
//  Created by Baskaran T on 16/03/17.
//  Copyright © 2017 Baskaran T. All rights reserved.
//

import Foundation

func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
    DispatchQueue.main.async {
        updates()
    }
}
