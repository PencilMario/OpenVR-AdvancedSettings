import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import ovras.advsettings 1.0
import "../../common"

GroupBox {
    id: cameraGroupBox
    Layout.fillWidth: true

    label: MyText {
        leftPadding: 10
        text: "相机:(需要重启SteamVR)"
        bottomPadding: -10
    }
    background: Rectangle {
        color: "transparent"
        border.color: "#d9dbe0"
        radius: 8
    }

    ColumnLayout {
        anchors.fill: parent

        Rectangle {
            color: "#d9dbe0"
            height: 1
            Layout.fillWidth: true
            Layout.bottomMargin: 5
        }

        RowLayout {
            spacing: 16

            MyToggleButton {
                id: steamvrCameraActiveToggle
                text: "启用相机"
                Layout.preferredWidth: 400
                onCheckedChanged: {
                       SteamVRTabController.setCameraActive(this.checked, false)
                    if(this.checked){
                        steamvrCameraBoundsToggle.enabled = true
                        steamvrCameraContToggle.enabled = true
                    }else{
                        steamvrCameraBoundsToggle.enabled = false
                        steamvrCameraContToggle.enabled = false
                    }
                }
            }


        }
        RowLayout {
            spacing: 16

            MyToggleButton {
                id: steamvrCameraBoundsToggle
                text: "边界碰撞时显示摄像头画面"
                Layout.preferredWidth: 400
                onCheckedChanged: {
                       SteamVRTabController.setCameraBounds(this.checked, false)
                }
            }
            Item{
                Layout.preferredWidth: 100
            }

            MyToggleButton {
                id: steamvrCameraContToggle
                text: "在控制器上显示摄像头视图"
                onCheckedChanged: {
                    SteamVRTabController.setCameraCont(this.checked, false)
                }
            }
        }

    }

    Component.onCompleted: {
        var c1 = SteamVRTabController.cameraActive
        steamvrCameraActiveToggle.checked = c1
        steamvrCameraBoundsToggle.checked = SteamVRTabController.cameraBounds
        steamvrCameraContToggle.checked = SteamVRTabController.cameraCont

        if(!c1){

            steamvrCameraBoundsToggle.enabled = false;
            steamvrCameraContToggle.enabled = false;
        }

    }

    Connections {
        target: SteamVRTabController
        onCameraActiveChanged: {
            steamvrCameraActiveToggle.checked = SteamVRTabController.cameraActive
        }
        onCameraContChanged: {
            steamvrCameraContToggle.checked = SteamVRTabController.cameraCont
        }
        onCameraBoundsChanged: {
            steamvrCameraBoundsToggle.checked = SteamVRTabController.cameraBounds
        }


    }
}
