var c, ctx;
function mergeImg(){
	c=document.getElementById("mycanvas");
	//console.log(c);
	ctx=c.getContext("2d");
	var imageObj1 = new Image();
	var imageObj2 = new Image();
	var imageObj3 = new Image();
	var imageObj4= new Image();
	
	imageObj1.width = imageObj2.width = imageObj3.width = imageObj4.width = "50";
	imageObj1.height = imageObj2.height = imageObj3.height = imageObj4.height = "50";
	imageObj1.src = "images/PDF.JPG"
	imageObj2.src = "images/PPT.JPG";
	imageObj3.src = "images/FILE.JPG";
	imageObj4.src = "images/DOC.JPG";
	console.log(imageObj1);
	console.log(imageObj2);
	console.log(imageObj3);
	console.log(imageObj4);
	ctx.drawImage(imageObj1, 0, 0, 50, 50);
	ctx.drawImage(imageObj2, 50, 0, 50, 50);
	ctx.drawImage(imageObj3,100,0,50,50);
	ctx.drawImage(imageObj4, 150, 0, 50, 50);
	/*imageObj1.onload = function() {
	   ctx.drawImage(imageObj1, 0, 0, 50, 50);
	   imageObj2.onload = function() {
		  ctx.drawImage(imageObj2, 40, 0, 50, 50);
		   imageObj3.onload = function(){
			   ctx.drawImage(imageObj3,80,0,50,50);
			   imageObj4.onload = function(){
				   ctx.drawImage(imageObj4, 120, 0, 50, 50);
				   var img = c.toDataURL("image/png");
				   document.write('<img src="' + img + '" />');
			   };
		   };
		  
	   };
	};*/
	
}
function sprite (options){
	var obj = {};
	console.log(options.context);	
	//options.context.clear(true);
	obj.context = options.context;
	obj.height = options.height;
	obj.width = options.width;
	obj.image = options.image;
        // Draw the animation
	
	obj.context.drawImage(obj.image,0,0,50,50,0,0,obj.width,obj.height);
	
	//return obj;
	
}

function demergeImg(){
	var spriteImage = new Image();
	spriteImage.src = "images/download.png";
	var canvas = document.getElementById("mycanvas");
	var context1 = canvas.getContext("2d");
	context1.clearRect(0, 0, canvas.width, canvas.height);
	var img = sprite({
		context : context1,
		width : 100,
		height : 100,
		image : spriteImage
	})
	
}
