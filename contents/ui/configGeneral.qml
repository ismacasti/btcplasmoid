import QtQuick 2.0
import QtQuick.Controls 1.2 as QtControls
import QtQuick.Layouts 1.0 as QtLayouts

Item {
    id: configGeneral
    width: childrenRect.width
    height: childrenRect.height
    property alias cfg_updateDelay: updateDelay.value



    QtLayouts.ColumnLayout {
        QtControls.GroupBox {
            title: i18n("Update delay")
            QtLayouts.Layout.fillWidth: true
            flat: true

            QtLayouts.RowLayout {
                QtControls.SpinBox {
                    id: updateDelay
                    QtLayouts.Layout.fillWidth: true
                    minimumValue: 0.1
                    suffix: i18n(" minutes")
                    decimals: 1
                    maximumValue: 60
                    stepSize: 1
                }
            }
        }
    }
}
