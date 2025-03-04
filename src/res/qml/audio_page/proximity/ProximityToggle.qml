import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import ovras.advsettings 1.0
import "../../common"

MyToggleButton {
    id: audioMuteProximitySensorToggle
    Layout.preferredWidth: 600
    text: "接近传感器控制麦克风静音/取消静音"
    onClicked: {
        AudioTabController.setMicProximitySensorCanMute(checked, false)
    }
    Component.onCompleted: {
        if (AudioTabController.micDeviceIndex < 0) {
            audioMuteProximitySensorToggle.enabled = false
        } else {
            audioMuteProximitySensorToggle.enabled = true
            audioMuteProximitySensorToggle.checked = AudioTabController.micProximitySensorCanMute
        }
    }
    Connections {
        target: AudioTabController
        onMicProximitySensorCanMuteChanged: {
            audioMuteProximitySensorToggle.checked = AudioTabController.micProximitySensorCanMute
        }
    }
}
