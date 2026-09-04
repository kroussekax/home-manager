import QtQuick
import Quickshell
import Quickshell.Wayland

ShellRoot {
	PanelWindow {
		id: root

		anchors {
			top: true
			bottom: true
			left: true
			right: true
		}

		color: "transparent"

		WlrLayershell.layer: WlrLayer.Overlay

		// Only the AssistiveTouch widget receives input.
		// Everything else passes through to the application underneath.
		mask: Region {
			item: circle
		}

        Item {
            id: circle

            property bool expanded: false

            readonly property real normalSize: 64
            readonly property real expandedSize: 192

            width: expanded ? expandedSize : normalSize
            height: expanded ? expandedSize : normalSize

            x: 100
            y: 300

            // Smooth expansion
            Behavior on width {
                NumberAnimation {
                    duration: 250
                    easing.type: Easing.OutCubic
                }
            }

            Behavior on height {
                NumberAnimation {
                    duration: 250
                    easing.type: Easing.OutCubic
                }
            }

            // Smooth movement ONLY when we're expanding/collapsing
            Behavior on x {
                id: xBehavior

                enabled: true

                NumberAnimation {
                    duration: 250
                    easing.type: Easing.OutCubic
                }
            }

            Behavior on y {
                id: yBehavior

                enabled: true

                NumberAnimation {
                    duration: 250
                    easing.type: Easing.OutCubic
				}
			}

			Rectangle {
				anchors.fill: parent

				radius: 20

				color: "#111111"

				border.width: 3
				border.color: "#333234"
			}

			MouseArea {
				anchors.fill: parent

				property real grabOffsetX
				property real grabOffsetY
				property bool moved: false

				onPressed: function(mouse) {
					if (circle.expanded)
					return

					grabOffsetX = mouse.x
					grabOffsetY = mouse.y
					moved = false

					xBehavior.enabled = false
					yBehavior.enabled = false
				}

				onPositionChanged: function(mouse) {
					if (!pressed || circle.expanded)
					return

					var newX = circle.x + mouse.x - grabOffsetX
					var newY = circle.y + mouse.y - grabOffsetY

					if (Math.abs(newX - circle.x) > 1 ||
					Math.abs(newY - circle.y) > 1) {
						moved = true
					}

					circle.x = Math.max(
						0,
						Math.min(newX, root.width - circle.width)
					)

					circle.y = Math.max(
						0,
						Math.min(newY, root.height - circle.height)
					)
				}

				onReleased: {
					xBehavior.enabled = true
					yBehavior.enabled = true

					if (moved)
					return

					if (!circle.expanded) {
						circle.x -= circle.normalSize
						circle.y -= circle.normalSize
						circle.expanded = true
					} else {
						circle.x += circle.normalSize
						circle.y += circle.normalSize
						circle.expanded = false
					}
				}
			}
        }
    }
}
