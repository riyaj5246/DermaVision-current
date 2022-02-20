//
//  RiskDetectionView.swift
//  DermaVision
//
//  Created by Riya Jain on 2/4/22.
//

import SwiftUI

struct RiskDetectionView: View {
    var body: some View {
            CustomController()
    }
}

struct RiskDetectionView_Previews: PreviewProvider {
    static var previews: some View {
        RiskDetectionView()
    }
}

struct CustomController : UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<CustomController>) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(withIdentifier: "Home")
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<CustomController>) {
        
    }
}
