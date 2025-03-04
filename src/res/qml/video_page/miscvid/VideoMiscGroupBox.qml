import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import ovras.advsettings 1.0
import "../../common"

GroupBox {
    id: brightnessGroupBox
    Layout.fillWidth: true

    label: MyText {
        leftPadding: 10
        text: "其他:"
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
                id: videoMotionSmoothingToggle
                text: "运动平滑"
                onCheckedChanged: {
                       VideoTabController.setMotionSmoothing(this.checked, false)
                }
            }
            Item {
                Layout.preferredWidth: 20
            }

            MyToggleButton {
                id: videoAllowSupersampleFilteringToggle
                text: "高级超采样过滤"
                onCheckedChanged: {
                    VideoTabController.setAllowSupersampleFiltering(this.checked, false)
                }
            }
            Item {
                Layout.preferredWidth: 20
            }

            MyToggleButton {
                id: videoUseOverlayToggle
                text: "使用叠加层进行颜色处理"
                onCheckedChanged: {
                    VideoTabController.setIsOverlayMethodActive(this.checked, true)
                }
            }
        }

    }

    Component.onCompleted: {
        videoAllowSupersampleFilteringToggle.checked = VideoTabController.allowSupersampleFiltering
        videoMotionSmoothingToggle.checked = VideoTabController.motionSmoothing
        videoUseOverlayToggle.checked = VideoTabController.isOverlayMethodActive
    }

    Connections {
        target: VideoTabController
        onAllowSupersampleFilteringChanged: {
            videoAllowSupersampleFilteringToggle.checked = VideoTabController.allowSupersampleFiltering
        }

        onMotionSmoothingChanged: {
            videoMotionSmoothingToggle.checked = VideoTabController.motionSmoothing
        }
        onIsOverlayMethodActiveChanged:{
            videoUseOverlayToggle.checked = VideoTabController.isOverlayMethodActive
        }

    }
}
