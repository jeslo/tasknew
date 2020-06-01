//
//  DetailsController.swift
//  TaskNew
//
//  Created by Joe on 04/05/20.
//  Copyright © 2020 jess. All rights reserved.
//

import UIKit

class DetailsController: UIViewController {

    @IBOutlet weak var detailsDlabel: UILabel!
    @IBOutlet weak var detailsAlabel: UILabel!
    @IBOutlet weak var detailsDatelabel: UILabel!
    @IBOutlet weak var detailsTlabel: UILabel!
    
    var descr = ""
    var amt = ""
    var time = ""
    var date = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsDlabel.text = descr
        detailsAlabel.text = amt
        detailsTlabel.text = time
        detailsDatelabel.text = date
        let maximumLabelSize: CGSize = CGSize(width: 280, height: 9999)
        let expectedLabelSize: CGSize = detailsDlabel.sizeThatFits(maximumLabelSize)
        // create a frame that is filled with the UILabel frame data
        var newFrame: CGRect = detailsDlabel.frame
        // resizing the frame to calculated size
        newFrame.size.height = expectedLabelSize.height
        // put calculated frame into UILabel frame
        detailsDlabel.frame = newFrame
    }

}
