//
//  TodosTableViewCell.swift
//  todosApi
//
//  Created by Mac on 01/12/22.
//

import UIKit

class TodosTableViewCell: UITableViewCell {

    @IBOutlet weak var boolLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
