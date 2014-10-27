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
	<link rel="stylesheet" type="text/css" href="./css/stylesheet.css" />
	<script type="text/javascript">
	window.onload = function (e){
		e.preventDefault();
		var audioElement = document.createElement('audio');
		document.getElementById('recaptcha').onclick = function (e){
			e.preventDefault();
			document.getElementById('captcha').innerHTML = "<img src=\"generate.php?captcha=image&time="+new Date().getTime()+"\">";
		};
		document.getElementById('soundcaptcha').onclick = function (e){
			e.preventDefault();
			audioElement.ended = true;
			audioElement.setAttribute('src', 'generate.php?captcha=sound&time='+new Date().getTime());
			audioElement.play();
		};
		document.getElementById('showHide').onclick = function (e){
			e.preventDefault();
			if (document.getElementById('helpFor').className == 'none') {
				document.getElementById('helpFor').className = '';
			}else if(document.getElementById('helpFor').className == ''){
				document.getElementById('helpFor').className = 'none';
			}
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
						<span>Text in the box: </span><input type="text" name="captcha"><a href="#" id="showHide">what is this?</a>
					</div>
					<div id="helpFor" class="none">
						<b>Security Check</b>
						<span>This is a standard security test that we use to prevent spammers from creating fake accounts and spamming users.</span>
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