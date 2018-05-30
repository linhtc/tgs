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
if (!function_exists('full_url')) {

    function full_url() {
        $pageURL = 'http';

        if (isset($_SERVER["HTTPS"]) && $_SERVER["HTTPS"] == "on") {
            $pageURL .= "s";
        }

        $pageURL .= "://";
        if ($_SERVER["SERVER_PORT"] != "80") {
            $pageURL .= $_SERVER["SERVER_NAME"] . ":" . $_SERVER["SERVER_PORT"] . $_SERVER["REQUEST_URI"];
        } else {
            $pageURL .= $_SERVER["SERVER_NAME"] . $_SERVER["REQUEST_URI"];
        }
        return $pageURL;
    }

}

/**
 * Function debug
 *
 * @param var $object
 * @author Leon Tran <leon@agikigi.com>
 *
 */
if (!function_exists('debug')) {

    function debug($object, $is_die = TRUE) {
        echo "<pre>";
        var_dump($object);
        echo "</pre>";
        if ($is_die) {
            die();
        }
    }

}

if (!function_exists('url_title')) {

    function url_title($str, $separator = 'dash', $lowercase = FALSE) {
        if ($separator == 'dash') {
            $search = '_';
            $replace = '-';
        } else {
            $search = '-';
            $replace = '_';
        }

        $trans = array(
            '&\#\d+?;' => '',
            '&\S+?;' => '',
            '\s+' => $replace,
            '[^a-z0-9\-\._]' => '',
            $replace . '+' => $replace,
            $replace . '$' => $replace,
            '^' . $replace => $replace,
            '\.+$' => ''
        );

        $str = strip_tags($str);

        foreach ($trans as $key => $val) {
            $str = preg_replace("#" . $key . "#i", $val, $str);
        }

        if ($lowercase === TRUE) {
            $str = strtolower($str);
        }

        return trim(stripslashes($str));
    }

}

if (!function_exists('make_slug')) {

    function make_slug($string, $remove_special = FALSE) {
        $CI = & get_instance();

        $CI->load->helper('text');
        $CI->load->helper('url');

        if ($string) {
            $string = url_title(convert_accented_characters($string));
            // add by hungtd
            // remove special char
            $special_array = array(
                '.',
            );
            $replace_array = array(
                ''
            );
            $string = strtolower(str_replace($special_array, $remove_special, $string));
        }

        return $string;
    }

}

if (!function_exists('get_extra_params_from_url')) {

    function get_extra_params_from_url() {
        $params = $_GET;
        $return_extra_params = '';
        if (count($params) > 0) {
            $tempt = 0;
            foreach ($params as $key => $value) {
                if ($key != 's') {
                    if ($tempt == 0)
                        $return_extra_params = $return_extra_params . $key . '=' . $value;
                    else
                        $return_extra_params = $return_extra_params . '&' . $key . '=' . $value;
                    $tempt = $tempt + 1;
                }
                else {
                    $params_sort = $params['s'];
                    foreach ($params_sort as $key_sort => $value_sort) {
                        if ($tempt == 0)
                            $return_extra_params = $return_extra_params . 's[' . $key_sort . ']' . '=' . $value_sort;
                        else
                            $return_extra_params = $return_extra_params . '&' . 's[' . $key_sort . ']' . '=' . $value_sort;
                        $tempt = $tempt + 1;
                    }
                }
                $tempt = $tempt + 1;
            }
        }
        return $return_extra_params;
    }

}

if (!function_exists('get_folder_upload')) {

    function get_folder_upload($folder_uri, $is_make_ymd_folder = TRUE) {
        // get dir path
        $dir = MEDIAPATH . 'media/' . $folder_uri;

        // get date
        $sub_folder = ($is_make_ymd_folder) ? date('Y') . '/' . date('m') . '/' . date('d') : '';

        if (is_dir($dir)) {
            $dir_all = ($is_make_ymd_folder) ? $dir . '/' . $sub_folder : $dir;

            // get folder path
            $dir_all = str_replace('//', '/', $dir_all);

            // make dir
            if (!is_dir($dir_all)) {
                mkdir($dir_all, 0775, TRUE);
            }

            return array(
                'dir' => $dir_all,
                'sub_dir' => $sub_folder
            );
        }

        return FALSE;
    }

}

if (!function_exists('upload_file')) {

    function upload_file($field_name, $upload_uri, $type = 'png|PNG|jpg|JPG|jpge|JPGE', $max_size = '5000', $max_width = '5000', $max_height = '5000', $is_make_ymd_folder = TRUE) {
        $CI = & get_instance();

        $dir_upload = get_folder_upload($upload_uri, $is_make_ymd_folder);

        $config = array(
            'upload_path' => $dir_upload['dir'],
            'allowed_types' => $type,
            'max_size' => $max_size,
            'max_width' => $max_width,
            'max_height' => $max_height,
            'encrypt_name' => TRUE
        );

        $CI->load->library('upload', $config);

        if (!$CI->upload->do_upload($field_name)) {
            return array(
                'error' => 1,
                'message' => $CI->upload->display_errors()
            );
        } else {
            $file = $CI->upload->data();

            return array(
                'error' => 0,
                'file' => $file,
                'sort_link' => $dir_upload['sub_dir'] . '/' . $file['file_name']
            );
        }
    }

}

if (!function_exists('get_total_count')) {

    function get_total_count( $url = '' ){
        $pageURL = base_urL();
        $url = ($url == '' ) ? $pageURL : $url;
        $params = 'select url, normalized_url, share_count, like_count, comment_count, total_count, click_count, comments_fbid, commentsbox_count from link_stat where url = "' . $url . '"';
        $component = urlencode( $params );
        $url = 'http://graph.facebook.com/fql?q='.$component;
        $fbLIkeAndSahre = json_decode( file_get_contents( $url ) );
        $getFbStatus = $fbLIkeAndSahre->data['0'];
        if ($getFbStatus->total_count == NULL) {
            return 0;
        } else {
            return $getFbStatus->total_count;
        }
    }

}

if (!function_exists('get_comment_box_count')) {

    function get_comment_box_count( $url = '' ){
        $pageURL = base_urL();
        $url = ($url == '' ) ? $pageURL : $url;
        $params = 'select url, normalized_url, share_count, like_count, comment_count, total_count, click_count, comments_fbid, commentsbox_count from link_stat where url = "' . $url . '"';
        $component = urlencode( $params );
        $url = 'http://graph.facebook.com/fql?q='.$component;
        $fbLIkeAndSahre = json_decode( file_get_contents( $url ) );
        $getFbStatus = $fbLIkeAndSahre->data['0'];
        if ($getFbStatus->commentsbox_count == NULL) {
            return 0;
        } else {
            return $getFbStatus->commentsbox_count;
        }
    }

}

if (!function_exists('check_number_phone_non_84')) {

    function check_number_phone_non_84($phone_number = "") {

        if (is_numeric($phone_number) && strlen($phone_number) > 9 && strlen($phone_number) < 12) {
            $operator = array(
                "096" => "VIETTEL",
                "0162" => "VIETTEL",
                "0163" => "VIETTEL",
                "0164" => "VIETTEL",
                "0167" => "VIETTEL",
                "0165" => "VIETTEL",
                "0166" => "VIETTEL",
                "0169" => "VIETTEL",
                "0168" => "VIETTEL",
                "097" => "VIETTEL",
                "098" => "VIETTEL",
                "0124" => "VINAPHONE",
                "0123" => "VINAPHONE",
                "0129" => "VINAPHONE",
                "094" => "VINAPHONE",
                "0125" => "VINAPHONE",
                "0127" => "VINAPHONE",
                "091" => "VINAPHONE",
                "0122" => "MOBIFONE",
                "0126" => "MOBIFONE",
                "0121" => "MOBIFONE",
                "0128" => "MOBIFONE",
                "093" => "MOBIFONE",
                "0120" => "MOBIFONE",
                "090" => "MOBIFONE",
                "0188" => "VIETNAMOBILE",
                "092" => "VIETNAMOBILE",
                "0186" => "VIETNAMOBILE",
                "099" => "GTEL",
                "0199" => "GTEL",
            );

            $get4 = substr($phone_number, 0, 3);
            $get5 = substr($phone_number, 0, 4);
            if (isset($operator[$get4])) {
                return TRUE;
            } elseif (isset($operator[$get5])) {
                return TRUE;
            } else {
                return FALSE;
            }
        } else {
            return FALSE;
        }
    }

}