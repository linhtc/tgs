<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/*
  | -------------------------------------------------------------------------
  | URI ROUTING
  | -------------------------------------------------------------------------
  | This file lets you re-map URI requests to specific controller functions.
  |
  | Typically there is a one-to-one relationship between a URL string
  | and its corresponding controller class/method. The segments in a
  | URL normally follow this pattern:
  |
  |	example.com/class/method/id/
  |
  | In some instances, however, you may want to remap this relationship
  | so that a different class/function is called than the one
  | corresponding to the URL.
  |
  | Please see the user guide for complete details:
  |
  |	http://codeigniter.com/user_guide/general/routing.html
  |
  | -------------------------------------------------------------------------
  | RESERVED ROUTES
  | -------------------------------------------------------------------------
  |
  | There are three reserved routes:
  |
  |	$route['default_controller'] = 'welcome';
  |
  | This route indicates which controller class should be loaded if the
  | URI contains no data. In the above example, the "welcome" class
  | would be loaded.
  |
  |	$route['404_override'] = 'errors/page_missing';
  |
  | This route will tell the Router which controller/method to use if those
  | provided in the URL cannot be matched to a valid route.
  |
  |	$route['translate_uri_dashes'] = FALSE;
  |
  | This is not exactly a route, but allows you to automatically route
  | controller and method names that contain dashes. '-' isn't a valid
  | class or method name character, so it requires translation.
  | When you set this option to TRUE, it will replace ALL dashes in the
  | controller and method URI segments.
  |
  | Examples:	my-controller/index	-> my_controller/index
  |		my-controller/my-method	-> my_controller/my_method
 */
$route['default_controller'] = 'welcome';
//$route['default_controller'] = 'frontends/coming_soon';
//$route['404_override'] = '';
$route['404_override'] = 'errors/show_404';
$route['translate_uri_dashes'] = FALSE;

// frontend
//$route['home'] = 'frontend/home/view';
//$route['/(:any)/(:any)'] = "frontend/home/view/$1/$2";
$route['shop'] = "frontend/home/shop";
$route['shop/(:any)'] = "frontend/home/shop/$1";
$route['shop/(:any)/(:any)'] = "frontend/home/shop/$1/$2";
$route['san-pham/(:any)'] = "frontend/home/product/$1";
$route['tin-tuc/(:any)'] = "frontend/home/news/$1";

$route['backend'] = "backend/home/view";
$route['backend/save'] = "backend/home/save";
$route['backend/shop'] = "backend/home/shop";
$route['backend/shop/(:any)'] = "backend/home/shop/$1";
$route['backend/shop/(:any)/(:any)'] = "backend/home/shop/$1/$2";
$route['backend/san-pham/(:any)'] = "backend/home/product/$1";
$route['backend/tin-tuc/(:any)'] = "backend/home/news/$1";
$route['backend/(:any)'] = "backend/home/shop/$1";

// backend
$route['admin'] = 'admin/users/login';
$route['admin/manage-home/(:any)'] = "admin/ManageHome/$1";
$route['admin/manage-home/(:any)/(:any)'] = "admin/ManageHome/$1/$2";

// default
$route['(:any)'] = "frontend/home/shop/$1";
$route['(\w{2})/(.*)'] = '$2';
$route['(\w{2})'] = $route['default_controller'];


