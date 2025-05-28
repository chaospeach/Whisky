//
//  UpdateSettingsView.swift
//  Armagnac
//
//  This file is part of Armagnac.
//
//  Armagnac is free software: you can redistribute it and/or modify it under the terms
//  of the GNU General Public License as published by the Free Software Foundation,
//  either version 3 of the License, or (at your option) any later version.
//
//  Armagnac is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
//  without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
//  See the GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License along with Armagnac.
//  If not, see https://www.gnu.org/licenses/.
//

import SwiftUI
import ArmagnacKit

struct UpdateSettingsView: View {
    @AppStorage("SUEnableAutomaticChecks") var armagnacUpdate = false
    @AppStorage("checkArmagnacWineUpdates") var checkArmagnacWineUpdates = false

    var body: some View {
        Form {
            Toggle("settings.toggle.armagnac.updates", isOn: $armagnacUpdate)
                .disabled(true)
            Toggle("settings.toggle.armagnacwine.updates", isOn: $checkArmagnacWineUpdates)
                .disabled(true)
        }
        .formStyle(.grouped)
        .fixedSize(horizontal: false, vertical: true)
        .frame(width: ViewWidth.medium)
    }
}

#Preview {
    UpdateSettingsView()
}
