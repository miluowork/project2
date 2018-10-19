<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script type="text/javascript" src="../js/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/base64.js"></script>
<script type="text/javascript" src="../js/layer/layer.js"></script>
<script type="text/javascript" src="../js/H-ui.js"></script>
<script type="text/javascript" src="../js/H-ui.admin.js"></script>
<script>
var myurl='${param.url}';
var context;
var video;
function play(){
 video = document.getElementById("source");
 context = canvas.getContext("2d");
var errocb = function () {
                          console.log('sth wrong!');
                     };
if (navigator.getUserMedia) { // 标准的API
                navigator.getUserMedia({ "video": true }, function (stream) {
                    video.src = stream;
                    video.play();
                }, errocb);
} else if (navigator.webkitGetUserMedia) { // WebKit 核心的API
                navigator.webkitGetUserMedia({ "video": true }, function (stream) {
                    video.src = window.URL.createObjectURL(stream);
                    video.play();
                }, errocb);
 }
}
function s(){
                context.drawImage(video, 0, 0, 320, 240);
               var a= canvas.toDataURL();
               var data=canvas.toDataURL();
data=data.split(',')[1];
data=window.atob(data);
var ia = new Uint8Array(data.length);
for (var i = 0; i < data.length; i++) {
    ia[i] = data.charCodeAt(i);
};
var blob=new Blob([ia], {type:"image/png"});

               var fd = new FormData();
fd.append("image",blob, "image.png");
fd.append("url",myurl);
fd.append("mypath","../uploadPic/Student");
var xhr = new XMLHttpRequest();
xhr.open('POST', "../Student/uploadPic", true);
xhr.onreadystatechange=function(){
	if(xhr.readyState==4){
	var j=eval("("+xhr.responseText+")");
	if(j.status==1){
	parent.returndata(j.url);
	layer_close();
	}
	}
};
xhr.send(fd);
               
            
}

</script>
<div>
<video id="source" width="320" height="240" autoplay></video>
<canvas id="canvas" width="320" height="240" style="display: none;"></canvas>
<button type="button" onclick="s();" style="width:100px;height: 30px;left:100px;position: relative;margin-top: 3px;">拍照</button>
</div>
<script>
play();
</script>