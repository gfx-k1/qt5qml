import QtQuick 2.3
import QtQuick.Controls 2.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Material 2.0
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0


ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Tabs")

    Material.theme: Material.Light
    Material.accent: Material.Red


    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form {
        }

        Page2Form {
            button.onClicked: {
                dialog.open()
}
            delayButton.onActivated: {
                dialog.open()






/*                MessageDialog
                        id: dialog
                        title: qsTr("this is a test")

                        function show(caption) {
                            dialog.text = qsTr("test ok");
                            dialog.open();
                        }
                }*/
}

            MessageDialog {
                    id: dialog
                    title: qsTr("this is a test")

                    function show(caption) {
                        dialog.text = qsTr("test ok");
                        dialog.open();
                    }
            }
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Page 1")
        }
        TabButton {
            text: qsTr("Page 2")
        }
    }
}
