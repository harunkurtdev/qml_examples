import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Scene3D 2.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: "QML ve Three.js Entegrasyonu Örneği"

    // Three.js ve QML entegrasyonu için kullanılan örnek
    Scene3D {
        anchors.fill: parent
        objectName: "scene"
        focus: true

        // Yukarıdaki örneği burada kullanabilirsiniz
        Item {
            width: 640
            height: 480

            Canvas {
                id: glcanvas
                width: 640
                height: 480
            }

            property variant three: undefined
            function initializeThreeJS() {
                three = new THREE.WebGLRenderer({canvas: glcanvas.domElement});
                three.setSize(glcanvas.width, glcanvas.height);
                var geometry = new THREE.BoxGeometry(1, 1, 1);
                var material = new THREE.MeshBasicMaterial({color: 0x00ff00});
                var cube = new THREE.Mesh(geometry, material);
                three.scene.add(cube);
                three.camera.position.z = 5;
            }

            Component.onCompleted: initializeThreeJS()

            function renderThreeJS() {
                three.render(three.scene, three.camera);
                requestAnimationFrame(renderThreeJS);
            }

//            renderThreeJS();
        }
    }
}
