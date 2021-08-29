<a href="https://github.com/biswa-13/ElectronDemo/blob/master/README.md" target="_blank">Go 
  To Home</a><br/>
# HelloWorld Using Electorn<br/>
- Create a new node project</br>
&emsp;Ex: electronDemo<br/>
- Initialize the node project, for this open a command prompt and go to the project that is been created in above step (electronDemo), and enter below syntax.</br>
&emsp; <i><b> npm init</b></i><br/>
- After executing the above syntax it will ask you few inputs and finally creates a pacake.json file for you inside the new project.<br/>
- Now, open your package.json file and edit the file name availble with <b>main:</b> to <b>main.js</b>, as displayed below. <br/>
<img src="https://github.com/biswa-13/ElectronDemo/blob/master/images/3_packageJson_main.JPG"/>
- Lets create the <b>main.js</b>, create a new file inside the new project and name it as <i>main.js</i> and place the below piece of code in the file and save it.</br>
<pre>
const {app, BrowserWindow} = require ('electron')
const url = require('url')
const path = require('path')
let win

function crateWindow (){
	// Create the browser window.
	let win = new BrowserWindow({
		width:800,
		heigth:800,
		webPreferences:{
			nodeIntegration:true
		}
	})
	win.loadFile('index.html')
}

app.on('ready', crateWindow)
</pre>
<br/>
- Now it's time to create <b>index.html</b>, create a new file inside the project and name it as <i>index.html</i> and palce the below piece of codes inside it.<br/>

```
<html><head>
	<title>Electron Hello World</title>
</head>
<body><h1>Hello Electron</h1>
	Hey buddy! Congrats you are awsome .
</body>
</html>
```
<br/>
- It's time to run the project, open the command prompt and go to the project folder and execute below syntax.<br/>
&emsp;<i><b>electron main.js</b></i><br/>
- It will open a new window which should look like below image.<br/>
<hr/>
<img src="https://github.com/biswa-13/ElectronDemo/blob/master/images/4_electron_helloWorld.JPG" /> <br/>
<h5>Hurrey! you have completed the first step towards your ElectronJs Journey ...</h5>

