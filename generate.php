<?php
// original source code is taken from:
// https://github.com/alcrazy/php-captcha
// copyright goes to Abdalrahman Ahmed
// created by Abdalrahman Ahmed for generate.php

// PHP GD create a simple image with GD library
// To Install Extension "GD"
// on Debian linux ~ # 
// apt-get install php5-gd
// on Redhat linux ~ # 
// yum install php-gd
// yum install php5-gd

session_start();

// Check if set POST 'captcha' AND if 'SESSION' Equals 'captcha'
if((isset($_POST['captcha']) && isset($_SESSION['captcha'])) && (strtolower($_POST['captcha']) == strtolower($_SESSION['captcha']))){
	unset($_SESSION['captcha']);
	echo true;
}else{
	if(isset($_GET['captcha'])){
		// function generate random characters + numbers
		function generateRandStr($length){
			for($i=0; $i<$length; $i++){
				$randnum = mt_rand(0,61);
				if($randnum < 10) @$randstr .= chr($randnum+48);
				elseif($randnum < 36) @$randstr .= chr($randnum+55);
				else @$randstr .= chr($randnum+61);
			}
			return @$randstr;
		}

		// Create new SESSION captcha 
		$_SESSION['captcha'] = generateRandStr(10);

		// setting the image header in order to proper display the image
		header("Content-Type: image/png");

		// Create the image (Width=200,Height=50)
		$im = imagecreatetruecolor(200, 50);

		// Background color
		imagefilledrectangle($im, 0, 0, 200, 50, 0xFFFFFF);

		// Add the text
		imagettftext($im, 20, 1, 12, 36, 0x000000, './Ubuntu-B.ttf', $_SESSION['captcha']);

		// Using imagepng() results in clearer text compared with imagejpeg()
		imagepng($im);
		imagedestroy($im);
	}else{
		// Simple form HTML to send POST captcha
		header("Content-Type: text/html");
		$TPL = file_get_contents('form.tpl');
		echo $TPL;
	}
}
?>