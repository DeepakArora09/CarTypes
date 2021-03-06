//
//  ManufacturerViewController.swift
//  CarTypes
//
//  Created by Deepak Arora on 01.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import UIKit

protocol ManufacturerView: AnyObject {
  func update(dataSource: DataSource)
  func setNavigation(title: String)
}

class ManufacturerViewController: UIViewController {
  @IBOutlet private weak var tableView: UITableView!
  var presenter: ManufacturerPresenting?
  private var dataSource = DataSource(sections: [])

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.registerNibForCell(ManufacturerItemCell.self)
    presenter?.onViewDidLoad()
  }
}

extension ManufacturerViewController: ManufacturerView {
  func update(dataSource: DataSource) {
    self.dataSource = dataSource
    tableView.reloadData()
  }

  func setNavigation(title: String) {
    navigationItem.title = title
  }
}

extension ManufacturerViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard dataSource.sections.isEmpty == false,
      dataSource.sections.count > section else {
      return 0
    }

    return dataSource.sections[section].items.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard dataSource.sections.count > indexPath.section else {
      return UITableViewCell()
    }

    let section = dataSource.sections[indexPath.section]
    let viewModel = section.items[indexPath.row]
    let cell: ReusableTableCell = tableView.dequeueReusableCell(ofType: section.cellType, for: indexPath)
    cell.update(with: viewModel)
    return cell
  }
}

extension ManufacturerViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return dataSource.sections[indexPath.section].cellHeight
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard dataSource.sections.count > indexPath.section,
      dataSource.sections[indexPath.section].items.count > indexPath.row else {
        return
    }
    let item = dataSource.sections[indexPath.section].items[indexPath.row]
    presenter?.onDidSelect(item: item)
  }
}

extension ManufacturerViewController: UIScrollViewDelegate {
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    presenter?.scrollViewEndDragging(
      with: scrollView.contentSize.height,
      viewHeight: scrollView.bounds.height,
      currentVerticalOffset: scrollView.contentOffset.y
    )
  }
}
