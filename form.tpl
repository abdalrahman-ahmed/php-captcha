<!DOCTYPE html>
<html>
<head>
	<title>PHP Captcha</title>
</head>
<body>
	<img src='generate.php?captcha' />
	<form action='generate.php' method='post'>
		<input type='text' name='captcha' />
		<input type='submit' value='check' />
	</form>
</body>
</html>