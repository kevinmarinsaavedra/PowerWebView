//
//  MainViewModel.swift
//  WebView
//
//  Created by Kevin Marin on 24/3/24.
//

import Foundation
import UIKit

class MainViewModel: NSObject, ObservableObject {
    @Published var showWebView = false
    let startUrl: String = "https://sede.madrid.es/portal/site/tramites/menuitem.62876cb64654a55e2dbd7003a8a409a0/?vgnextoid=3e3debb41f6e2410VgnVCM2000000c205a0aRCRD&vgnextchannel=775ba38813180210VgnVCM100000c90da8c0RCRD&vgnextfmt=default"
}

