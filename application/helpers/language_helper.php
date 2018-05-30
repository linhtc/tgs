<?php

/**
 *
 *
 * @package 500ci_helper
 * @author Leon Tran <leon@agikigi.com>
 * @copyright (c) 2016, 500BITS
 * @link http://agikigi.com
 * @license MIT
 * @version beta.0.1
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 * Function fullURL
 *
 * @param n/a
 * @author Leon Tran <leon@agikigi.com>
 */
if (!function_exists('lang')) {

    function lang($line) {
        global $LANG;
        return ($t = $LANG->line($line)) ? $t : $line;
    }

}