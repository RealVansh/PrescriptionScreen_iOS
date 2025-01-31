//
//  ViewController.swift
//  PrescriptionScreen
//
//  Created by admin100 on 16/11/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var allDiagnoses = DiagnosisData.allDiagnoses
    var filteredDiagnoses: [Diagnosis] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        filteredDiagnoses = allDiagnoses
        searchBar.layer.cornerRadius = 16
        searchBar.clipsToBounds = true
        searchBar.searchTextField.backgroundColor = UIColor.white

        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(
            string: "Search based on Diagnosis",
            attributes: [
                .foregroundColor: UIColor.systemGray,
                .font: UIFont.systemFont(ofSize: 14, weight: .regular)
            ]
        )
        let titleAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.white, // Change the title color
                .font: UIFont.systemFont(ofSize: 20, weight: .bold) // Adjust the font size and weight
            ]
            navigationController?.navigationBar.titleTextAttributes = titleAttributes
            

    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredDiagnoses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiagnosisCell", for: indexPath)
        cell.textLabel?.text = filteredDiagnoses[indexPath.row].name
                cell.textLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
                cell.textLabel?.textColor = UIColor.black
                cell.layer.cornerRadius = 10
                cell.layer.masksToBounds = true
 
        
                
                // Adding shadow
                cell.layer.shadowColor = UIColor.black.cgColor
                cell.layer.shadowOpacity = 0.1
                cell.layer.shadowOffset = CGSize(width: 0, height: 2)
                cell.layer.shadowRadius = 4
                cell.layer.masksToBounds = false
                
                return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 107
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
            let spacerView = UIView()
            spacerView.backgroundColor = UIColor.clear // Space with no background
            return spacerView
        }
        
        func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 16 // Spacing between cells
        }
    //func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //    performSegue(withIdentifier: "ShowPrescriptions", sender: indexPath)
    //}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPrescriptions",
           let destinationVC = segue.destination as? PrescriptionListViewController,
           let selectedRow = tableView.indexPathForSelectedRow?.row {
            
            let selectedDiagnosis = filteredDiagnoses[selectedRow]
            print("Selected Diagnosis: \(selectedDiagnosis.name)") // Debug output
            
            // Pass the selected diagnosis
            destinationVC.diagnosis = selectedDiagnosis

            // Set the navigation title
            destinationVC.title = selectedDiagnosis.name
        }
    }


    // Search bar filtering
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredDiagnoses = allDiagnoses
        } else {
            filteredDiagnoses = allDiagnoses.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
        tableView.reloadData()
    }
    
    
}
