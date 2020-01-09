<%--
  Created by IntelliJ IDEA.
  User: 22775
  Date: 2020/1/7
  Time: 20:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    time:${message}  <br><br>
    name:${name}     <br><br>
    map:${map}      <br><br>
    map:${map.name}  &nbsp;&nbsp;&nbsp;  ${map.password}      <br><br>

    javascript:while(1){alert('Restart%20your%20brower%20to%20close%20this%20box!’)}
    javascript:R=0; x1=.1; y1=.05; x2=.25; y2=.24; x3=1.6; y3=.24; x4=300; y4=200; x5=300; y5=200; var DI= document.getElementsByTagName("img"); DIL=DI.length; function A(){for(i=0; i<DIL; i++){DIS=DI[ i ].style; DIS.position='absolute'; DIS.left=Math.sin(R*x1+i*x2+x3)*x4+x5+"px"; DIS.top=Math.cos(R*y1+i*y2+y3)*y4+y5+"px"}R++}tag=setInterval('A()',5 );document.onmousedown=function(){clearInterval(tag);for(i=0; i<DIL; i++){DI[i].style.position="static";}}; void(0)

</body>
</html>
