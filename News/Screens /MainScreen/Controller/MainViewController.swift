//
//  ViewController.swift
//  News
//
//  Created by Aisha Madalieva on 08/01/25.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    let tableView = UITableView()
    var news: [Article] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setUpUI()
        makeConstraints()
    }
    func addSubviews() {
        view.addSubview(tableView)
    }
    func setUpUI() {
        setUpNavigationItems()
        setUpTableView()
    }
    func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    func setUpNavigationItems() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.down.fill"), style: .plain, target: self, action: #selector(navigateToSavedArticlesVC))
    }
    @objc func navigateToSavedArticlesVC() {
        let nextVc = SavedArticleViewController()
        navigationController?.pushViewController(nextVc, animated: true)
    }
    func setUpTableView() {
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(HandleRefreshControl), for: .valueChanged)
        let urlString = "https://newsapi.org/v2/everything?q=apple&from=2025-01-07&to=2025-01-07&sortBy=popularity&apiKey=ce8fcb62fea3429d809ad56abe1ae4fd"
            operateData(from: urlString)
    }
    @objc func HandleRefreshControl() {
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
        }

    }
        func operateData(from urlString: String) {
            guard let url = URL(string: urlString) else { return }

            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("(error)")
                    return
                }
                guard let data = data else {
                    print("No data")
                    return
                }
                do {
                    let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                    self.news = newsResponse.articles

                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print("(error)")
                }
            }
            task.resume()
        }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        let article = news[indexPath.row]
                cell.header.text = article.title
                cell.shortDescription.text = article.description ?? "No description"
                cell.publishedDate.text = article.publishedAt
                cell.name.text = article.name ?? "No name"
                cell.author.text = article.author ?? "No author"
                cell.content.text = article.content ?? "No content"
               return cell
            }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}

extension MainViewController: UITableViewDelegate {
                func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                    let selectedRow = news[indexPath.row]
                        navigateToDetailViewController()

                    func navigateToDetailViewController() {
                        let nextVc = DetailNewsViewController()
                        nextVc.selectedNews = selectedRow
                        navigationController?.pushViewController(nextVc, animated: true)
                    }
    }
}

