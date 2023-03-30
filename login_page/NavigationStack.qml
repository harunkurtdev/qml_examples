import QtQuick 2.5
import QtQuick.Controls 1.4

StackView {
    id: navigationStack

    readonly property int transitionDuration: 300

    onCurrentItemChanged: {
        if (currentItem && overlay.visibleChildren.length === 0) {
            currentItem.forceActiveFocus()
        }
    }

    delegate: StackViewDelegate {
        pushTransition: StackViewTransition {
            ParallelAnimation {
                PropertyAnimation {
                    target: enterItem
                    property: "scale"
                    from: 1.4
                    to: 1
                    duration: navigationStack.transitionDuration
                }

                PropertyAnimation {
                    target: enterItem
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: navigationStack.transitionDuration
                }
            }

            ParallelAnimation {
                PropertyAnimation {
                    target: exitItem
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: navigationStack.transitionDuration / 2
                }
            }
        }

        popTransition: StackViewTransition {
            ParallelAnimation {
                PropertyAnimation {
                    target: exitItem
                    property: "scale"
                    from: 1
                    to: 1.4
                    duration: navigationStack.transitionDuration / 2
                }

                PropertyAnimation {
                    target: exitItem
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: navigationStack.transitionDuration / 2
                }
            }

            ParallelAnimation {
                PropertyAnimation {
                    target: enterItem
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: navigationStack.transitionDuration
                }
            }
        }
    }
}
