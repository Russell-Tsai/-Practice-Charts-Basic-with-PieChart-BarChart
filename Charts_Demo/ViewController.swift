//
//  ViewController.swift
//  Charts_Demo
//
//  Created by APP Dimerco on 08/01/2018.
//  Copyright © 2018 APP Dimerco. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    @IBOutlet weak var number1: UISlider!
    @IBOutlet weak var number2: UISlider!
    @IBOutlet weak var number3: UISlider!
    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var pieChartView: PieChartView!
    
    // 三個 Slider value change 皆接至 renderCharts
    @IBAction func renderCharts(){
        barChartUpdate()
        pieChartUpdate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barChartUpdate()
        pieChartUpdate()

    }
    
    func barChartUpdate(){
        let entry1 = BarChartDataEntry(x: 1.0, y: Double(number1.value))
        let entry2 = BarChartDataEntry(x: 2.0, y: Double(number2.value))
        let entry3 = BarChartDataEntry(x: 3.0, y: Double(number3.value))

        let dataSet = BarChartDataSet(values: [entry1,entry2,entry3], label: "Widgets Type")
        let data = BarChartData(dataSets: [dataSet])

        barChartView.data = data
        barChartView.chartDescription?.text = "Number of Widgets by Type"

        //..All Other additions to this function will go here

        //This must stay at end of function
        barChartView.notifyDataSetChanged()
    }
    
    func pieChartUpdate(){
        let entry1 = PieChartDataEntry(value: Double(number1.value), label: "#1")
        let entry2 = PieChartDataEntry(value: Double(number2.value), label: "#2")
        let entry3 = PieChartDataEntry(value: Double(number3.value), label: "#3")
        
        let dataSet = PieChartDataSet(values: [entry1,entry2,entry3], label: "Widtet Types")
        let data = PieChartData(dataSet: dataSet)
        
        pieChartView.data = data
        pieChartView.chartDescription?.text = "Share of Widges by Type"
        
        //..All Other additions to this function will go here
        dataSet.colors = ChartColorTemplates.joyful()
        //避免連字顏色都跟著改變
        dataSet.valueColors = [UIColor.black]
        //其他顏色更動
        pieChartView.backgroundColor = UIColor.black
        //預設 PieCharts 中心為白色
        pieChartView.holeColor = UIColor.clear
        pieChartView.chartDescription?.textColor = UIColor.white
        pieChartView.legend.textColor = UIColor.white
        
        //Text 變動 (字型, 位置)
        pieChartView.legend.font = UIFont(name: "Futura", size: 10)!
        pieChartView.chartDescription?.font = UIFont(name: "Futura", size: 12)!
        pieChartView.chartDescription?.xOffset = pieChartView.frame.width + 30
        pieChartView.chartDescription?.yOffset = pieChartView.frame.height * (2/3)
        pieChartView.chartDescription?.textAlign = NSTextAlignment.left
        
        //This must stay at end of function
        pieChartView.notifyDataSetChanged()
    }

}

