import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Popup {
    id: myDialogPopup

    implicitHeight: parent.height
    implicitWidth: parent.width

    property string dialogTitle: ""
    property string dialogText: ""
    property int dialogWidth: 600
    property int dialogHeight: 300

    property Item dialogContentItem: MyText {
        text: dialogText
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        Layout.fillWidth: true
    }

    property bool okClicked: false

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

    background: Rectangle {
        color: "black"
        opacity: 0.8
     }

    contentItem: Item {
        Rectangle {
            implicitWidth: dialogWidth
            implicitHeight: dialogHeight
            anchors.centerIn: parent
            radius: 24
            color: "#2a2e35"
            border.color: "#d9dbe0"
            border.width: 2
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 12
                MyText {
                    Layout.leftMargin: 16
                    Layout.rightMargin: 16
                    text: dialogTitle
                }
                Rectangle {
                    color: "#2a2e35"
                    height: 1
                    Layout.fillWidth: true
                }
                Item {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
                ColumnLayout {
                    id: dialogContent
                }
                Item {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
                RowLayout {
                    Layout.fillWidth: true
                    Layout.leftMargin: 24
                    Layout.rightMargin: 24
                    Layout.bottomMargin: 12
                    Item {
                        Layout.fillWidth: true
                    }
                    MyPushButton {
                        implicitWidth: 200
                        text: "确定"
                        onClicked: {
                            okClicked = true
                            myDialogPopup.close()
                        }
                    }
                    Item {
                        Layout.fillWidth: true
                    }
                }
            }
        }
    }

    Component.onCompleted: {
        dialogContentItem.parent = dialogContent
    }
}
