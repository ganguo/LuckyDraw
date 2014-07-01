//
//  MaxNumberViewController.swift
//  SwiftChinaLucky
//
//  Created by Ron on 26/6/14.
//  Copyright (c) 2014 HGG. All rights reserved.
//

import UIKit

class MaxNumberViewController: UIViewController , UITextFieldDelegate {
    @IBOutlet var numTextField: UITextField
    @IBOutlet var pickNumTextField: UITextField
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        numTextField.text = "\(DataModel.maxNumber)"
        pickNumTextField.text = "\(DataModel.maxTime)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onClickDone(sender: AnyObject) {
        self.saveIt()
        self.dismissModalViewControllerAnimated(true)
    }
    
    func saveIt(){
        if let time = pickNumTextField.text.toInt(){
            DataModel.maxTime = time
        }
        if let num = numTextField.text.toInt()?{
            DataModel.maxNumber = num
        }
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
        self.saveIt()
        return false
    }
    
    func textField(textField: UITextField!, shouldChangeCharactersInRange range: NSRange, replacementString string: String!) -> Bool{
        if(textField.isEqual(numTextField)){
            return textField.text.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) < 3 || string.isEmpty
        }else {
            return textField.text.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) < 2 || string.isEmpty
        }
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
