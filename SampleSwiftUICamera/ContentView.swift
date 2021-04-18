//
//  ContentView.swift
//  SampleSwiftUICamera
//
//  Created by 濱田一輝 on 2021/04/17.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = AVFoundationViewModel()
    
    var body: some View {
        ZStack {
            CALayerView(layer: viewModel.previewLayer!)
        }
        .onAppear {
            self.viewModel.startSession()
        }
        .onDisappear {
            self.viewModel.stopSession()
        }
    }
}


struct CALayerView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIViewController
    
    var layer: CALayer
    
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        
        layer.frame = viewController.view.layer.frame
        viewController.view.layer.addSublayer(layer)
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        layer.frame = uiViewController.view.layer.frame
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
