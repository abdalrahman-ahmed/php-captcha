<!--//
original source code is taken from:
https://github.com/alcrazy/php-captcha
copyright goes to Abdalrahman Ahmed
created by Abdalrahman Ahmed for form.tpl
//-->
<!DOCTYPE html>
<html>
<head>
	<title>PHP Captcha</title>
	<style type="text/css">
	body{
		text-align: center;
		margin: 0;
	}
	.center{
		display: inline-block;
		text-align: left;
		width: 100%;
		max-width: 600px;
		border: 10px solid rgba(0, 0, 0, 0.5);
		border-radius: 8px;
		margin: 10% auto auto auto;
	}
	.title_captcha {
		height: 28px;
		background-color: #6E87B1;
		color: #FEFEFE;
		font-size: 15px;
		font-weight: bold;
		line-height: 28px;
		padding: 0 10px;
		border-width: 1px;
		border-style: solid;
		border-color: #50668A #50668A #5C78A7 #50668A;
	}
	.content_captcha {
		border-width: 0px 1px 1px 1px;
		border-style: solid;
		border-color: #525252;
	}
	.footrform {
		background-color: #F2F2F2;
		border-top: 1px solid #DADADA;
		text-align: right;
		padding: 0 10px;
		height: 42px;
		line-height: 42px;
	}
	.footrform input[type="submit"] {
		background-color: #637DA9;
		border: 1px solid #1B3E74;
		color: #FEFEFE;
		cursor: pointer;
		padding: 4px 8px;
		font-weight: bold;
		box-shadow: inset 0px 0px 1px 0px #EEE;
		outline: none;
	}
	.helps {
		padding: 12px 10px;
		font-size: small;
		line-height: 16px;
	}

	.helps b {
		display: block;
		font-size: 14px;
	}

	.helps span {
		display: block;
	}

	.helps a,
	.input_captcha a {
		text-decoration: none;
		color: #556A9D;
		font-weight: 500;
	}
	.helps a:hover,
	.input_captcha a:hover {
		text-decoration: underline;
	}
	.img_input {
		padding: 0 10px 10px 10px;
	}

	.img_input .img {
		display: inline-block;
		border: 1px solid #D0D0D0;
		width: 50%;
		text-align: center;
		height: 52px;
	}

	.input_captcha {
		display: block;
		height: 28px;
		line-height: 28px;
		font-size: 12px;
	}
	.input_captcha span{
		font-weight: bold;
		color: #726B64;
	}
	.input_captcha a {
		margin: 0 0 0 10px;
		text-decoration: none;
	}
	.input_captcha input[type="text"] {
		border: 1px solid #D0D0D0;
		border-radius: 2px;
		outline: none;
		height: 18px;
		width: 140px;
		font-size: 14px;
	}

	input[type="text"]:focus {
		box-shadow: 0px 0px 2px 2px #8EBEEA;
	}
	</style>
	<script type="text/javascript">
	window.onload = function (e){
		e.preventDefault();
		document.getElementById('recaptcha').onclick = function (e){
			e.preventDefault();
			document.getElementById('captcha').innerHTML = "<img src=\"generate.php?captcha=image\">";
		};
		document.getElementById('soundcaptcha').onclick = function (e){
			e.preventDefault();
			var audioElement = document.createElement('audio');
			audioElement.setAttribute('src', 'generate.php?captcha=sound');
			audioElement.play();
		};
	};
	</script>
</head>
<body>
	<div class="center">
		<div class="title_captcha">Security Check Required</div>
		<div class="content_captcha">
			<form action='generate.php' method='post'>
				<div class="helps">
					<b>Security Check</b>
					<span>Please enter the text below.</span>
					<span>Can't read the text above? <a href="#" id="recaptcha">Try another text</a> or <a href="#" id="soundcaptcha">an audio captcha</a>.</span>
				</div>
				<div class="img_input">
					<div class="img" id="captcha">
						<img src="generate.php?captcha=image" />
					</div>
					<div class="input_captcha">
						<span>Text in the box: </span><input type="text" name="captcha"><a href="#">what is this?</a>
					</div>
				</div>
				<div class="footrform">
					<input type='submit' value='Submit' />
				</div>
			</form>
		</div>
	</div>
</body>
</html>