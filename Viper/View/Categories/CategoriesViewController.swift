//
//  CategoriesViewController.swift
//  Viper
//
//  Created by ToanTV on 1/15/19.
//  Copyright © 2019 Asian Tech Co., Ltd. All rights reserved.
//

import UIKit
import SwifterSwift

final class CategoriesViewController: UIViewController, CategoriesView {

    var eventHandler: CategoriesEventHandler?

     // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        getCategoriesList()
    }

    private func configureTableView() {
        tableView.register(nib: UINib(nibName: "CategoriesCell", bundle: nil), withCellClass: CategoriesCell.self)
//        tableView.register(cellWithClass: CategoriesCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func getCategoriesList() {
        eventHandler?.getCategoriesList()
    }

    func updateList() {
        tableView.reloadData()
    }
}

extension CategoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

extension CategoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventHandler?.getCountCategoriesList(section: 0) ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: CategoriesCell.self, for: indexPath)
        cell.titleLabel.text = eventHandler?.getCategory(indexPath: indexPath).snippet.title
        return cell
    }
}
