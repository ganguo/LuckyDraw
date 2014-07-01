//
//  RootViewController.swift
//  SwiftChinaLucky
//
//  Created by Ron on 26/6/14.
//  Copyright (c) 2014 HGG. All rights reserved.
//

import UIKit

class RootViewController: UIViewController{
    
    @IBOutlet var resultLabel: UILabel
    @IBOutlet var randomNum: LTMorphingLabel
    
    var randomNumber = 0
    var totalPeople: Int!
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        totalPeople = DataModel.maxNumber
        resultLabel.adjustsFontSizeToFitWidth = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool){
        super.viewWillAppear(animated)
        self.updateResult()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickPickerRandomNumber(sender: AnyObject) {
        var randomNumber = DataModel.createARandomNumber()
        debugPrint("\(randomNumber)")
        randomNum.text = "\(randomNumber)"
        DataModel.addNumber(randomNumber)
        self.updateResult()
    }
    
    @IBAction func onClickReset(sender: AnyObject) {
        resultLabel.text = nil
        DataModel.resetDatas()
        self.updateResult()
    }
    func updateResult(){
        if let randomNumSeq = DataModel.pickAllRandomNumbers(){
            resultLabel.text = "\(randomNumSeq)"
        }else {
            resultLabel.text = nil
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
