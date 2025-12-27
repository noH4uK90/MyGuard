//
//  ProfileView.swift
//  MyGuard
//
//  Created by Иван Спирин on 26.06.2025.
//

import SwiftUI
import UIKit
import UDFKit

struct ProfileView: View {
    @State private var titleVisible = false
    
    @ObservedObject var store: StoreOf<ProfileReducer>

    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
            Text("\("profileTitle")")
                .font(.headline)
            
            Form {
                passCodeSection
                logoutSection
            }
        }
        .background(Color(UIColor.systemGroupedBackground))
    }
    
//    var body: some View {
//        NavigationStack {
//            UIKitProfileWrapper(titleVisible: $titleVisible)
//                .navigationBarTitleDisplayMode(.inline)
//                .navigationTitle(titleVisible ? "Имя пользователя" : "")
//                .ignoresSafeArea()
//        }
//    }
    
    private var passCodeSection: some View {
        Section {
            NavigationLink("changePassCodeButtonTitle", destination: {  })
        }
    }
    
    private var logoutSection: some View {
        Section {
            Button("logoutButtonTitle", role: .destructive) {
                store.send(.logout)
            }
        }
    }
}

struct UIKitProfileWrapper: UIViewControllerRepresentable {
    @Binding var titleVisible: Bool

    func makeUIViewController(context: Context) -> ProfileViewController {
        let vc = ProfileViewController()
        vc.onTitleVisibilityChanged = { isVisible in
            DispatchQueue.main.async {
                self.titleVisible = isVisible
            }
        }
        return vc
    }

    func updateUIViewController(_ uiViewController: ProfileViewController, context: Context) {
        // Nothing to update
    }
}

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView = UITableView()
    var headerView = UIView()
    var onTitleVisibilityChanged: ((Bool) -> Void)?

    let headerHeight: CGFloat = 220
    let collapseThreshold: CGFloat = 180
    
    let sections: [(title: String?, items: [String])] = [
        (nil, ["Change Passcode"]),
        (nil, ["Log out"])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        setupHeader()
        setupTableView()
    }

    func setupHeader() {
        headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: headerHeight))

        let imageView = UIImageView(image: UIImage(systemName: "person.circle.fill"))
        imageView.tintColor = .gray
        imageView.frame = CGRect(x: (view.bounds.width - 80) / 2, y: 40, width: 80, height: 80)
        imageView.contentMode = .scaleAspectFit
        headerView.addSubview(imageView)

        let nameLabel = UILabel(frame: CGRect(x: 0, y: 130, width: view.bounds.width, height: 20))
        nameLabel.text = "Имя пользователя"
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        headerView.addSubview(nameLabel)

        let phoneLabel = UILabel(frame: CGRect(x: 0, y: 155, width: view.bounds.width, height: 20))
        phoneLabel.text = "+7 999 123-45-67"
        phoneLabel.textAlignment = .center
        phoneLabel.textColor = .gray
        headerView.addSubview(phoneLabel)

        let tagLabel = UILabel(frame: CGRect(x: 0, y: 180, width: view.bounds.width, height: 20))
        tagLabel.text = "@username"
        tagLabel.textAlignment = .center
        tagLabel.textColor = .gray
        headerView.addSubview(tagLabel)
    }

    func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = headerView
        tableView.alwaysBounceVertical = true
        view.addSubview(tableView)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        let shouldShowTitle = offset > collapseThreshold
        onTitleVisibilityChanged?(shouldShowTitle)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let items = sections[indexPath.section].items[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = items
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sections[section].title
    }
}
