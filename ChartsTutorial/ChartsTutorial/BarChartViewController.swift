//
//  BarChartViewController.swift
//  ChartsTutorial
//
//  Created by Duy Bui on 4/20/19.
//  Copyright © 2019 iOSTemplates. All rights reserved.
//

import UIKit
import Charts

class BarChartViewController: UIViewController {

  @IBOutlet weak var barChartView: BarChartView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    barChartView.animate(yAxisDuration: 2.0)
    barChartView.pinchZoomEnabled = false
    barChartView.drawBarShadowEnabled = false
    barChartView.drawBordersEnabled = false
    barChartView.doubleTapToZoomEnabled = false
    barChartView.drawGridBackgroundEnabled = true
    barChartView.chartDescription?.text = "Bar Chart View"
    
    setChart(dataPoints: players, values: goals.map { Double($0) })
  }
  
  
  func setChart(dataPoints: [String], values: [Double]) {
    barChartView.noDataText = "You need to provide data for the chart."
    
    var dataEntries: [BarChartDataEntry] = []
    
    for i in 0..<dataPoints.count {
      let dataEntry = BarChartDataEntry(x: Double(i), y: Double(values[i]))
      dataEntries.append(dataEntry)
    }
    
    let chartDataSet = BarChartDataSet(values: dataEntries, label: "Bar Chart View")
    let chartData = BarChartData(dataSet: chartDataSet)
    barChartView.data = chartData
  }
}
