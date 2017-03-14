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
    associatedtype ImageType
    associatedtype ImageHandler = ( ImageType ) -> Void

    func start( _ handler:ImageHandler )
    func stop()
}
