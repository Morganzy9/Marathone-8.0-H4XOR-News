//
//  DetailsView.swift
//  Marathone 8.0 H4XOR News
//
//  Created by Ислам Пулатов on 9/22/23.
//

import SwiftUI

struct DetailsView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(url: "https://www.google.com")
    }
}

