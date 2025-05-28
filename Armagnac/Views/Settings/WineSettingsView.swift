//
//  WineSettingsView.swift
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

struct WineSettingsView: View {
    @AppStorage("killOnTerminate") var killOnTerminate = true
    @AppStorage("defaultWineLocation") var defaultWineLocation = ArmagnacWineInstaller.libraryFolder

    var body: some View {
        Form {
//            Toggle("settings.toggle.kill.on.terminate", isOn: $killOnTerminate)
            Toggle("settings.wine.toggle.killOT", isOn: $killOnTerminate)

            ActionView(
                text: "settings.wine.armagnacwine.path",
                subtitle: defaultWineLocation.prettyPath(),
                actionName: "create.browse"
            ) {
                let panel = NSOpenPanel()
                panel.canChooseFiles = false
                panel.canChooseDirectories = true
                panel.allowsMultipleSelection = false
                panel.canCreateDirectories = true
                panel.directoryURL = ArmagnacWineInstaller.libraryFolder
                panel.begin { result in
                    if result == .OK, let url = panel.urls.first {
                        defaultWineLocation = url
                    }
                }
            }
        }
        .formStyle(.grouped)
        .fixedSize(horizontal: false, vertical: true)
        .frame(width: ViewWidth.medium)
    }
}

#Preview {
    WineSettingsView()
}
