//
//  TableViewCell.swift
//  ResizableCell
//
//  Created by Javier Loucim on 22/01/2019.
//  Copyright © 2019 Javier Loucim. All rights reserved.
//

import UIKit

protocol TableViewCellDelegate {
    func shouldRefreshHeight()
}

class TableViewCell: UITableViewCell {

    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    var delegate: TableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var titleLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func enlargeAction(_ sender: Any) {
        UIView.animate(withDuration: 0.87, delay: 0, options: [.beginFromCurrentState, .curveEaseOut], animations: {
            self.heightConstraint.constant = 100
            self.delegate?.shouldRefreshHeight()
            self.layoutIfNeeded()
        }, completion: { completed in
        })
    }
}
