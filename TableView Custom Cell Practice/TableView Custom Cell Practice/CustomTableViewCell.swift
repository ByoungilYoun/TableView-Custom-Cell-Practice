//
//  CustomTableViewCell.swift
//  TableView Custom Cell Practice
//
//  Created by 윤병일 on 2020/08/31.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
  
  static let identifier = "CustomTableViewCell"
  private let _switch : UISwitch = {
    let _switch = UISwitch()
    _switch.onTintColor = .blue
    _switch.isOn = true
    return _switch
  }()
  
  private let myImageView : UIImageView = {
     let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
     return imageView
   }()
  
  private let myLabel : UILabel = {
     let label = UILabel()
    label.textColor = .white
    label.font = .systemFont(ofSize: 17, weight : .bold)
     return label
   }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.backgroundColor = .orange
    contentView.addSubview(_switch)
    contentView.addSubview(myLabel)
    contentView.addSubview(myImageView)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func configure(text : String, imageName : String) {
    myLabel.text = text
    myImageView.image = UIImage(named: imageName)
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    myLabel.text = nil
    myImageView.image = nil
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    let imageSize = contentView.frame.size.height - 6
    let switchSize = _switch.sizeThatFits(contentView.frame.size)
    
    _switch.frame = CGRect(x: 5, y: (contentView.frame.size.height - switchSize.height ) / 2, width: switchSize.width, height: switchSize.height)
    
    myLabel.frame = CGRect(x: 10 + _switch.frame.size.width , y: 0, width: contentView.frame.size.width - 10 - _switch.frame.size.width - imageSize, height: contentView.frame.size.height)
    
    myImageView.frame = CGRect(x: contentView.frame.size.width - imageSize, y: 3, width: imageSize, height: imageSize)
  }
}
