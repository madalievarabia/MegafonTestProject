//
//  DetailNewsViewController.swift
//  News
//
//  Created by Aisha Madalieva on 10/01/25.
//

import UIKit
import SnapKit

class DetailNewsViewController: UIViewController {

    var selectedNews: Article?
    let name = UILabel()
    let author = UILabel()
    let articleTitle = UILabel()
    let descriptionText = UILabel()
    let content = UILabel()
    let date = UILabel()
    let saveArcticleButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setUpUI()
        makeConstraints()
        view.backgroundColor = .gray


    }
    func addSubviews() {
        view.addSubview(name)
        view.addSubview(author)
        view.addSubview(articleTitle)
        view.addSubview(descriptionText)
        view.addSubview(content)
        view.addSubview(date)
        view.addSubview(saveArcticleButton)
    }
    func setUpUI() {
        setUpName()
        setUpAuthor()
        setUpActicleTitle()
        setUpDescriptionText()
        setUpContent()
        setUpDate()
        setUpSaveArticleButton()
    }
    func makeConstraints() {
        name.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.centerX.equalToSuperview()
        }
        author.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.right.equalToSuperview().inset(16)
        }
        articleTitle.snp.makeConstraints { make in
            make.top.equalTo(author.snp.bottom).offset(20)
            make.right.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(10)
        }
        descriptionText.snp.makeConstraints { make in
            make.top.equalTo(articleTitle.snp.bottom).offset(20)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(16)
        }
        content.snp.makeConstraints { make in
            make.top.equalTo(descriptionText.snp.bottom).offset(20)
            make.right.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(10)
        }
        date.snp.makeConstraints { make in
            make.top.equalTo(content.snp.bottom).offset(20)
            make.right.equalToSuperview().inset(16)
        }
        saveArcticleButton.snp.makeConstraints { make in
            make.top.equalTo(date.snp.bottom).offset(20)
            make.right.equalToSuperview().inset(16)
        }
    }

    func setUpName() {
        name.text =  selectedNews?.name
        name.font = UIFont.systemFont(ofSize: 19, weight: .black)
    }
    func setUpAuthor() {
        author.text =  selectedNews?.author
        author.font = UIFont.systemFont(ofSize: 18, weight: .black)
    }
    func setUpActicleTitle() {
        articleTitle.text = selectedNews?.title
        articleTitle.font = UIFont.systemFont(ofSize: 19, weight: .black)
        articleTitle.numberOfLines = 5
    }
    func setUpDescriptionText() {
        descriptionText.text = selectedNews?.description
        descriptionText.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        descriptionText.numberOfLines = 50
    }
    func setUpContent() {
        content.text =  selectedNews?.content
        content.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        content.numberOfLines = 20
    }
    func setUpDate() {
        date.text = selectedNews?.publishedAt
        date.font = UIFont.systemFont(ofSize: 17, weight: .black)
    }
    func setUpSaveArticleButton() {
        saveArcticleButton.setImage(UIImage(systemName: "plus.rectangle.fill"), for: .normal)
        saveArcticleButton.tintColor = .white
        saveArcticleButton.frame = CGRect(x: .zero, y: .zero, width: 200, height: 200)
        saveArcticleButton.addTarget(self, action: #selector(saveArticle), for: .touchUpInside)
    }
    @objc func saveArticle() {

    }
}

