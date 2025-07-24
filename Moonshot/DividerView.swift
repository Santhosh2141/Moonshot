//
//  DividerView.swift
//  Moonshot
//
//  Created by Santhosh Srinivas on 24/07/25.
//

import SwiftUI

struct DividerView: View {
    var body: some View {
        // this is a custom divider
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

struct DividerView_Previews: PreviewProvider {
    static var previews: some View {
        DividerView()
    }
}
