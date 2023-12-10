import SwiftUI

struct TimeConverterView: View {
    @State private var inputValue = ""
    @State private var inputUnitIndex = 0
    @State private var outputUnitIndex = 1

    let timeUnits = ["Seconds", "Minutes", "Hours", "Days", "Week", "Month"]

    var convertedValue: Double {
        let inputSeconds = Double(inputValue) ?? 0
        let inputUnit = timeUnits[inputUnitIndex]
        let outputUnit = timeUnits[outputUnitIndex]

        var outputSeconds: Double = 0

        switch inputUnit {
        case "Seconds":
            outputSeconds = inputSeconds
        case "Minutes":
            outputSeconds = inputSeconds * 60
        case "Hours":
            outputSeconds = inputSeconds * 3600
        case "Days":
            outputSeconds = inputSeconds * 86400
        case "Week":
            outputSeconds = inputSeconds * 604800
        case "Month":
            outputSeconds = inputSeconds * 2592000
        default:
            break
        }

        switch outputUnit {
        case "Seconds":
            return outputSeconds
        case "Minutes":
            return outputSeconds / 60
        case "Hours":
            return outputSeconds / 3600
        case "Days":
            return outputSeconds / 86400
        case "Week":
            return outputSeconds / 604800
        case "Month":
            return outputSeconds / 2592000
        default:
            return 0
        }
    }

    var body: some View {
        VStack {
            Text("Time Converter")
                .font(.largeTitle)
                .padding()

            TextField("Enter value", text: $inputValue)
                .keyboardType(.decimalPad)
                .padding()

            Picker("Input Unit", selection: $inputUnitIndex) {
                ForEach(0..<timeUnits.count) {
                    Text(self.timeUnits[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Picker("Output Unit", selection: $outputUnitIndex) {
                ForEach(0..<timeUnits.count) {
                    Text(self.timeUnits[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Text("Converted Value: \(convertedValue, specifier: "%.2f") \(timeUnits[outputUnitIndex])")
                .padding()

            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TimeConverterView()
    }
}
