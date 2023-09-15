import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtQuick.Scene3D 2.0

Item {
    width: 640
    height: 480

    // Three.js ile kullanacağımız canvas
    Canvas {
        id: glcanvas
        width: 640
        height: 480
    }

    // Three.js entegrasyonu
    property variant three: undefined
    function initializeThreeJS() {
        three = new THREE.WebGLRenderer({canvas: glcanvas.domElement});
        three.setSize(glcanvas.width, glcanvas.height);
        // Three.js ile 3D modelleme
        var geometry = new THREE.BoxGeometry(1, 1, 1);
        var material = new THREE.MeshBasicMaterial({color: 0x00ff00});
        var cube = new THREE.Mesh(geometry, material);
        three.scene.add(cube);
        three.camera.position.z = 5;
    }

    // QML uygulaması yüklendiğinde Three.js'i başlatın
    Component.onCompleted: initializeThreeJS()

    // Three.js karesini çiz
    function renderThreeJS() {
        three.render(three.scene, three.camera);
        // Three.js karesini sürekli olarak yeniden çizmek için animasyon döngüsü
        requestAnimationFrame(renderThreeJS);
    }

    // Three.js animasyon döngüsünü başlat
    renderThreeJS()
}
