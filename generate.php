<?php
/*
 Generate random text to print it on image using PHP-GD book
 @ Author      : Abdalrahman Ahmed
 @ Author url  : https://github.com/abdalrahman-ahmed
 @ License     : GNU GENERAL PUBLIC LICENSE  
 @ Github url  : https://github.com/abdalrahman-ahmed/php-captcha
 @ File name   : generate.php
 @ Copyright to: Abdalrahman Ahmed
 @ version     : 1.0
*/

# Needed
/*
PHP GD create a simple image with GD library
To Install Extension "GD" on linux, open terminal and type:
on Debian linux ~ # 
sudo apt-get install php5-gd
--------
on Redhat linux ~ # 
sudo yum install php-gd
sudo yum install php5-gd
--------
after installation, restart your apache server using:
sudo /etc/init.d/apache2 restart
*/

// Check Required for exists Extension GD or not
if(!extension_loaded('GD') || !function_exists('imagecreatetruecolor')) exit('Note: Extension GD is not loaded. to <a href="http://php.net/gd">Install</a>');

session_start();

// Check if set POST 'captcha' AND if 'SESSION' Equals 'captcha'
if((isset($_POST['captcha']) && isset($_SESSION['captcha'])) && (strtolower($_POST['captcha']) == strtolower($_SESSION['captcha']))){
	unset($_SESSION['captcha']);
	echo true;
}elseif(isset($_GET['captcha'])){
	$http = isset($_SERVER['REQUEST_SCHEME']) ? $_SERVER['REQUEST_SCHEME'].'://' : 'http://';
	if (!isset($_SERVER['HTTP_REFERER']) || $_SERVER['HTTP_REFERER'] != $http.$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF']) exit;

	if($_GET['captcha'] === 'sound' && isset($_SESSION['captcha'])){
		$sound_files = str_split(strtolower($_SESSION['captcha']));
		foreach ($sound_files as $key => $value) {
			@$sound_file .= file_get_contents('sound/'.$sound_files[$key].'.mp3');
		}
		header('Content-Type: audio/mpeg');
		echo $sound_file;
	}elseif($_GET['captcha'] === 'image'){
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

		// Image width
		$width = 200;

		// Image height
		$height = 50;

		// White color
		$white = 0xFFFFFF;

		// Black color
		$black = 0x000000;

		// Font file 
		$fontFile = './font/Ubuntu-B.ttf';

		// y - Alignment from left to right
		$y = 12;

		// x - Alignment from top to bottom
		$x = 36;

		// angle - rotate text angle, here function "rand" generate random number from [0-6] or [-6-0]
		$angle = rand(6,-6);

		// Font size
		$fontSize = 20;

		// Text Captcha
		$text = $_SESSION['captcha'];

		// setting the image header in order to proper display the image
		header("Content-Type: image/png");
		
		// Create the image (Width=200,Height=50)
		$image = imagecreatetruecolor($width, $height);

		// Background color
		imagefilledrectangle($image, 0, 0, $width, $height, $white);

		// Add the (image,font-size,angle,y,x,text-color,font-file,text)
		imagettftext($image, $fontSize, $angle, $y, $x, $black, $fontFile, $text);

		// Using imagepng() results in clearer text compared with imagejpeg()
		imagepng($image);
		imagedestroy($image);
	}
}else{
	// Simple form HTML to send POST captcha
	header("Content-Type: text/html");
	$TPL = file_get_contents('./tpl/form.tpl');
	echo $TPL;
}
?>
