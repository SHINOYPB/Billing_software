<?php

defined('BASEPATH') OR exit('No direct script access allowed');


if ( ! function_exists('is_allowed'))
{
	function is_allowed($permission) {
		$CI =& get_instance();
		return $CI->is_allowed($permission);
	}
}
