//
//  ImageSource.swift
//  ResistAR
//
//  Created by Christopher Hatton on 18/07/2015.
//  Copyright © 2015 AppDelegate. All rights reserved.
//

import Foundation
import CoreImage

protocol ImageSource
{
    typealias ImageType
    typealias ImageHandler = ( ImageType ) -> Void

    func start( handler:ImageHandler )
    func stop()
}