import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var label: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var stringWithMathematicalOperation: String = "" // Example
    var result  :Double  = 0.0
    var pheptoan = 1
    var phepdem = 0
    
    @IBAction func button(_ sender: UIButton) {
        
        if sender.tag == 17 && phepdem == 0 && pheptoan == 1 && label.text != ""
        {
            let exp: NSExpression = NSExpression(format: stringWithMathematicalOperation)
            result = exp.expressionValue(with: nil, context: nil) as! Double
            label.text = String(result)
        }
        else if sender.tag == 19
        {
            result = 0
            stringWithMathematicalOperation = ""
            label.text = String (result)
        }
        
    }
//button->tag
//0->1.    3->4.     6->7.      9->10
//1->2.    4->5.     7->8.      (->11
//2->3.    5->6.     8->9.      )->12
///->13.   x->14.    - ->15.    +->16
// =->17.  .->18.   C->19.    can->20.
//log->21. x2->22.  +/- ->23. sin->24.
//cos->25. tan->26.  pi->27
 
    @IBAction func number(_ sender: UIButton) {
        if  sender.tag != 11 && sender.tag != 12 && sender.tag != 13 && sender.tag != 14 &&
            sender.tag != 15 && sender.tag != 16 && sender.tag != 18 && sender.tag != 20 &&
            sender.tag != 21 && sender.tag != 22 && sender.tag != 23 && sender.tag != 24 &&
            sender.tag != 25 && sender.tag != 26 && sender.tag != 27
            
        {
            stringWithMathematicalOperation = stringWithMathematicalOperation + String(sender.tag-1)
            label.text = stringWithMathematicalOperation
            pheptoan = 1
        }
            
            //+/-
        else if label.text != "" && sender.tag == 23 && pheptoan == 1
        {
            
            label.text = String((Double(stringWithMathematicalOperation)!)*(-1.0))
            pheptoan = 0
        }
            
            //tinh tan
        else if label.text != "" && sender.tag == 26 && pheptoan == 1
        {
            if ((Double(stringWithMathematicalOperation)!) == 90 )
            {
                label.text = "Error"
            }
                
            else
            {
                label.text = String(tan((Double.pi*(Double(stringWithMathematicalOperation)!))/180))
                pheptoan = 0
             }
        }
            
            //tinh cos
        else if label.text != "" && sender.tag == 25 && pheptoan == 1
        {
            if ((Double(stringWithMathematicalOperation)!) == 90 )
            {
                label.text = String(0)
                pheptoan = 0
           
            }
                
            else
            {
               label.text = String(cos((Double.pi*(Double(stringWithMathematicalOperation)!))/180))
                pheptoan = 0
                
            }
        }
            
            //tinh sin
        else if label.text != "" && sender.tag == 24 && pheptoan == 1
        {
           
            label.text = String(sin((Double.pi*(Double(stringWithMathematicalOperation)!))/180))
            
            pheptoan = 0
        }
            
            //tinh luy thua 2
        else if label.text != "" && sender.tag == 22 && pheptoan == 1
        {
            label.text = String(pow((Double(stringWithMathematicalOperation)!), 2.0))
            pheptoan = 0
        }
            //ham log10
        else if label.text != "" && sender.tag == 21 && pheptoan == 1
        {
            label.text = String(log10(Double(stringWithMathematicalOperation)!))
            pheptoan = 0
        }
            
            //can bac 2
        else if label.text != "" && sender.tag == 20 && pheptoan == 1
        {
            label.text = String(sqrt(Double(stringWithMathematicalOperation)!))
            pheptoan = 0
        }
            
            //pi
        else if label.text != "" && sender.tag == 27 && pheptoan == 1
        {
            label.text = String(Double.pi)
            pheptoan = 0
        }
            
            //cong
        else if label.text != "" && sender.tag == 16 && pheptoan == 1
        {
            stringWithMathematicalOperation = stringWithMathematicalOperation + "+"
            label.text = stringWithMathematicalOperation
            pheptoan = 0
        }
            
            //tru
        else if label.text != "" && sender.tag == 15 && pheptoan == 1
        {
            stringWithMathematicalOperation = stringWithMathematicalOperation + "-"
            label.text = stringWithMathematicalOperation
            pheptoan = 0
        }
            
            //nhan
        else if label.text != "" && sender.tag == 14 && pheptoan == 1
        {
            stringWithMathematicalOperation = stringWithMathematicalOperation + "*"
            label.text = stringWithMathematicalOperation
            pheptoan = 0
        }
            
            //chia
        else if label.text != "" && sender.tag == 13 && pheptoan == 1
        {
            stringWithMathematicalOperation = stringWithMathematicalOperation + "/"
            label.text = stringWithMathematicalOperation
            pheptoan = 0
        }
            
            //dau cham
        else if label.text != "" && sender.tag == 18 && pheptoan == 1
        {
            stringWithMathematicalOperation = stringWithMathematicalOperation + "."
            label.text = stringWithMathematicalOperation
            pheptoan = 0
        }
            
            //dau (
        else if label.text != "" && sender.tag == 11
        {
            stringWithMathematicalOperation = stringWithMathematicalOperation + "("
            label.text = stringWithMathematicalOperation
            pheptoan = 0
            phepdem = phepdem  + 1
        }
            
            //dau )
        else if label.text != "" && sender.tag == 12
        {
            stringWithMathematicalOperation = stringWithMathematicalOperation + ")"
            label.text = stringWithMathematicalOperation
            pheptoan = 1
            phepdem = phepdem  - 1
            
        }
    }
}

