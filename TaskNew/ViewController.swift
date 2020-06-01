//
//  ViewController.swift
//  TaskNew
//
//  Created by Joe on 15/04/20.
//  Copyright © 2020 jess. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var taskView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
var filterdata : [CATransactionViewModel] = []
    var tableviewArray : [CATransactionViewModel] = []
    
    var testTransPerData:[CATransactionViewModel] =
        [CATransactionViewModel(
            description: "ATM Cash withdrawal and atm card needed to stayyyy",          time: "06:00:00",                                                                         date: "27/05/2019",                                                                       transactionCurrency: "₹",                                                                 transactionAmount: "3456",                                                                billingCurrency: "£",                                                                     billingAmount: "666",                                                                     debitCredit: "1"),
         
         CATransactionViewModel(description: "MOB/Mobile/Recharge",                                                      time: "11:00:00",                                                                        date: "27/05/2019",                                                                      transactionCurrency: "₹",                                                                transactionAmount: "5400",                                                               billingCurrency: "£",                                                                    billingAmount: "+300",                                                                   debitCredit: "1"),
         CATransactionViewModel(description: "Fast Cash ATM",                                                      time: "11:00:00",                                                                        date: "27/05/2019",                                                                      transactionCurrency: "₹",                                                                transactionAmount: "5300",                                                               billingCurrency: "£",                                                                    billingAmount: "+800",                                                                    debitCredit: "0"),
         CATransactionViewModel(description: "ATM Cash withdrawal",                                                      time: "06:00:00",
                                date: "27/05/2019",                                                                      transactionCurrency: "₹",                                                                transactionAmount: "3456",                                                               billingCurrency: "£",                                                                    billingAmount: "666",                                                                    debitCredit: "1"),
         CATransactionViewModel(description: "Amazon/Pay",                                                      time: "12:00:00",                                                                        date: "27/05/2019",                                                                      transactionCurrency: "₹",                                                                transactionAmount: "4300",                                                               billingCurrency: "$",                                                                    billingAmount: "+400",                                                                    debitCredit: "1"),
         CATransactionViewModel(description: "Mobile Recharge",                                                      time: "09:00:00",                                                                        date: "27/05/2019",                                                                      transactionCurrency: "₹",                                                                transactionAmount: "7300",                                                               billingCurrency: "£",                                                                    billingAmount: "+600",                                                                    debitCredit: "0"),
         CATransactionViewModel(description: "Mobile Recharge",                                                      time: "09:00:00",                                                                        date: "27/05/2019",                                                                      transactionCurrency: "₹",                                                                transactionAmount: "7300",                                                               billingCurrency: "£",                                                                    billingAmount: "+600",                                                                    debitCredit: "0"),
         CATransactionViewModel(description: "Mobile Recharge",                                                      time: "09:00:00",                                                                        date: "27/05/2019",                                                                      transactionCurrency: "₹",                                                                transactionAmount: "7300",                                                               billingCurrency: "£",                                                                    billingAmount: "+600",                                                                    debitCredit: "0"),
         CATransactionViewModel(description: "Mobile Recharge",                                                      time: "09:00:00",                                                                        date: "27/05/2019",                                                                      transactionCurrency: "₹",                                                                transactionAmount: "7300",                                                               billingCurrency: "£",                                                                    billingAmount: "+600",                                                                    debitCredit: "0"),
         CATransactionViewModel(description: "Mobile Recharge",                                                      time: "09:00:00",                                                                        date: "27/05/2019",                                                                      transactionCurrency: "₹",                                                                transactionAmount: "7300",                                                               billingCurrency: "£",                                                                    billingAmount: "+600",                                                                    debitCredit: "0"
            )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.taskView.delegate = self
        self.taskView.dataSource = self
        self.searchBar.delegate = self
        self.tableviewArray = self.testTransPerData.sorted(by: {$0.description < $1.description})
        
    }
}

extension ViewController :  UITableViewDataSource , UITableViewDelegate
    
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableviewArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let taskcelldata = self.taskView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! TaskTableViewCell
        
        taskcelldata.descriptionLabel.text =  tableviewArray[indexPath.row].description
        taskcelldata.amountLabel.text = tableviewArray[indexPath.row].billingAmount
        taskcelldata.dateLabel.text = tableviewArray[indexPath.row].date
        taskcelldata.timeLabel.text = tableviewArray[indexPath.row].time
        
        taskcelldata.backgroundColor = UIColor.lightGray
        return taskcelldata
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.searchBar(searchText: "ATM" )
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsController") as? DetailsController
        
        
        
        vc?.descr = testTransPerData[indexPath.row].description
        vc?.amt = testTransPerData[indexPath.row].billingAmount
        vc?.date = testTransPerData[indexPath.row].date
        vc?.time = testTransPerData[indexPath.row].time
        self.navigationController?.pushViewController(vc! , animated: true)
        
    
    }
    
   
}
extension ViewController: UISearchBarDelegate{

    func searchBar(searchText: String)
    {
//        let resultPredicate = NSPredicate(format: "description Contains(%@)", searchText).sorted(by: {$0.date > $1.date})
//        filterdata = testTransPerData.filter { resultPredicate.evaluate(with: $0) }
//        print(filterdata)
       
        filterdata  = testTransPerData.filter({ descri -> Bool in
            return descri.description.localizedCaseInsensitiveContains(searchText) ||
            descri.billingAmount.localizedCaseInsensitiveContains(searchText) ||
            descri.time.localizedCaseInsensitiveContains(searchText) ||
            descri.date.localizedCaseInsensitiveContains(searchText)
        })
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchText.isEmpty) {
            tableviewArray = testTransPerData.sorted(by: {$0.description < $1.description})
        return taskView.reloadData()
    }
        self.searchBar(searchText:searchText)
        tableviewArray = filterdata.sorted(by: {$0.description < $1.description})
        taskView.reloadData()
    }
    
}


