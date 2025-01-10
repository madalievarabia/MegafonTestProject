//
//  TableViewCell.swift
//  News
//
//  Created by Aisha Madalieva on 10/01/25.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell  {
      let header = UILabel()
      let shortDescription = UILabel()
      let publishedDate = UILabel()
      let name = UILabel()
      let author = UILabel()
      let content = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setUpUI()
        setNeedsUpdateConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addSubviews() {
        contentView.addSubview(header)
        contentView.addSubview(shortDescription)
        contentView.addSubview(publishedDate)
        contentView.addSubview(name)
        contentView.addSubview(author)
        contentView.addSubview(content)
    }
    func setUpUI() {
        setUpHeader()
        setUpShortDescription()
        setUpPublishedDate()
        setUpName()
        setUpAuthor()
        setUpContent()
    }
    override func updateConstraints() {
        header.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.right.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(10)
        }
        shortDescription.snp.makeConstraints { make in
            make.top.equalTo(header.snp.bottom).offset(3)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(16)
            make.bottom.equalTo(publishedDate.snp.bottom).inset(20)
        }
        publishedDate.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(16)
        }
        name.snp.makeConstraints { make in
            make.top.equalTo(publishedDate.snp.bottom).inset(10)
            make.left.equalToSuperview().inset(3)
        }
        author.snp.makeConstraints { make in
            make.top.equalTo(publishedDate.snp.bottom).inset(10)
            make.left.equalToSuperview().inset(3)
        }
        content.snp.makeConstraints { make in
            make.top.equalTo(publishedDate.snp.bottom).inset(10)
            make.left.equalToSuperview().inset(5)
        }
        super.updateConstraints()
    }
    func setUpHeader() {
        header.text  = "Election victory"
        header.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        header.numberOfLines = 4
    }
    func setUpShortDescription() {
        shortDescription.text  = "Just wrtittin someting to fill yhe lines for my TableViewCell and I am gonna chanhe it further. I just gotta check how does it look as an example.....lol."
        shortDescription.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        shortDescription.numberOfLines = 5
    }
    func setUpPublishedDate() {
        publishedDate.text  = "9 hours ago"
        publishedDate.font = UIFont.systemFont(ofSize: 13, weight: .heavy)
    }
    func setUpName() {
        name.text  = "9 hours ago"
        name.font = UIFont.systemFont(ofSize: 13, weight: .heavy)
        name.isHidden = true
    }
    func setUpAuthor() {
        author.text  = "9 hours ago"
        author.font = UIFont.systemFont(ofSize: 13, weight: .heavy)
        author.isHidden = true
    }
    func setUpContent() {
        content.text  = "9 hours ago"
        content.font = UIFont.systemFont(ofSize: 13, weight: .heavy)
        content.isHidden = true
    }
}
