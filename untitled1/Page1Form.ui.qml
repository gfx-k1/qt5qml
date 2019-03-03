import QtQuick 2.7
import QtQuick.Controls 2.3
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs.qml 1.0
import QtDataVisualization 1.3
import QtQuick.Controls.Material 2.0
import QtQuick.Controls 1.4 as C
import modeldb 1.0

Page {
    width: 600
    height: 400

    header: Label {
        text: qsTr("Page 1")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Label {
        text: qsTr("You are on Page 1.")
        anchors.centerIn: parent
    }

    C.TableView {
         id: tableViewUser
         x: 8
         y: 8
         width: 1152
         height: 675
         verticalScrollBarPolicy: 2
         anchors.fill: parent
         clip: true

         model: myClass  /* Inserendo un debug su sqlquerymodel.cpp si ottengono i corretti "ROLE" poi riportati nella pagina7 all'interno di C.TableViewColumn.*/

         C.TableViewColumn {
             title: "User id"
             role: "IDuser"
             width: title.length * 10
         }
         C.TableViewColumn {
             title: "Nome"
             role: "nome"
             width: title.length * 50
         }
         C.TableViewColumn {
             title: "Cognome"
             role: "Cognome"
             width: title.length * 30
         }
         C.TableViewColumn {
             title: "Data di Nascita"
             role: "nascita"
             width: title.length * 10
         }
         C.TableViewColumn {
             title: "Comune di Provenienza"
             role: "localita"
             width: title.length * 15
         }

     }


}
