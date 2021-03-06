//
//  CollectionViewCell.swift
//  PinterestLayout
//
//  Created by Shrikar Archak on 12/21/14.
//  Copyright (c) 2014 Shrikar Archak. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var pinImage: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var avgPrice: UILabel!
    @IBOutlet weak var awesomeTags: UILabel!
    @IBOutlet weak var poorTags: UILabel!
    @IBOutlet weak var goodTags: UILabel!
  }
