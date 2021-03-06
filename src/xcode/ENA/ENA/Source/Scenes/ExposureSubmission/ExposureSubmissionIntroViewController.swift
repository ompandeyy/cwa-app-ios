// Corona-Warn-App
//
// SAP SE and all other contributors
// copyright owners license this file to you under the Apache
// License, Version 2.0 (the "License"); you may not use this
// file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import UIKit

class ExposureSubmissionIntroViewController: DynamicTableViewController, ExposureSubmissionNavigationControllerChild {
	// MARK: - View lifecycle methods.

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		DispatchQueue.main.async { [weak self] in
			self?.navigationController?.navigationBar.sizeToFit()
		}

		// The button is shared among multiple controllers,
		// make sure to reset it whenever the view appears.
		setButtonTitle(to: "Weiter")
	}

	override func viewWillDisappear(_: Bool) {
		setButtonTitle(to: "")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
	}

	// MARK: - Setup helpers.

	private func setupView() {
		setupTitle()
		setupTableView()
	}

	private func setupTitle() {
		title = AppStrings.ExposureSubmissionIntroduction.title
		navigationItem.largeTitleDisplayMode = .always
		navigationController?.navigationBar.prefersLargeTitles = true
	}

	private func setupTableView() {
		tableView.dataSource = self
		tableView.delegate = self
		tableView.register(DynamicTableViewStepCell.self, forCellReuseIdentifier: CustomCellReuseIdentifiers.stepCell.rawValue)
		
		dynamicTableViewModel = .intro
		
	}

	// MARK: - ExposureSubmissionNavigationControllerChild methods.

	func didTapBottomButton() {
		performSegue(withIdentifier: Segue.overview, sender: self)
	}
}

private extension DynamicTableViewModel {
	static let intro = DynamicTableViewModel([

		DynamicSection.section(
			header: .image(UIImage(named: "Illu_Submission_Funktion1"), height: 200),
			separators: false,
			cells: [
				.bold(text: AppStrings.ExposureSubmissionIntroduction.usage01),
				.regular(text: AppStrings.ExposureSubmissionIntroduction.usage02),
				.identifier(
					ExposureSubmissionSuccessViewController.CustomCellReuseIdentifiers.stepCell,
					action: .none,
					configure: { _, cell, _ in
						guard let cell = cell as? DynamicTableViewStepCell else { return }
						cell.configure(
							text: AppStrings.ExposureSubmissionIntroduction.listItem1,
							image: UIImage(named: "Icons - Empty"),
							hasSeparators: false,
							isCircle: true,
							iconTintColor: .preferredColor(for: .textPrimary1)
						)
				}
				),
				.identifier(
					ExposureSubmissionSuccessViewController.CustomCellReuseIdentifiers.stepCell,
					action: .none,
					configure: { _, cell, _ in
						guard let cell = cell as? DynamicTableViewStepCell else { return }
						cell.configure(
							text: AppStrings.ExposureSubmissionIntroduction.listItem2,
							image: UIImage(named: "Icons - Empty"),
							hasSeparators: false,
							isCircle: true,
							iconTintColor: .preferredColor(for: .textPrimary1)
						)
				}
				),
				.identifier(
					ExposureSubmissionSuccessViewController.CustomCellReuseIdentifiers.stepCell,
					action: .none,
					configure: { _, cell, _ in
						guard let cell = cell as? DynamicTableViewStepCell else { return }
						cell.configure(
							text: AppStrings.ExposureSubmissionIntroduction.listItem3,
							image: UIImage(named: "Icons - Empty"),
							hasSeparators: false,
							isCircle: true,
							iconTintColor: .preferredColor(for: .textPrimary1)
						)
				}
				),
				.identifier(
					ExposureSubmissionSuccessViewController.CustomCellReuseIdentifiers.stepCell,
					action: .none,
					configure: { _, cell, _ in
						guard let cell = cell as? DynamicTableViewStepCell else { return }
						cell.configure(
							text: AppStrings.ExposureSubmissionIntroduction.listItem4,
							image: UIImage(named: "Icons - Empty"),
							hasSeparators: false,
							isCircle: true,
							iconTintColor: .preferredColor(for: .textPrimary1)
						)
				}
				),

			]
		)
	])
}

private extension ExposureSubmissionIntroViewController {
	enum Segue: String, SegueIdentifiers {
		case overview = "overviewSegue"
	}
	enum CustomCellReuseIdentifiers: String, TableViewCellReuseIdentifiers {
		case stepCell
	}
}
