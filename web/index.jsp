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
    //场景
    var scene = new THREE.Scene();

    var container = document.getElementById('canvasdiv');
    var width = canvasdiv.clientWidth;
    var height = canvasdiv.clientHeight;
    //摄像机
    var camera = new THREE.PerspectiveCamera(90, width / height, 0.1, 1000);
    //摄像机摆放位置
    camera.position.set(5,3,10);

    //渲染器
    var renderer = new THREE.WebGLRenderer();
    renderer.setSize(width, height);
    //设置渲染位置
    canvasdiv.appendChild( renderer.domElement );

    //绘制图形  我将threejs中的物体理解为模型+材料
    //模型
    var geometry = new THREE.BoxGeometry( 1,2,1 );
    //材质
    var material = new THREE.MeshBasicMaterial( { color: 0x645d50 } );
    //有了这两者，我们就可以构建一个长方体方块了。
    var cube = new THREE.Mesh( geometry, material );
    //添加到场景
    scene.add(cube);

    //球形物体同上
    var geometry = new THREE.SphereGeometry( 0.5,100,100 );
    var material = new THREE.MeshBasicMaterial( { color: 0xb9c16c } );
    var ball = new THREE.Mesh( geometry,material );
    ball.position.set( 0,0,1 );
    scene.add(ball);

    //渲染
    renderer.render(scene, camera);

</script>
</html>
