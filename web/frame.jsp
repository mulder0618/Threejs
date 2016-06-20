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

        var geometry1 = new THREE.SphereGeometry( 0.5,100,100 );
        var material1 = new THREE.MeshBasicMaterial( { color: 0x99ff33 } );
        var ball1 = new THREE.Mesh( geometry1,material1 );
        ball1.position.set( 1,0,2 );

        var geometry = new THREE.SphereGeometry( 0.5,100,100 );
        var material = new THREE.MeshBasicMaterial( { color: 0xb9c16c } );
        var ball = new THREE.Mesh( geometry,material );
        ball.position.set( 0,0,1 );

        myobj = new THREE.Object3D();
        myobj.add( ball1 );
        myobj.add( ball );
        scene.add( myobj );
    }


    var render = function () {
        //动画方法 回调render 递归调用
        requestAnimationFrame( render );
        myobj.rotation.x+=0.01;
        myobj.rotation.y+=0.01;
        renderer.render(scene,camera);
    }
    init()
    render()

</script>
</html>
