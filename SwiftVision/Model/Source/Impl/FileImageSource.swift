//
//  FileImageSource.swift
//  ResistAR
//
//  Created by Christopher Hatton on 18/07/2015.
//  Copyright © 2015 AppDelegate. All rights reserved.
//

import Foundation
import UIKit

final class FileImageSource : ImageSource
{
    typealias ImageType = UIImage
    
    let image : UIImage
    
    init(image: UIImage )
    {
        self.image = image
    }
    
    func start(handler: (UIImage)->Void )
    {
        handler( image )
    }
    
    func stop()
    {
        
    }
}