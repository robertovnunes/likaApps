<?php
/**
* @copyright	Copyright (C) 2011 Simplify Your Web, Inc. All rights reserved.
* @license		GNU General Public License version 3 or later; see LICENSE.txt
*/

// no direct access
defined('_JEXEC') or die;

class thumbnail {
	
	var $imgSrc, $imgType, $myImage, $thumb, $imagewidth, $imageheight, $width, $height;
	
	function getHeight() {
		return $this->height;
	}
	
	function setImage($image, $extension)
	{		
		$this->imgSrc = $image;	
		
		$this->imgType = $extension;
		
		switch ($this->imgType){
			case 'bmp': $this->myImage = imagecreatefromwbmp($this->imgSrc); break;
			case 'gif': $this->myImage = imagecreatefromgif($this->imgSrc); break;
			case 'jpg': case 'jpeg': $this->myImage = imagecreatefromjpeg($this->imgSrc); break;
			case 'png': $this->myImage = imagecreatefrompng($this->imgSrc); break;
			default :
				$err = 'Unsupported filetype';
				trigger_error($err, E_USER_WARNING);
				throw new Exception($err);
			break;
		}
	}
	
	function createThumb($width, $height, $crop)
	{		 
		// getting the image dimensions
		$imagesize = getimagesize($this->imgSrc);
		$this->imagewidth = $imagesize[0];
		$this->imageheight = $imagesize[1];
		
		$x = 0;
		$y = 0;
		$this->width = $width;
		$this->height = $height;
		if ($this->imagewidth < $width && $this->imageheight < $height) { // picture smaller than thumb therefore there is no crop
			$this->width = $this->imagewidth;
			$this->height = $this->imageheight;
			$w = $this->imagewidth;
			$h = $this->imageheight;
			//$y = -($height - $this->imageheight) / 2;
		} else if ($this->imagewidth < $width || $this->imageheight < $height) { // picture smaller in width or height
			if ($this->imagewidth < $width) { // smaller in width
				if ($crop) {
					$h = $height;
					$x = ($this->imagewidth - $width) / 2;
					$w = $width;
				} else {
					$ratio = min($width/$this->imagewidth, $height/$this->imageheight);
					$this->width = $this->imagewidth * $ratio;
					$this->height = $this->imageheight * $ratio;
					$w = $this->imagewidth;
					$h = $this->imageheight;
				}
			} else { // smaller in height
				if ($crop) {
					$h = $this->imageheight;
					$x = ($this->imagewidth - $width) / 2;
					$w = $width;
					$this->height = $this->imageheight;
					//$y = -($height - $this->imageheight) / 2;
				} else {					
					$ratio = min($width/$this->imagewidth, $height/$this->imageheight);
					$this->width = $this->imagewidth * $ratio;
					$this->height = $this->imageheight * $ratio;
					$w = $this->imagewidth;
					$h = $this->imageheight;
					//$y = -($height - $this->imageheight) / 2;
				}
			}
		} else {		
			if ($crop) {
				$ratio = max($width/$this->imagewidth, $height/$this->imageheight);
				$h = $height / $ratio;
				$x = ($this->imagewidth - $width / $ratio) / 2;
				$w = $width / $ratio;
			} else {
				$ratio = min($width/$this->imagewidth, $height/$this->imageheight);
				$this->width = $this->imagewidth * $ratio;
				$this->height = $this->imageheight * $ratio;
				$w = $this->imagewidth;
				$h = $this->imageheight;
				//$y = -($height - $this->height) / 2;
			}
		}	
			
		$this->thumb = imagecreatetruecolor($this->width, $this->height);
				
		// preserve transparency
		if ($this->imgType == "gif" || $this->imgType == "png") {
			imagecolortransparent($this->thumb, imagecolorallocatealpha($this->thumb, 0, 0, 0, 127));
			imagealphablending($this->thumb, false);
			imagesavealpha($this->thumb, true);
		} else {
			//imagefill($this->thumb, 0, 0, imagecolorallocate($this->thumb, 255, 255, 255));
		}
		
		imagecopyresampled($this->thumb, $this->myImage, 0, 0, $x, $y, $this->width, $this->height, $w, $h);
	}
	
	function renderImage($filename)
	{			
		switch ($this->imgType){
			case 'bmp': imagewbmp($this->thumb, $filename); break;
			case 'gif': imagegif($this->thumb, $filename); break;
			case 'jpg': case 'jpeg': imagejpeg($this->thumb, $filename); break;
			case 'png': imagepng($this->thumb, $filename); break;
		}		
		imagedestroy($this->thumb);
		imagedestroy($this->myImage);	
	}

}
?>