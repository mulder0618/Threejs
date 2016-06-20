<%--
  Created by IntelliJ IDEA.
  User: mulder
  Date: 16/6/20
  Time: 上午10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>threejs</title>
    <style type="text/css">
        #canvasdiv{
            width: 600px;
            height: 600px;
        }
    </style>
    <script src="js/three.min.js"></script>
</head>
<body>
<div id="canvasdiv">

</div>
</body>

<script>

    var container,camera,scene,renderer,myobj;

    var init = function () {
        container = document.getElementById('canvasdiv')
        scene = new THREE.Scene();
        var width = canvasdiv.clientWidth;
        var height = canvasdiv.clientHeight;
        camera = new THREE.PerspectiveCamera( 90, width/height, 0.1, 1000 );
        camera.position.set( 0,0,5 )
        renderer = new THREE.WebGLRenderer();
        renderer.setSize( width, height );
        canvasdiv.appendChild( renderer.domElement );

        var geometry = new THREE.Geometry();
        var material = new THREE.LineBasicMaterial( { vertexColors: true } );
        var color1 = new THREE.Color( 0x444444 ), color2 = new THREE.Color( 0xFF0000 );

        // 线的材质可以由2点的颜色决定
        var p1 = new THREE.Vector3( -2, 0, 0 );
        var p2 = new THREE.Vector3(  2, 0, 0 );
        geometry.vertices.push(p1);
        geometry.vertices.push(p2);
        geometry.colors.push( color1, color2 );

        for(var i=0;i<10;i++){
            var line = new THREE.Line( geometry, material, THREE.LinePieces );
            line.position.y = i+line.position.y;
            myobj = new THREE.Object3D();
            myobj.add( line );
            scene.add( myobj );
        }

    }


    var render = function () {
        //动画方法 回调render 递归调用
        requestAnimationFrame( render );
        //myobj.rotation.x+=0.01;
        //myobj.rotation.y+=0.01;
        renderer.render(scene,camera);
    }
    init()
    render()

</script>
</html>
