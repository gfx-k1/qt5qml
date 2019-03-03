import QtQuick 2.3
import QtQuick.Controls 2.3
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3
import QtDataVisualization 1.3
import QtCharts 2.2
import QtQuick.Controls.Material 2.0
import QtQuick.Dialogs.qml 1.0
import modeldb 1.0

Page {
    width: 600
    height: 400
    property alias button: button
    property alias delayButton: delayButton

    header: Label {
        text: qsTr("Page 2")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Label {
        text: qsTr("You are on Page 2.")
        anchors.centerIn: parent
    }

    Switch {
        id: element
        x: 133
        y: 96
        text: qsTr("Switch")
        Material.accent: Material.Indigo
        Material.foreground: Material.Blue
    }

    DelayButton {
        id: delayButton
        x: 367
        y: 19
        text: qsTr("Button")
        Material.accent: Material.Green
        Material.foreground: Material.Green
    }

    Button {
        id: button
        x: 77
        y: 231
        text: qsTr("Button")
    }
}
