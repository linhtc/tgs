<?php

function add_css($listCss) {
    $list_Css = '';
    if(count($listCss) > 0){
        foreach ($listCss as $value) {
            $list_Css .= '<link href="'.base_url().$value.'" rel="stylesheet" type="text/css" />';
        }
    }
    return $list_Css;

}
function add_js($listJs) {
    $list_Js = '';
    if(count($listJs) > 0){
        foreach ($listJs as $value) {
            $list_Js .= '<script src="'.base_url().$value.'" type="text/javascript"></script>';
        }
    }
    return $list_Js;

}
function showMenuLi(&$content='', $menus, $p, $id_parent = 0, $level = 0){
    $menu_tmp = array();

    foreach ($menus as $key => $item) {
        if ((int) $item['parent'] == (int) $id_parent) {
            $menu_tmp[] = $item;

            unset($menus[$key]);
        }
    }

    if ($menu_tmp)
    {
        $icon = '';
        for($i=0; $i < $level; $i++)
            $icon .= '|----&nbsp;';

        foreach ($menu_tmp as $item)
        {
            $content .= '<tr>';
            $content .= '<td>';
            $content .=  $item['id'];
            $content .= '</td>';
            $content .= '<td>';
            $content .=  $item['created'];
            $content .= '</td>';
            $content .= '<td class="title-cat">';
            $content .=  $icon.$item['subject'];
            $content .= '</td>';
            $content .= '<td  id="row_'.$item['id'].'" class="text-center">';
            if($item['is_publish'] == 1){
                $content .= '<span class="label label-warning">Nháp</span>';
            }else{
                $content .= '<span class="label label-success">Xuất bản</span>';
            }
            $content .= '</td>';
            $content .= '<td class="text-center">';
            $content .= '<a href="main.php?p='.$p.'-sua&id='.$item['id'].'">';
            $content .= '<button type="button" class="btn btn-info btn-xs tooltips" data-toggle="tooltip" data-placement="top"><i class="fa fa-edit"></i></button>';
            $content .= '</a> ';
            $content .= '<a onclick="return confirm(\' Bạn có chắc muốn xóa không ?\');" href="main.php?p=cat-xoa&id='.$item['id'].'">';
            $content .= '<button type="button" class="btn btn-danger btn-xs tooltips" data-toggle="tooltip" data-placement="top"><i class="fa fa-trash-o"></i></button>';
            $content .= '</a>';
            $content .= '</td>';
            $content .= '</tr>';
            // Gọi lại đệ quy
            // Truyền vào danh sách menu chưa lặp và id parent của menu hiện tại
            showMenuLi($content, $menus, $p, $item['id'], $level+1);
        }

    }
}

function show_OPtion(&$content='', $menus, $array_id = array(), $id_parent = 0, $level = 0){
    $menu_tmp = array();

    foreach ($menus as $key => $item) {
        if ((int) $item['parent'] == (int) $id_parent) {
            $menu_tmp[] = $item;

            unset($menus[$key]);
        }
    }

    if ($menu_tmp)
    {
        $icon = '';
        for($i=0; $i < $level; $i++)
            $icon .= '|----&nbsp;';

        foreach ($menu_tmp as $item){
            if (in_array($item['id'], $array_id))
                $content .= "<option selected value='".$item['id']."''>".$icon.$item['subject']."</option>";
            else
                $content .= "<option value='".$item['id']."''>".$icon.$item['subject']."</option>";

            show_OPtion($content, $menus, $array_id, $item['id'], $level+1);
        }

    }
}
function list_Pagination_List($totalRows, $page=1, $pageSize=5, $offset = 2){
    $baseURL = $_SERVER['REDIRECT_QUERY_STRING']."?";
    parse_str($_SERVER['QUERY_STRING'],$arr);
    unset($arr['page']);
    $str="";
    foreach($arr as $k=> $v) $str.= "{$k}={$v}&";

    $baseURL .= $str;

    if ($totalRows<=0) return "";
    $totalPages = ceil($totalRows/$pageSize);
    if ($totalPages<=1) return "";

    $firstLink="";  $prevLink="";  $lastLink="";  $nextLink="";

    if ($page > 1) {
        $firstLink = "<li><a href='$baseURL'>&laquo;</a></li>";
        $prevPage = $page - 1;
        if ($prevPage == 1)
            $prevLink="<li><a href='$baseURL'>&lsaquo;</a></li>";
        else
            $prevLink="<li><a href='".$baseURL."page=$prevPage'>&lsaquo;</a></li>";
    }

    $from = $page - $offset;
    $to = $page + $offset;
    if ($from <=0) { $from = 1;   $to = $offset*2; }
    if ($to > $totalPages) { $to = $totalPages; }
    $links = "";
    for($j = $from; $j <= $to; $j++) {
    {
        if ($j==$page)
            $links= $links . "<li class='active'><span>$j <span class='sr-only'>(current)</span></span></li>";
        else{
            if ($j == 1)
                $links= $links . "<li><a href = '$baseURL'>$j</a></li>";
            else
                $links= $links . "<li><a href = '".$baseURL."page=$j'>$j</a></li>";
        }
    }

    } //for
    if ($page < $totalPages) {
        $lastLink = "<li><a href='".$baseURL."page=$totalPages'>&raquo;</a></li>";
        $nextPage = $page + 1;
        $nextLink = "<li><a href='".$baseURL."page=$nextPage'>&rsaquo;</a></li>";
    }
    
    $pagination_array[] = $totalPages;
    $pagination_array[] = $firstLink.$prevLink.$links.$nextLink.$lastLink;

    return $pagination_array;
}//PagesLink

function add_css_editor() {
    $list_Css = '';
    $listCss = array(
        'static/default/template/froala-editor/css/froala_editor.css',
        'static/default/template/froala-editor/css/froala_style.css',
        'static/default/template/froala-editor/css/plugins/code_view.css',
        'static/default/template/froala-editor/css/plugins/colors.css',
        'static/default/template/froala-editor/css/plugins/emoticons.css',
        'static/default/template/froala-editor/css/plugins/image_manager.css',
        'static/default/template/froala-editor/css/plugins/image.css',
        'static/default/template/froala-editor/css/plugins/line_breaker.css',
        'static/default/template/froala-editor/css/plugins/table.css',
        'static/default/template/froala-editor/css/plugins/char_counter.css',
        'static/default/template/froala-editor/css/plugins/video.css',
        'static/default/template/froala-editor/css/plugins/fullscreen.css',
        'static/default/template/froala-editor/css/plugins/file.css',
        'static/default/template/froala-editor/css/plugins/quick_insert.css',
    );
    if(count($listCss) > 0){
        foreach ($listCss as $value) {
            $list_Css .= '<link href="'.base_url().$value.'" rel="stylesheet" type="text/css" />';
        }
    }
    return $list_Css;
}
function add_js_editor() {
    $list_Js = '';
    $listJs = array(
        'static/default/template/froala-editor/js/froala_editor.min.js',
        'static/default/template/froala-editor/js/plugins/align.min.js',
        'static/default/template/froala-editor/js/plugins/char_counter.min.js',
        'static/default/template/froala-editor/js/plugins/code_beautifier.min.js',
        'static/default/template/froala-editor/js/plugins/code_view.min.js',
        'static/default/template/template/js/plugins/colors.min.js',
        'static/default/template/froala-editor/js/plugins/draggable.min.js',
        'static/default/template/froala-editor/js/plugins/emoticons.min.js',
        'static/default/template/froala-editor/js/plugins/entities.min.js',
        'static/default/template/froala-editor/js/plugins/file.min.js',
        'static/default/template/froala-editor/js/plugins/font_size.min.js',
        'static/default/template/froala-editor/js/plugins/font_family.min.js',
        'static/default/template/froala-editor/js/plugins/fullscreen.min.js',
        'static/default/template/froala-editor/js/plugins/image.min.js',
        'static/default/template/froala-editor/js/plugins/image_manager.min.js',
        'static/default/template/froala-editor/js/plugins/line_breaker.min.js',
        'static/default/template/froala-editor/js/plugins/inline_style.min.js',
        'static/default/template/froala-editor/js/plugins/link.min.js',
        'static/default/template/froala-editor/js/plugins/lists.min.js',
        'static/default/template/froala-editor/js/plugins/paragraph_format.min.js',
        'static/default/template/froala-editor/js/plugins/paragraph_style.min.js',
        'static/default/template/froala-editor/js/plugins/quick_insert.min.js',
        'static/default/template/froala-editor/js/plugins/quote.min.js',
        'static/default/template/froala-editor/js/plugins/table.min.js',
        'static/default/template/froala-editor/js/plugins/save.min.js',
        'static/default/template/froala-editor/js/plugins/url.min.js',
        'static/default/template/froala-editor/js/plugins/video.min.js',
    );
    if(count($listJs) > 0){
        foreach ($listJs as $value) {
            $list_Js .= '<script src="'.base_url().$value.'" type="text/javascript"></script>';
        }
    }
    return $list_Js;

}
function generateRandomString($length = 10) {
    return substr(str_shuffle(str_repeat($x='0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', ceil($length/strlen($x)) )),1,$length);
}

function convert_array($array) {
    $array_end = array();
    if(count($array) < 1)
        return $array_end;
    else{
        foreach ($array as $value) {
            $array_end[$value['id']] = $value['value'];
        }

        return $array_end;
    }
}
function array_gif() { /* Dung de tra cho frontend game */
    $giftMaps = array(
        1 => 'Điện thoại Prime X 2017',
        2 => 'Điện thoại Prime X1',
        3 => 'Sạc dự phòng',
        4 => 'Balo',
        5 => 'Voucher Prime X1',
        6 => 'Voucher Prime X1',
        7 => 'Voucher Prime X1',
        8 => 'Thẻ cào',
        9 => 'Thẻ cào',
        10 => 'Thẻ cào'
    );
    return $giftMaps;
}
function array_gif2() { /* Dung de show trong the select cua admin tool */
    $giftMaps = array(
        1 => 'Prime X 2017',
        2 => 'Prime X1',
        3 => 'Sạc dự phòng',
        4 => 'Balo',
        5 => 'Voucher 200K',
        6 => 'Voucher 300K',
        7 => 'Voucher 500K',
        8 => 'Thẻ cào 50K',
        9 => 'Thẻ cào 20K',
        10 => 'Thẻ cào 10K'
    );
    return $giftMaps;
}
function array_gif3() { /* Dung cho gui mail */
    $giftMaps = array(
        1 => 'Điện thoại Prime X 2017',
        2 => 'Điện thoại Prime X1',
        3 => 'Sạc dự phòng 5000mAh',
        4 => 'Balo thời trang',
        5 => 'VOUCHER ƯU ĐÃI [200.000 VNĐ]',
        6 => 'VOUCHER ƯU ĐÃI [300.000 VNĐ]',
        7 => 'VOUCHER ƯU ĐÃI [500.000 VNĐ]',
        8 => 'Thẻ cào điện thoại trị giá [50.000 VNĐ]',
        9 => 'Thẻ cào điện thoại trị giá [20.000 VNĐ]',
        10 => 'Thẻ cào điện thoại trị giá [10.000 VNĐ]'
    );
    return $giftMaps;
}
function array_gif4() { /* Dung cho xem danh sach trung thuong */
    $giftMaps = array(
        1 => 'Điện thoại Prime X 2017',
        2 => 'Điện thoại Prime X1',
        3 => 'Sạc dự phòng 5000mAh',
        4 => 'Balo thời trang',
        5 => 'VOUCHER ƯU ĐÃI 200.000 VNĐ',
        6 => 'VOUCHER ƯU ĐÃI 300.000 VNĐ',
        7 => 'VOUCHER ƯU ĐÃI 500.000 VNĐ',
        8 => 'Thẻ cào trị giá 50.000 VNĐ',
        9 => 'Thẻ cào trị giá 20.000 VNĐ',
        10 => 'Thẻ cào trị giá 10.000 VNĐ'
    );
    return $giftMaps;
}
function array_gif5() { /* Dung de tra cho frontend game - li` xi` */
	$giftMaps = array(
        1 => 'Điện thoại Zumbo S2 Dual',
        2 => 'Điện thoại B310',
        3 => 'Nón bảo hiểm',
        4 => 'Thẻ cào 10.000đ',
        5 => 'Thẻ cào 20.000đ',
        6 => 'Thẻ cào 50.000đ',
        7 => 'Thẻ cào 100.000đ',
        8 => 'Thẻ cào 200.000đ',
        9 => 'Thẻ cào 500.000đ',
        10 => 'Voucher Free-ship'
	);
	return $giftMaps;
}
function array_gif13() { /* Dung de tra cho frontend game - Son tinh Thuy tinh */
	$giftMaps = array(
        1 => 'Điện thoại Zumbo S2 Dual',
        2 => 'Điện thoại B310',
        3 => 'Nón bảo hiểm',
        4 => 'Thẻ cào 10.000đ',
        5 => 'Thẻ cào 20.000đ',
        6 => 'Thẻ cào 50.000đ',
        7 => 'Thẻ cào 100.000đ',
        8 => 'Thẻ cào 200.000đ',
        9 => 'Thẻ cào 500.000đ',
        10 => 'Voucher Free-ship'
	);
	return $giftMaps;
}
function array_gif13s() { /* Dung de gui mail game - Son tinh Thuy tinh */
	$giftMaps = array(
			1 => 'Điện thoại Zumbo S2',
			2 => 'Điện thoại Zumbo J2',
			3 => 'Thẻ cào điện thoại trị giá 10.000 VNĐ',
			4 => 'Thẻ cào điện thoại trị giá 20.000 VNĐ',
			5 => 'Thẻ cào điện thoại trị giá 50.000 VNĐ',
			6 => 'VOUCHER ƯU ĐÃI 20%',
			7 => 'VOUCHER ƯU ĐÃI 20%'
	);
	return $giftMaps;
}
function array_gif6() { /* Dung cho gui mail */
    $giftMaps = array(
        1 => 'Điện thoại Prime X1',
        2 => 'Điện thoại Zumbo J 2017',
        3 => 'Điện thoại B223',
        4 => 'Sạc dự phòng',
        5 => 'Balo',
        6 => 'Gậy selfie',
        7 => 'Thẻ cào điện thoại trị giá [200.000 VNĐ]',
        8 => 'Thẻ cào điện thoại trị giá [100.000 VNĐ]',
        9 => 'Thẻ cào điện thoại trị giá [50.000 VNĐ]',
        10 => 'Thẻ cào điện thoại trị giá [20.000 VNĐ]',
        11 => 'Thẻ cào điện thoại trị giá [10.000 VNĐ]',
        12 => 'VOUCHER ƯU ĐÃI [20%]',
        13 => 'VOUCHER ƯU ĐÃI [25%]',
        14 => 'VOUCHER ƯU ĐÃI [30%]',
        15 => 'VOUCHER ƯU ĐÃI [50%]',
        16 => 'VOUCHER ƯU ĐÃI [20%]',
        17 => 'VOUCHER ƯU ĐÃI [25%]',
        18 => 'VOUCHER ƯU ĐÃI [30%]',
        19 => 'VOUCHER ƯU ĐÃI [50%]',
    );
    return $giftMaps;
}
function array_carrier() {
    $giftMaps = array(
        1 => 'Mobifone',
        2 => 'Vinaphone',
        3 => 'Viettel',
    );
    return $giftMaps;
}
function envelopes_gifts() { /* Dung de tra cho frontend game - li` xi` */
    $giftMaps = array(
        1 => 'Điện thoại Zumbo S2 Dual',
        2 => 'Điện thoại B310',
        3 => 'Nón bảo hiểm thời trang',
        4 => 'Thẻ cào trị giá 10.000đ',
        5 => 'Thẻ cào trị giá 20.000đ',
        6 => 'Thẻ cào trị giá 50.000đ',
        7 => 'Thẻ cào trị giá 100.000đ',
        8 => 'Thẻ cào trị giá 200.000đ',
        9 => 'Thẻ cào trị giá 500.000đ',
        10 => 'Mã giao hàng miễn phí freeship'
    );
    return $giftMaps;
}
function carrier_list_arr(){
    return array(
        1 => 'Mobifone',
        2 => 'Vinaphone',
        3 => 'Viettel'
    );
}

function send_flashsale_mail($email, $full_name, $model_phone, $voucher){
	$full_name = ucwords($full_name); // viet hoa cac ky tu dau cua ten
	$title = '[MOBIISTAR] Chúc mừng '.$full_name.' đã đăng ký thành công chương trình “SĂN DẾ “CHẤT” – GIÁ SỐC TỰU TRƯỜNG”';
	$str_model = '';
	$str_price = '';
	$str_online = '';
	if($model_phone == 1){ // dien thoai prime x
		$str_model = 'PRIME X';
		$str_price = '1.990.000';
		$str_online = 'http://muahang.mobiistar.vn/smartphone/mobiistar-prime-x.html';
	}elseif($model_phone == 2){ // dien thoai prime x grand
		$str_model = 'PRIME X Grand';
		$str_price = '2.990.000';
		$str_online = 'http://muahang.mobiistar.vn/smartphone/prime-x-grand.html';
	}
	// $content = file_get_contents(MEDIAPATH.'media/files/content_flashsale_mail.html');
	$content = file_get_contents(MEDIAPATH.'media/files/content_flashsale_html.html'); // lay noi dung tu file html
	// thay the nhung thong tin can thiet tu noi dung html
	$content = str_replace('VAR_FULL_NAME', $full_name, $content);
	$content = str_replace('VAR_PHONE_MODEL', $str_model, $content);
	$content = str_replace('VAR_PHONE_PRICE', $str_price, $content);
	$content = str_replace('VAR_BUY_ONLINE', $str_online, $content);
	$content = str_replace('VAR_VOUCHER', $voucher, $content);
	require_once(APPPATH.'third_party/mail/class.phpmailer.php');
	$mail = new PHPMailer();
	$mail->IsSMTP();
	$mail->SMTPAuth   = true; 
	$mail->Host       = "email-smtp.us-west-2.amazonaws.com";
	$mail->Port       = "587";
	$mail->SMTPSecure = "tls"; 
	$mail->Username   = "AKIAJEDEGEVJAFFXEVTA";
	$mail->Password   = "AgK8XPx2MLj2uVc5sQHLAzGeY5QGIDipvxZfB8m7lUkU";
	$mail->SetFrom('chuongtrinh@mobiistar.vn', 'Mobiistar');
	$mail->CharSet = 'UTF-8';

	$mail->Subject = $title;
	$body = $content;
	$mail->MsgHTML($body);
	$mail->AddAddress($email, ""); 
	$mail->AddCC('hotro@mobiistar.vn', ""); 
	// $mail->AddCC('an.le@mobiistar.vn', ""); 
	// $mail->AddCC('tuan.tran@mobiistar.vn', ""); 
	// $mail->AddCC('buihuynh.kinhluan@gmail.com', ""); 
	return $mail->Send();
}

function send_mail_to_winner_bk($userClass){
    /* Kiem tra mot so thong tin can thiet */
    if(empty($userClass->email)){ return false; }

    $giftList = array_gif3();
    $carrierList = array_carrier();
    $userClass->gift_name = isset($giftList[$userClass->gift_id]) ? $giftList[$userClass->gift_id] : null;

    $full_name = ucwords($userClass->full_name); // viet hoa cac ky tu dau cua ten
	$title = '[MOBIISTAR] Chúc mừng bạn đã trúng thưởng chương trình “VÂN TAY NÓI GÌ VỀ SỰ THÀNH CÔNG CỦA BẠN?”';
	$content = file_get_contents(MEDIAPATH.'files/mail_to_win.html'); /* Noi dung se de trong file html o thu muc media/files */

    /* Thay the nhung thong tin can thiet tu noi dung trong file */
	$content = str_replace('VAR_NAME', $userClass->full_name, $content);
	$content = str_replace('VAR_GIFT', $userClass->gift_name, $content);

	require_once(APPPATH.'third_party/mail/class.phpmailer.php');
	$mail = new PHPMailer();
	$mail->IsSMTP();
	$mail->SMTPAuth   = true;
	$mail->Host       = "email-smtp.us-west-2.amazonaws.com";
	$mail->Port       = "587";
	$mail->SMTPSecure = "tls";
	$mail->Username   = "AKIAJEDEGEVJAFFXEVTA";
	$mail->Password   = "AgK8XPx2MLj2uVc5sQHLAzGeY5QGIDipvxZfB8m7lUkU";
	$mail->SetFrom('chuongtrinh@mobiistar.vn', 'Mobiistar');
	$mail->CharSet = 'UTF-8';

	$mail->Subject = $title;
	$body = $content;
	$mail->MsgHTML($body);
	$mail->AddAddress($userClass->email, "");
//	$mail->AddCC('hotro@mobiistar.vn', "");
	// $mail->AddCC('an.le@mobiistar.vn', "");
//	 $mail->AddCC('hoa.tang@mobiistar.vn', "");
//	 $mail->AddCC('buihuynh.kinhluan@gmail.com', "");
	 $mail->AddCC('conglinh.tran@mobiistar.vn', "Leon");
	return $mail->Send();
}

function send_mail_to_winner($userClass){
    /* Kiem tra mot so thong tin can thiet */
    if(empty($userClass->email)){ return false; }

    $giftList = array_gif3();
    $userClass->gift_name = isset($giftList[$userClass->gift_id]) ? $giftList[$userClass->gift_id] : null;

    $contentCard = '';
    $contentVoucher = '';
    $contentApplyFor = ' ';
    $contactLater = 'Mobiistar sẽ liên hệ với bạn về quy trình nhận giải thưởng sau khi chương trình kết thúc vào ngày 09/01/2017.<br><br>';
    if($userClass->gift_id >= 5 && $userClass->gift_id <= 7){ /* Neu trung voucher */
        $contentVoucher = "
            Mã voucher: <label style=\"color: #fd1011;\">$userClass->code</label><br>
            Thời hạn sử dụng mã voucher đến hết ngày 25/01/2017.<br>
            Lưu ý: Voucher chỉ được sử dụng một lần và không có giá trị cộng gộp với các chương trình ưu đãi khác.<br>
            Mã voucher được áp dụng để mua <label style=\"color: #737bfd;\">PRIME X1</label> tại các địa điểm sau:<br>
            1. Trang Mua Hàng Online của Mobiistar:&nbsp;<a href=\"http://muahang.mobiistar.vn/ \" target=\"_blank\">http://muahang.mobiistar.vn/ </a><br>
            2. Hệ thống showroom Mobiistar:<br>
            - TPHCM: 40 Phạm Ngọc Thạch, Phường 6, Quận 3, TPHCM<br>
            - Hà Nội: Tầng 8, Tòa nhà An Minh, số 36 Hoàng Cầu, Đống Đa, Hà Nội<br>
            - Đà Nẵng: 354 Hải Phòng, Quận Thanh Khê, Đà Nẵng<br>
            Thời gian làm việc: Từ 8h AM - 12h AM, 13h30 PM - 17h PM thứ 2 đến thứ 7 trong tuần.<br><br>
        ";
        $contentApplyFor = 'áp dụng cho sản phẩm <label style="color: #737bfd;">PRIME X1</label> ';
        $contactLater = ''; /* Nếu trúng voucher thì phát luôn chứ k cần Một lần nữa bla bla */
    }
    if($userClass->gift_id >= 8 && $userClass->gift_id <= 10){ /* Neu trung card dien thoai */
        $carrierList = array_carrier();
        $userClass->carrier = isset($carrierList[$userClass->carrier]) ? $carrierList[$userClass->carrier] : null;
        $contentCard = "Mã thẻ cào: <label style=\"color: #fd1011;\">$userClass->code</label><br> Mạng di động bạn đã chọn: $userClass->carrier<br><br>";
        $contactLater = ''; /* Nếu trúng thẻ cào thì phát luôn chứ k cần Một lần nữa bla bla */
    }

    $userClass->full_name = ucwords($userClass->full_name); // viet hoa cac ky tu dau cua ten
	$title = '[MOBIISTAR] Chúc mừng '.(addslashes($userClass->full_name)).' đã trúng thưởng chương trình “VÂN TAY NÓI GÌ VỀ SỰ THÀNH CÔNG CỦA BẠN?”';
	$content = file_get_contents(MEDIAPATH.'files/mail_to_win2.html'); /* Noi dung se de trong file html o thu muc media/files */

    /* Thay the nhung thong tin can thiet tu noi dung trong file */
	$content = str_replace('VAR_NAME', $userClass->full_name, $content);
	$content = str_replace('VAR_GIFT', $userClass->gift_name, $content);
	$content = str_replace('VAR_APPLY_FOR', $contentApplyFor, $content);
	$content = str_replace('VAR_CONTENT_CARD', $contentCard, $content);
	$content = str_replace('VAR_CONTENT_VOUCHER', $contentVoucher, $content);
	$content = str_replace('VAR_CONTACT_LATER', $contactLater, $content);

//	require_once(APPPATH.'third_party/mail/class.phpmailer.php');
    require_once(APPPATH.'third_party/mail/PHPMailerAutoload.php');
	$mail = new PHPMailer();
	$mail->IsSMTP();
	$mail->SMTPAuth   = true;
	$mail->Host       = "email-smtp.us-west-2.amazonaws.com";
	$mail->Port       = "587";
	$mail->SMTPSecure = "tls";
	$mail->Username   = "AKIAJEDEGEVJAFFXEVTA";
	$mail->Password   = "AgK8XPx2MLj2uVc5sQHLAzGeY5QGIDipvxZfB8m7lUkU";
	$mail->SetFrom('chuongtrinh@mobiistar.vn', 'Mobiistar');
	$mail->CharSet = 'UTF-8';

	$mail->Subject = $title;
	$body = $content;
	$mail->MsgHTML($body);
	$mail->AddAddress($userClass->email, "");
	$mail->AddCC('hotro@mobiistar.vn', "");
	// $mail->AddCC('an.le@mobiistar.vn', "");
//	 $mail->AddCC('hoa.tang@mobiistar.vn', "");
//	 $mail->AddBCC('buihuynh.kinhluan@gmail.com', "Kinh Luan");
    $mail->AddBCC('kinhluan.mobiistar@gmail.com', "Kinh Luan");
	 $mail->AddBCC('tuan.tran@mobiistar.vn', "Tuan Xuong");
	 $mail->AddBCC('conglinh.tran@mobiistar.vn', "Leon");
	return $mail->Send();
}

function send_mail_to_winner11($userClass){
	/* Kiem tra mot so thong tin can thiet */
	if(empty($userClass->email)){ return false; }
	
	$giftList = array_gif6();
	$userClass->gift_name = isset($giftList[$userClass->gift_id]) ? $giftList[$userClass->gift_id] : null;
	
	$contentCard = '';
	$contentVoucher = '';
	$contentApplyFor = ' ';
	$contactLater = 'Mobiistar sẽ liên hệ với bạn về quy trình nhận giải thưởng sau khi chương trình kết thúc vào ngày 04/02/2017.<br><br>';
	if($userClass->gift_id >= 12 && $userClass->gift_id <= 19){ /* Neu trung voucher */
		$contentVoucher = "
		Mã voucher: <label style=\"color: #fd1011;\">$userClass->code</label><br>
		Thời hạn sử dụng mã voucher đến hết ngày 28/02/2017.<br>
		Lưu ý: Voucher chỉ được sử dụng một lần và không có giá trị cộng gộp với các chương trình ưu đãi khác.<br>
		Mã voucher được áp dụng để mua <label style=\"color: #737bfd;\">$userClass->model_name</label> tại các địa điểm sau:<br>
		1. Trang Mua Hàng Online của Mobiistar:&nbsp;<a href=\"http://muahang.mobiistar.vn/ \" target=\"_blank\">http://muahang.mobiistar.vn/ </a><br>
		2. Hệ thống showroom Mobiistar:<br>
		- TPHCM: 40 Phạm Ngọc Thạch, Phường 6, Quận 3, TPHCM<br>
		- Hà Nội: Tầng 8, Tòa nhà An Minh, số 36 Hoàng Cầu, Đống Đa, Hà Nội<br>
		- Đà Nẵng: 354 Hải Phòng, Quận Thanh Khê, Đà Nẵng<br>
		Thời gian làm việc: Từ 8h AM - 12h AM, 13h30 PM - 17h PM thứ 2 đến thứ 7 trong tuần.<br><br>
		";
		$contentApplyFor = 'áp dụng cho sản phẩm <label style="color: #737bfd;">'.$userClass->model_name.'</label> ';
		$contactLater = ''; /* Nếu trúng voucher thì phát luôn chứ k cần Một lần nữa bla bla */
	}
	if($userClass->gift_id >= 7 && $userClass->gift_id <= 11){ /* Neu trung card dien thoai */
		$carrierList = array_carrier();
		if(empty($userClass->code)){
			$userClass->code = 'Liên hệ CSKH của Mobiistar';
		}
		if(empty($userClass->carrier)){
			$userClass->carrier = 'Liên hệ CSKH của Mobiistar';
		} else {
			$userClass->carrier = isset($carrierList[$userClass->carrier]) ? $carrierList[$userClass->carrier] : null;
		}
		$contentCard = "Mã thẻ cào: <label style=\"color: #fd1011;\">$userClass->code</label><br> Mạng di động bạn đã chọn: $userClass->carrier<br><br>";
		$contactLater = ''; /* Nếu trúng thẻ cào thì phát luôn chứ k cần Một lần nữa bla bla */
	}
	
	$userClass->full_name = ucwords($userClass->full_name); // viet hoa cac ky tu dau cua ten
	$title = '[MOBIISTAR] Chúc mừng '.(addslashes($userClass->full_name)).' đã trúng thưởng chương trình “LÌ XÌ TẾT, ĐÓN LỘC ĐẦU NĂM”';
	if(empty($userClass->resend)){ /* Neu khong phai la email khieu nai */
		$content = file_get_contents(MEDIAPATH.'files/mail_to_win11.html'); /* Noi dung se de trong file html o thu muc media/files */
	} else {
		$content = file_get_contents(MEDIAPATH.'files/mail_to_win11_R.html'); /* Noi dung se de trong file html o thu muc media/files */
	}
	
	/* Thay the nhung thong tin can thiet tu noi dung trong file */
	$content = str_replace('VAR_NAME', $userClass->full_name, $content);
	$content = str_replace('VAR_GIFT', $userClass->gift_name, $content);
	$content = str_replace('VAR_APPLY_FOR', $contentApplyFor, $content);
	$content = str_replace('VAR_CONTENT_CARD', $contentCard, $content);
	$content = str_replace('VAR_CONTENT_VOUCHER', $contentVoucher, $content);
	$content = str_replace('VAR_CONTACT_LATER', $contactLater, $content);
	
	//	require_once(APPPATH.'third_party/mail/class.phpmailer.php');
	require_once(APPPATH.'third_party/mail/PHPMailerAutoload.php');
	$mail = new PHPMailer();
	$mail->IsSMTP();
	$mail->SMTPAuth   = true;
	$mail->Host       = "email-smtp.us-west-2.amazonaws.com";
	$mail->Port       = "587";
	$mail->SMTPSecure = "tls";
	$mail->Username   = "AKIAJEDEGEVJAFFXEVTA";
	$mail->Password   = "AgK8XPx2MLj2uVc5sQHLAzGeY5QGIDipvxZfB8m7lUkU";
	$mail->SetFrom('chuongtrinh@mobiistar.vn', 'Mobiistar');
	$mail->CharSet = 'UTF-8';
	
	$mail->Subject = $title;
	$body = $content;
	$mail->MsgHTML($body);
	$mail->AddAddress($userClass->email, "");
	//    $mail->AddAddress('conglinh.tran@mobiistar.vn', "Leon");
	//	$mail->AddCC('hotro@mobiistar.vn', "");
	// $mail->AddCC('an.le@mobiistar.vn', "");
	//	 $mail->AddCC('hoa.tang@mobiistar.vn', "");
	//	 $mail->AddBCC('buihuynh.kinhluan@gmail.com', "Kinh Luan");
	$mail->AddBCC('kinhluan.mobiistar@gmail.com', "Kinh Luan");
	$mail->AddBCC('tuan.tran@mobiistar.vn', "Tuan Xuong");
	$mail->AddBCC('conglinh.tran@mobiistar.vn', "Leon");
	return $mail->Send();
}

function send_mail_to_winner13($userClass){
// 	return false;
	/* Kiem tra mot so thong tin can thiet */
	if(empty($userClass->email)){ return false; }
	
	$giftList = array_gif13s();
	$userClass->gift_name = isset($giftList[$userClass->gift_id]) ? $giftList[$userClass->gift_id] : null;
	
	$contentGreeting = 'Một lần nữa, <label style="color: #737bfd;">Mobiistar</label> chân thành cảm ơn bạn đã quan tâm và tham gia chương trình. Hy vọng bạn sẽ luôn đồng hành và ủng hộ Mobiistar trong những chương trình tiếp theo.<br>';
	$contentCard = '';
	$contentVoucher = '';
	$contentApplyFor = ' ';
	$contactLater = 'Mobiistar sẽ liên hệ với bạn về quy trình nhận giải thưởng sau khi chương trình kết thúc vào ngày 20.07.2017.<br><br>';
	if($userClass->gift_id >= 6 && $userClass->gift_id <= 7){ /* Neu trung voucher */
		if(empty($userClass->ticket_place)){ /* Neu khong trung Ve' du su kien offline */
			$contentVoucher = "
			Mã voucher: <label style=\"color: #fd1011;\">$userClass->code</label><br>
			Thời hạn sử dụng mã voucher đến hết ngày 31.07.2017.<br>
			Lưu ý: Voucher chỉ được sử dụng một lần và không có giá trị cộng gộp với các chương trình ưu đãi khác.<br>
			Mã voucher được áp dụng để mua <label style=\"color: #737bfd;\">$userClass->model_name</label> tại các địa điểm sau:<br>
			1. Trang Mua Hàng Online của Mobiistar:&nbsp;<a href=\"http://muahang.mobiistar.vn/ \" target=\"_blank\">http://muahang.mobiistar.vn/ </a><br>
			2. Hệ thống showroom Mobiistar:<br>
			- TPHCM: 40 Phạm Ngọc Thạch, Phường 6, Quận 3, TPHCM<br>
			- Hà Nội: Tầng 8, Tòa nhà An Minh, số 36 Hoàng Cầu, Đống Đa, Hà Nội<br>
			- Đà Nẵng: 354 Hải Phòng, Quận Thanh Khê, Đà Nẵng<br>
			Thời gian làm việc: Từ 8h AM - 12h AM, 13h30 PM - 17h PM thứ 2 đến thứ 7 trong tuần.<br><br>
			";
		} else{ /* Nhan duoc ve du su kien offline gi day' */
			$userClass->gift_name = 'Combo vé tham dự fan meeting Otis và '.$userClass->gift_name;
			$contentVoucher = "
			Mã voucher: <label style=\"color: #fd1011;\">$userClass->code</label><br>
			<br>
			*Vé chính thức sẽ được gửi lại bạn sau khi ban tố chức xác nhận thông tin. Có thể bạn sẽ không nhận được vé chính thức nếu vi phạm 1 trong những quy định tham dự offline.<br>
			Và vé chỉ sử dụng cho 1 người.<br><br>
			";
			$contentGreeting = 'Một lần nữa, <label style="color: #737bfd;">Mobiistar</label> chân thành cảm ơn bạn đã quan tâm và tham gia chương trình. Hy vọng bạn sẽ luôn đồng hành và ủng hộ Mobiistar cũng như Otis trong những chương trình tiếp theo.<br>';
		}
		$contentApplyFor = 'áp dụng cho sản phẩm <label style="color: #737bfd;">'.$userClass->model_name.'</label> ';
		$contactLater = ''; /* Nếu trúng voucher thì phát luôn chứ k cần Một lần nữa bla bla */
	}
	if($userClass->gift_id >= 3 && $userClass->gift_id <= 5){ /* Neu trung card dien thoai */
		$carrierList = array_carrier();
		if(empty($userClass->code)){
			$userClass->code = 'Liên hệ CSKH của Mobiistar';
		}
		if(empty($userClass->carrier)){
			$userClass->carrier = 'Liên hệ CSKH của Mobiistar';
		} else {
			$userClass->carrier = isset($carrierList[$userClass->carrier]) ? $carrierList[$userClass->carrier] : null;
		}
		$contentCard = "Mã thẻ cào: <label style=\"color: #fd1011;\">$userClass->code</label><br> Mạng di động bạn đã chọn: $userClass->carrier<br><br>";
		$contactLater = ''; /* Nếu trúng thẻ cào thì phát luôn chứ k cần Một lần nữa bla bla */
	}
	
	$userClass->full_name = ucwords($userClass->full_name); // viet hoa cac ky tu dau cua ten
	$title = '[MOBIISTAR] Chúc mừng '.(addslashes($userClass->full_name)).' đã trúng thưởng chương trình “TRUY TÌM SOÁI CA QUỐC DÂN SELFIE ĐẸP TRONG TRUYỀN THUYẾT”';
	if(empty($userClass->resend)){ /* Neu khong phai la email khieu nai */
		$content = file_get_contents(MEDIAPATH.'files/mail_to_win13.html'); /* Noi dung se de trong file html o thu muc media/files */
	} else {
// 		$content = file_get_contents(MEDIAPATH.'files/mail_to_win11_R.html'); /* Noi dung se de trong file html o thu muc media/files */
		$content = file_get_contents(MEDIAPATH.'files/mail_to_win13.html'); /* Noi dung se de trong file html o thu muc media/files */
	}
	
	
	/* Thay the nhung thong tin can thiet tu noi dung trong file */
	$content = str_replace('VAR_NAME', $userClass->full_name, $content);
	$content = str_replace('VAR_GIFT', $userClass->gift_name, $content);
	$content = str_replace('VAR_APPLY_FOR', $contentApplyFor, $content);
	$content = str_replace('VAR_CONTENT_CARD', $contentCard, $content);
	$content = str_replace('VAR_CONTENT_VOUCHER', $contentVoucher, $content);
	$content = str_replace('VAR_CONTACT_LATER', $contactLater, $content);
	$content = str_replace('VAR_GREETING', $contentGreeting, $content);
	
	//	require_once(APPPATH.'third_party/mail/class.phpmailer.php');
	require_once(APPPATH.'third_party/mail/PHPMailerAutoload.php');
	$mail = new PHPMailer();
	$mail->IsSMTP();
	$mail->SMTPAuth   = true;
	$mail->Host       = "email-smtp.us-east-1.amazonaws.com";
	$mail->Port       = "587";
	$mail->SMTPSecure = "tls";
	$mail->Username   = "AKIAJEDEGEVJAFFXEVTA";
	$mail->Password   = "AgK8XPx2MLj2uVc5sQHLAzGeY5QGIDipvxZfB8m7lUkU";
	$mail->SetFrom('chuongtrinh@mobiistar.vn', 'Mobiistar');
	$mail->CharSet = 'UTF-8';
	
	$mail->Subject = $title;
	$body = $content;
	$mail->MsgHTML($body);
	$mail->AddAddress($userClass->email, "");
	//    $mail->AddAddress('conglinh.tran@mobiistar.vn', "Leon");
	//	$mail->AddCC('hotro@mobiistar.vn', "");
	// $mail->AddCC('an.le@mobiistar.vn', "");
	//	 $mail->AddCC('hoa.tang@mobiistar.vn', "");
	//	 $mail->AddBCC('buihuynh.kinhluan@gmail.com', "Kinh Luan");
// 	$mail->AddBCC('kinhluan.mobiistar@gmail.com', "Kinh Luan");
// 	$mail->AddBCC('tuan.tran@mobiistar.vn', "Tuan Xuong");
	$mail->AddBCC('conglinh.tran@mobiistar.vn', "Leon");
	return $mail->Send();
}

function send_mail_offline($email, $full_name){
	$full_name = ucwords($full_name); // viet hoa cac ky tu dau cua ten
	$title = '[MOBIISTAR] Chào bạn '.$full_name.'!! Thư mời tham dự TECHFORUM 2017 HCM';

	$content = file_get_contents(MEDIAPATH.'files/send_offline.html');
	$content = str_replace('&lt;full_name&gt;,', $full_name, $content);
	
	//var_dump($content);exit;

	//	require_once(APPPATH.'third_party/mail/class.phpmailer.php');
	require_once(APPPATH.'third_party/mail/PHPMailerAutoload.php');
	$mail = new PHPMailer();
	$mail->IsSMTP();
	$mail->SMTPAuth   = true;
	$mail->Host       = "email-smtp.us-east-1.amazonaws.com";
	$mail->Port       = "587";
	$mail->SMTPSecure = "tls";
	$mail->Username   = "AKIAJEDEGEVJAFFXEVTA";
	$mail->Password   = "AgK8XPx2MLj2uVc5sQHLAzGeY5QGIDipvxZfB8m7lUkU";
	$mail->SetFrom('chuongtrinh@mobiistar.vn', 'Mobiistar');
	$mail->CharSet = 'UTF-8';
	
	$mail->Subject = $title;
	$body = $content;
	$mail->MsgHTML($body);
	$mail->AddAddress($email, 'Mobiistar');
	    //$mail->AddAddress('conglinh.tran@mobiistar.vn', "Leon");
	//	$mail->AddCC('hotro@mobiistar.vn', "");
	// $mail->AddCC('an.le@mobiistar.vn', "");
		 //$mail->AddCC('hoa.tang@mobiistar.vn', "");
	//$mail->AddBCC('buihuynh.kinhluan@gmail.com', "Kinh Luan");
 	//$mail->AddBCC('kinhluan.mobiistar@gmail.com', "Kinh Luan");
	// 	$mail->AddBCC('tuan.tran@mobiistar.vn', "Tuan Xuong");
	//$mail->AddBCC('thuylinh.hoang@mobistar.vn', "C.Linh");
	return $mail->Send();
}

function send_mail_to_swapper($userClass){
    /* Kiem tra mot so thong tin can thiet */
    if(empty($userClass->email)){ return false; }
    if(filter_var($userClass->email, FILTER_VALIDATE_EMAIL) === false){ return false; }

    if(is_numeric($userClass->voucher_value)){
        $userClass->voucher_value = number_format($userClass->voucher_value, 0, ",", ".");
    }
    $contentVoucher = "
        MÃ ƯU ĐÃI: <label style=\"color: #fd1011;\">$userClass->voucher_code</label><br>
        Hạn sử dụng mã đổi máy: 28/02/2017.<br>
        Mã đổi máy có giá trị <lalel style=\"color: #000000;\">".$userClass->voucher_value."đ</lalel> 
            áp dụng khi mua sản phẩm <lalel style=\"color: #000000;\">$userClass->model_name </label> tại các địa chỉ sau: 
            <a href=\"http://bit.ly/DoimayTet2017_Danhsachcuahang \" target=\"_blank\">http://bit.ly/DoimayTet2017_Danhsachcuahang</a>
             hoặc đặt hàng online tại trang 
            <a href=\"$userClass->link \" target=\"_blank\">$userClass->link </a><br>
        Giá trị của mã đổi máy được áp dụng trên giá bán chính thức của <lalel style=\"color: #000000;\">$userClass->model_name</lalel> là ".number_format($userClass->model_price, 0, ',', '.')."đ.<br><br>
    ";

    $userClass->full_name = ucwords($userClass->full_name); // viet hoa cac ky tu dau cua ten
    $title = '[MOBIISTAR] Chúc mừng '.(addslashes($userClass->full_name)).' nhận mã ưu đãi từ chương trình “XXX”';
    $content = file_get_contents(MEDIAPATH.'files/mail_to_swapper.html'); /* Noi dung se de trong file html o thu muc media/files */

    /* Thay the nhung thong tin can thiet tu noi dung trong file */
    $content = str_replace('VAR_NAME', $userClass->full_name, $content);
    $content = str_replace('VAR_MODEL', $userClass->model_name, $content);
    $content = str_replace('VAR_CONTENT_VOUCHER', $contentVoucher, $content);

//	require_once(APPPATH.'third_party/mail/class.phpmailer.php');
    require_once(APPPATH.'third_party/mail/PHPMailerAutoload.php');
    $mail = new PHPMailer();
    $mail->IsSMTP();
    $mail->SMTPAuth   = true;
    $mail->Host       = "smtp.gmail.com";
    $mail->Port       = "587";
    $mail->SMTPSecure = "tls";
    $mail->Username   = "labs.mobiistar@gmail.com";
    $mail->Password   = "sRNKwD8x";
    $mail->SetFrom('chuongtrinh@mobiistar.vn', 'Mobiistar');
    $mail->CharSet = 'UTF-8';

    $mail->Subject = $title;
    $body = $content;
    $mail->MsgHTML($body);
    $mail->AddAddress($userClass->email, "");
//    $mail->AddCC('hotro@mobiistar.vn', "");
    // $mail->AddCC('an.le@mobiistar.vn', "");
//	 $mail->AddCC('hoa.tang@mobiistar.vn', "");
//	 $mail->AddBCC('buihuynh.kinhluan@gmail.com', "Kinh Luan");
//    $mail->AddBCC('kinhluan.mobiistar@gmail.com', "Kinh Luan");
//    $mail->AddBCC('tuan.tran@mobiistar.vn', "Tuan Xuong");
//    $mail->AddBCC('hoa.tang@mobiistar.vn', "A Hoa");
    $mail->AddBCC('conglinh.tran@mobiistar.vn', "Leon");
//    $mail->AddBCC('an.le@mobiistar.vn', "Leon");
    return $mail->Send();
}

function preorder_mail($userClass){
	/* Kiem tra mot so thong tin can thiet */
	if(empty($userClass->email)){ return false; }
	if(filter_var($userClass->email, FILTER_VALIDATE_EMAIL) === false){ return false; }
	
	if(is_numeric($userClass->voucher_value)){
		$userClass->voucher_value = number_format($userClass->voucher_value, 0, ",", ".");
	}
	if(is_numeric($userClass->model_price)){
		$userClass->model_price= number_format($userClass->model_price, 0, ",", ".");
	}
	$contentVoucher = "
	Mã đặt trước: <label style=\"color: #fd1011;\">$userClass->voucher_code</label><br>
	Giá trị của mã đặt trước này được áp dụng trên giá bán chính thức của $userClass->model_name là $userClass->model_price đồng.<br>
	Bạn vui lòng mang mã đặt trước này đến cửa hàng showroom của Mobiistar để tiến hành đặt cọc và là 1 trong 100 người nhận ưu đãi lên đến 1.000.000 đồng.<br>
	Mã ưu đãi này được áp dụng khi mua máy $userClass->model_name tại hệ thống showroom của Mobiistar (tại 3 địa điểm: Hà Nội, Hồ Chí Minh và Đà Nẵng), hệ thống cửa hàng Viễn Thông A toàn quốc hoặc mua hàng online tại website <a href=\"http://muahang.mobiistar.vn\">http://muahang.mobiistar.vn</a>.<br>
	Thời gian nhận sản phẩm đã đặt trước: <lalel style=\"color: #000000;\">từ 09.12 đến 16.12.2017</lalel><br>
	Khi đến mua sản phẩm, bạn nhớ mang theo mã đặt trước này (hoặc Số điện thoại) và CMND cá nhân đã đăng kí để nhân viên xác nhận và hỗ trợ bạn mua hàng.<br>
	<br>
	Ngoài ra, để giữ suất mua và nhận ưu đãi 1.000.000 đồng/ máy khi là 1 trong 100 suất đặt cọc đầu tiên, thì bạn có thể tham gia đặt cọc bằng cách mang mã đặt trước này đến cửa hàng showroom của Mobiistar hoặc chuyển khoản online nhé.<br>
	HƯỚNG DẪN ĐẶT CỌC<br>
	- Khách hàng có thể đến đặt cọc trực tiếp tại hệ thống showroom của Mobiistar (tại 3 địa điểm: Hà Nội, Hồ Chí Minh và Đà Nẵng)<br>
	- Hoặc đặt trước bằng chuyển khoản online theo cú pháp:<br>
	[DTXMAX][Họ tên][SĐT đã đăng ký trên website]<br>
	Và gửi về tài khoản sau của Mobiistar<br>
	<br>
	a. Miền Nam<br>
	- Thương Mại Cổ Phần Ngoại Thương Việt Nam (Vietcombank)<br>
	- Tên tài khoản: CÔNG TY CỔ PHẦN PHÁT TRIỂN CÔNG NGHỆ MOBILE STAR<br>
	- Số TK : 0371000424499<br>
	- Chi Nhánh: Tân Định<br>
	<br>
	b. Miền Bắc<br>
	- Ngân Hàng Techcombank<br>
	- Tên Tài Khoản: Chi nhánh Công ty cố phần phát triển công nghệ Mobile Star<br>
	- Số TK: 11524273438018<br>
	- Chi Nhánh: Hoàng Quốc Việt<br>
	<br>
	c. Miền Trung<br>
	- Ngân Hàng TMCP Ngoại Thương (VietComBank):<br>
	- Tên tài khoản: Chi nhánh Công Ty Cổ Phần Phát Triển Công Nghệ Mobile Star<br>
	- Số TK : 0041000124813<br>
	- Ngân Hàng Vietcombank - Chi Nhánh Đà Nẵng<br>
	<br>
	Sau khi chuyển khoản, bạn vui lòng liên hệ với Hotline Mobiistar: 1900 6685 để thông báo.<br><br>
	<label style=\"color: #fd1011;\">Lưu ý:</label><br>
	- Số lượng suất ưu đãi có giới hạn (chỉ 300 suất) nên chương trình có thể kết thúc sớm hơn dự kiến.<br>
	- Khách hàng vui lòng đến đúng địa chỉ cửa hàng đã đăng kí khi đặt trước tại website để có thể mua sản phẩm.<br>
	- Khách hàng phải xuất trình đầy đủ các giấy tờ theo quy định mới có thể nhận máy.<br>
	- Mọi chi phí vận chuyển trong chương trình khách hàng sẽ tự chịu trách nhiệm và chi trả.<br>
	- Nếu phát hiện có gian lận trong quá trình đặt hàng, đơn hàng sẽ bị hủy.<br>
	- Trong trường hợp xảy ra tranh chấp hay vấn đề phát sinh, quyết định của Mobiistar sẽ có hiệu lực cuối cùng.<br><br>
	";
	
	$userClass->full_name = ucwords($userClass->full_name); // viet hoa cac ky tu dau cua ten
// 	$title = '[MOBIISTAR] Chúc mừng '.(addslashes($userClass->full_name)).' nhận mã ưu đãi từ chương trình “XXX”';
// 	$title = 'Mobiistar chúc mừng '.(addslashes($userClass->full_name)).' đặt trước thành công trong chương trình đặt trước PRIME X Max (2018): "ĐẶT CÀNG SỚM, GIÁ CÀNG SƯỚNG"  ';
	$title = 'Chúc mừng bạn '.(addslashes($userClass->full_name)).' đặt trước thành công Prime X Max 2018';
	$content = file_get_contents(MEDIAPATH.'files/preorder.html'); /* Noi dung se de trong file html o thu muc media/files */
	
	/* Thay the nhung thong tin can thiet tu noi dung trong file */
	$content = str_replace('VAR_NAME', $userClass->full_name, $content);
	$content = str_replace('VAR_MODEL', $userClass->model_name, $content);
	$content = str_replace('VAR_CONTENT_VOUCHER', $contentVoucher, $content);
	$content = str_replace('VOUCHER_VALUE', $userClass->voucher_value, $content);
	
	//	require_once(APPPATH.'third_party/mail/class.phpmailer.php');
	require_once(APPPATH.'third_party/mail/PHPMailerAutoload.php');
	$mail = new PHPMailer();
	$mail->IsSMTP();
	$mail->SMTPAuth   = true;
	$mail->Host       = "email-smtp.us-east-1.amazonaws.com";
	$mail->Port       = "587";
	$mail->SMTPSecure = "tls";
	$mail->Username   = "AKIAJEDEGEVJAFFXEVTA";
	$mail->Password   = "AgK8XPx2MLj2uVc5sQHLAzGeY5QGIDipvxZfB8m7lUkU";
	$mail->SetFrom('chuongtrinh@mobiistar.vn', 'Mobiistar');
	$mail->CharSet = 'UTF-8';
	
	$mail->Subject = $title;
	$body = $content;
	$mail->MsgHTML($body);
	$mail->AddAddress($userClass->email, "");
	//    $mail->AddCC('hotro@mobiistar.vn', "");
	// $mail->AddCC('an.le@mobiistar.vn', "");
	//	 $mail->AddCC('hoa.tang@mobiistar.vn', "");
	//	 $mail->AddBCC('buihuynh.kinhluan@gmail.com', "Kinh Luan");
	//    $mail->AddBCC('kinhluan.mobiistar@gmail.com', "Kinh Luan");
	//    $mail->AddBCC('tuan.tran@mobiistar.vn', "Tuan Xuong");
	//    $mail->AddBCC('hoa.tang@mobiistar.vn', "A Hoa");
	$mail->AddBCC('conglinh.tran@mobiistar.vn', "Leon");
	//    $mail->AddBCC('an.le@mobiistar.vn', "Leon");
	return $mail->Send();
}

function deposit_mail($userClass){
	/* Kiem tra mot so thong tin can thiet */
	if(empty($userClass->email) || (filter_var($userClass->email, FILTER_VALIDATE_EMAIL) === false)){ return false; }
	if(empty($userClass->full_name) || empty($userClass->voucher_code) || empty($userClass->voucher_value)){
		return false;
	}
	$userClass->model_price = 5990000;
	$userClass->model_name = 'PRIME X MAX (2018)';
	
	if(is_numeric($userClass->voucher_value)){
		$userClass->voucher_value = number_format($userClass->voucher_value, 0, ",", ".");
	}
	if(is_numeric($userClass->model_price)){
		$userClass->model_price= number_format($userClass->model_price, 0, ",", ".");
	}
	$contentIntroduce = "Bạn đã đặt cọc thành công và giữ suất mua $userClass->model_name với ưu đãi là ".$userClass->voucher_value."VNĐ.";
	if(strpos($userClass->voucher_value, '1.000.000') !== false){
		$contentIntroduce = "Bạn đã đặt cọc thành công và may mắn được tặng ".$userClass->voucher_value."đ khi mua máy $userClass->model_name";
	}
	$contentVoucher = "
	Thời gian nhận sản phẩm đã đặt trước: từ 09.12 đến 16.12.2017.<br>
	Mã đặt trước (lưu ý mã có kí hiệu không đổi so với mã được gửi trong email thông báo đặt trước thành công): <label style=\"color: #fd1011;\">$userClass->voucher_code</label><br>
	Giá trị của mã đặt trước này được áp dụng trên giá bán chính thức của $userClass->model_name là $userClass->model_price đồng.<br>
	Bạn vui lòng mang mã đặt trước này đến cửa hàng showroom của Mobiistar để tiến hành đặt cọc và là 1 trong 100 người nhận ưu đãi lên đến 1.000.000 đồng.<br>
	Mã ưu đãi này được áp dụng khi mua máy $userClass->model_name tại hệ thống showroom của Mobiistar (tại 3 địa điểm: Hà Nội, Hồ Chí Minh và Đà Nẵng), hệ thống cửa hàng Viễn Thông A toàn quốc hoặc mua hàng online tại website <a href=\"http://muahang.mobiistar.vn\">http://muahang.mobiistar.vn</a>.<br>
	Thời gian nhận sản phẩm đã đặt trước: <lalel style=\"color: #000000;\">từ 02.12 đến 12.12.2017</lalel><br>
	Khi đến mua sản phẩm, bạn nhớ mang theo mã đặt trước này (hoặc Số điện thoại) và CMND cá nhân đã đăng kí để nhân viên xác nhận và hỗ trợ bạn mua hàng.<br>
	<br>
	<label style=\"color: #fd1011;\">Lưu ý:</label><br>
	- Số lượng suất ưu đãi có giới hạn (chỉ 300 suất) nên chương trình có thể kết thúc sớm hơn dự kiến.<br>
	- Khách hàng vui lòng đến đúng địa chỉ cửa hàng đã đăng kí khi đặt trước tại website để có thể mua sản phẩm.<br>
	- Khách hàng phải xuất trình đầy đủ các giấy tờ theo quy định mới có thể nhận máy.<br>
	- Mọi chi phí vận chuyển trong chương trình khách hàng sẽ tự chịu trách nhiệm và chi trả.<br>
	- Nếu phát hiện có gian lận trong quá trình đặt hàng, đơn hàng sẽ bị hủy.<br>
	- Trong trường hợp xảy ra tranh chấp hay vấn đề phát sinh, quyết định của Mobiistar sẽ có hiệu lực cuối cùng.<br><br>
	";
	
	$userClass->full_name = ucwords($userClass->full_name); // viet hoa cac ky tu dau cua ten
	// 	$title = '[MOBIISTAR] Chúc mừng '.(addslashes($userClass->full_name)).' nhận mã ưu đãi từ chương trình “XXX”';
	// 	$title = 'Mobiistar chúc mừng '.(addslashes($userClass->full_name)).' đặt trước thành công trong chương trình đặt trước PRIME X Max (2018): "ĐẶT CÀNG SỚM, GIÁ CÀNG SƯỚNG"  ';
	$title = 'Đặt cọc thành công chương trình đặt trước PRIME X Max (2018): "ĐẶT CÀNG SỚM, GIÁ CÀNG SƯỚNG"';
	$content = file_get_contents(MEDIAPATH.'files/deposit.html'); /* Noi dung se de trong file html o thu muc media/files */
	
	/* Thay the nhung thong tin can thiet tu noi dung trong file */
	$content = str_replace('VAR_NAME', $userClass->full_name, $content);
	$content = str_replace('VAR_MODEL', $userClass->model_name, $content);
	$content = str_replace('VAR_INTRODUCE', $contentIntroduce, $content);
	$content = str_replace('VAR_CONTENT_VOUCHER', $contentVoucher, $content);
	$content = str_replace('VOUCHER_VALUE', $userClass->voucher_value, $content);
	
	//	require_once(APPPATH.'third_party/mail/class.phpmailer.php');
	require_once(APPPATH.'third_party/mail/PHPMailerAutoload.php');
	$mail = new PHPMailer();
	$mail->IsSMTP();
	$mail->SMTPAuth   = true;
	$mail->Host       = "email-smtp.us-east-1.amazonaws.com";
	$mail->Port       = "587";
	$mail->SMTPSecure = "tls";
	$mail->Username   = "AKIAJEDEGEVJAFFXEVTA";
	$mail->Password   = "AgK8XPx2MLj2uVc5sQHLAzGeY5QGIDipvxZfB8m7lUkU";
	$mail->SetFrom('chuongtrinh@mobiistar.vn', 'Mobiistar');
	$mail->CharSet = 'UTF-8';
	
	$mail->Subject = $title;
	$body = $content;
	$mail->MsgHTML($body);
	$mail->AddAddress($userClass->email, "");
	//    $mail->AddCC('hotro@mobiistar.vn', "");
	// $mail->AddCC('an.le@mobiistar.vn', "");
	//	 $mail->AddCC('hoa.tang@mobiistar.vn', "");
	//	 $mail->AddBCC('buihuynh.kinhluan@gmail.com', "Kinh Luan");
	//    $mail->AddBCC('kinhluan.mobiistar@gmail.com', "Kinh Luan");
	//    $mail->AddBCC('tuan.tran@mobiistar.vn', "Tuan Xuong");
	//    $mail->AddBCC('hoa.tang@mobiistar.vn', "A Hoa");
	$mail->AddBCC('conglinh.tran@mobiistar.vn', "Leon");
	//    $mail->AddBCC('an.le@mobiistar.vn', "Leon");
	return $mail->Send();
}

function deposit_mail2($userClass){
	/* Kiem tra mot so thong tin can thiet */
	if(empty($userClass->email) || (filter_var($userClass->email, FILTER_VALIDATE_EMAIL) === false)){ return false; }
	if(empty($userClass->full_name) || empty($userClass->voucher_code) || empty($userClass->voucher_value)){
		return false;
	}
	$userClass->model_price = 5990000;
	$userClass->model_name = 'PRIME X MAX (2018)';
	
	if(is_numeric($userClass->voucher_value)){
		$userClass->voucher_value = number_format($userClass->voucher_value, 0, ",", ".");
	}
	if(is_numeric($userClass->model_price)){
		$userClass->model_price= number_format($userClass->model_price, 0, ",", ".");
	}
	$contentIntroduce = "Bạn đã đặt cọc thành công và giữ suất mua $userClass->model_name với ưu đãi là ".$userClass->voucher_value."VNĐ.";
	if(strpos($userClass->voucher_value, '1.000.000') !== false){
		$contentIntroduce = "Bạn đã đặt cọc thành công và may mắn được tặng ".$userClass->voucher_value."đ khi mua máy $userClass->model_name";
	}
	$contentVoucher = "
	Thời gian nhận sản phẩm đã đặt trước: từ 09.12 đến 16.12.2017.<br>
	Mã đặt trước (lưu ý mã có kí hiệu không đổi so với mã được gửi trong email thông báo đặt trước thành công): <label style=\"color: #fd1011;\">$userClass->voucher_code</label><br>
	Giá trị của mã đặt trước này được áp dụng trên giá bán chính thức của $userClass->model_name là $userClass->model_price đồng.<br>
	Bạn vui lòng mang mã đặt trước này đến cửa hàng showroom của Mobiistar để tiến hành đặt cọc và là 1 trong 100 người nhận ưu đãi lên đến 1.000.000 đồng.<br>
	Mã ưu đãi này được áp dụng khi mua máy $userClass->model_name tại hệ thống showroom của Mobiistar (tại 3 địa điểm: Hà Nội, Hồ Chí Minh và Đà Nẵng), hệ thống cửa hàng Viễn Thông A toàn quốc hoặc mua hàng online tại website <a href=\"http://muahang.mobiistar.vn\">http://muahang.mobiistar.vn</a>.<br>
	Thời gian nhận sản phẩm đã đặt trước: <lalel style=\"color: #000000;\">từ 02.12 đến 12.12.2017</lalel><br>
	Khi đến mua sản phẩm, bạn nhớ mang theo mã đặt trước này (hoặc Số điện thoại) và CMND cá nhân đã đăng kí để nhân viên xác nhận và hỗ trợ bạn mua hàng.<br>
	<br>
	<label style=\"color: #fd1011;\">Lưu ý:</label><br>
	- Số lượng suất ưu đãi có giới hạn (chỉ 300 suất) nên chương trình có thể kết thúc sớm hơn dự kiến.<br>
	- Khách hàng vui lòng đến đúng địa chỉ cửa hàng đã đăng kí khi đặt trước tại website để có thể mua sản phẩm.<br>
	- Khách hàng phải xuất trình đầy đủ các giấy tờ theo quy định mới có thể nhận máy.<br>
	- Mọi chi phí vận chuyển trong chương trình khách hàng sẽ tự chịu trách nhiệm và chi trả.<br>
	- Nếu phát hiện có gian lận trong quá trình đặt hàng, đơn hàng sẽ bị hủy.<br>
	- Trong trường hợp xảy ra tranh chấp hay vấn đề phát sinh, quyết định của Mobiistar sẽ có hiệu lực cuối cùng.<br><br>
	";
	
	$userClass->full_name = ucwords($userClass->full_name); // viet hoa cac ky tu dau cua ten
	// 	$title = '[MOBIISTAR] Chúc mừng '.(addslashes($userClass->full_name)).' nhận mã ưu đãi từ chương trình “XXX”';
	// 	$title = 'Mobiistar chúc mừng '.(addslashes($userClass->full_name)).' đặt trước thành công trong chương trình đặt trước PRIME X Max (2018): "ĐẶT CÀNG SỚM, GIÁ CÀNG SƯỚNG"  ';
	$title = 'Đặt cọc thành công chương trình đặt trước PRIME X Max (2018): "ĐẶT CÀNG SỚM, GIÁ CÀNG SƯỚNG"';
	$content = file_get_contents(MEDIAPATH.'files/deposit.html'); /* Noi dung se de trong file html o thu muc media/files */
	
	/* Thay the nhung thong tin can thiet tu noi dung trong file */
	$content = str_replace('VAR_NAME', $userClass->full_name, $content);
	$content = str_replace('VAR_MODEL', $userClass->model_name, $content);
	$content = str_replace('VAR_INTRODUCE', $contentIntroduce, $content);
	$content = str_replace('VAR_CONTENT_VOUCHER', $contentVoucher, $content);
	$content = str_replace('VOUCHER_VALUE', $userClass->voucher_value, $content);
	
	//	require_once(APPPATH.'third_party/mail/class.phpmailer.php');
	require_once(APPPATH.'third_party/mail/PHPMailerAutoload.php');
	$mail = new PHPMailer();
	$mail->IsSMTP();
	$mail->SMTPAuth   = true;
	$mail->Host       = "email-smtp.us-east-1.amazonaws.com";
	$mail->Port       = "587";
	$mail->SMTPSecure = "tls";
	$mail->Username   = "AKIAJEDEGEVJAFFXEVTA";
	$mail->Password   = "AgK8XPx2MLj2uVc5sQHLAzGeY5QGIDipvxZfB8m7lUkU";
	$mail->SetFrom('chuongtrinh@mobiistar.vn', 'Mobiistar');
	$mail->CharSet = 'UTF-8';
	
	$mail->Subject = $title;
	$body = $content;
	$mail->MsgHTML($body);
	$mail->AddAddress('conglinh.tran@mobiistar.vn', "Leon");
// 	$mail->AddAddress("thaotlt.mgc@gmail.com", "Thảo Trần");
	//    $mail->AddCC('hotro@mobiistar.vn', "");
	// $mail->AddCC('an.le@mobiistar.vn', "");
	//	 $mail->AddCC('hoa.tang@mobiistar.vn', "");
	//	 $mail->AddBCC('buihuynh.kinhluan@gmail.com', "Kinh Luan");
	//    $mail->AddBCC('kinhluan.mobiistar@gmail.com', "Kinh Luan");
	//    $mail->AddBCC('tuan.tran@mobiistar.vn', "Tuan Xuong");
	//    $mail->AddBCC('hoa.tang@mobiistar.vn', "A Hoa");
	$mail->AddBCC('conglinh.tran@mobiistar.vn', "Leon");
	//    $mail->AddBCC('an.le@mobiistar.vn', "Leon");
	return $mail->Send();
}

function subscriber_mail($userClass){
	/* Kiem tra mot so thong tin can thiet */
	if(empty($userClass->email)){ return false; }
	if(filter_var($userClass->email, FILTER_VALIDATE_EMAIL) === false){ return false; }
	
// 	if(is_numeric($userClass->voucher_value)){
// 		$userClass->voucher_value = number_format($userClass->voucher_value, 0, ",", ".");
// 	}
// 	if(is_numeric($userClass->model_price)){
// 		$userClass->model_price= number_format($userClass->model_price, 0, ",", ".");
// 	}
	$contentVoucher = "
	Vào 10h sáng ngày mai 5.12.2017, chương trình đặt trước sẽ chính thức mở đăng kí, bạn nhớ nhanh tay điền đầy đủ thông tin đăng kí để có cơ hội trở thành 1 trong 300 người đầu tiên sở hữu $userClass->model_name và nhận ngay ưu đãi 1.000.000 đồng khi đặt cọc sớm nhé.<br> 
	Đăng kí ngay tại: <a href=\"http://dattruoctuyetphamselfie.mobiistar.vn/?utm_source=MBSEmail&utm_medium=EmailDangKyDatTruocPRIMEXMAX_04122017&utm_campaign=EmailDangKyDatTruocPRIMEXMAX_04122017&utm_term=EmailDangKyDatTruocPRIMEXMAX_04122017&utm_content=EmailDangKyDatTruocPRIMEXMAX_04122017\">http://dattruoctuyetphamselfie.mobiistar.vn</a><br>
	Thời gian đăng kí: Từ 5.12.2017 đến 8.12.2017<br><br>
	";
	
	$userClass->full_name = ucwords($userClass->full_name); // viet hoa cac ky tu dau cua ten
	// 	$title = '[MOBIISTAR] Chúc mừng '.(addslashes($userClass->full_name)).' nhận mã ưu đãi từ chương trình “XXX”';
	// 	$title = 'Mobiistar chúc mừng '.(addslashes($userClass->full_name)).' đặt trước thành công trong chương trình đặt trước PRIME X Max (2018): "ĐẶT CÀNG SỚM, GIÁ CÀNG SƯỚNG"  ';
	$title = 'Đặt trước ngay để sở hữu PRIME X Max 2018 với ưu đãi lên đến 1.000.000 đồng';
	$content = file_get_contents(MEDIAPATH.'files/subscriber.html'); /* Noi dung se de trong file html o thu muc media/files */
	
	/* Thay the nhung thong tin can thiet tu noi dung trong file */
	$content = str_replace('VAR_NAME', $userClass->full_name, $content);
	$content = str_replace('VAR_MODEL', $userClass->model_name, $content);
	$content = str_replace('VAR_CONTENT_VOUCHER', $contentVoucher, $content);
// 	$content = str_replace('VOUCHER_VALUE', $userClass->voucher_value, $content);
	
	//	require_once(APPPATH.'third_party/mail/class.phpmailer.php');
	require_once(APPPATH.'third_party/mail/PHPMailerAutoload.php');
	$mail = new PHPMailer();
	$mail->IsSMTP();
	$mail->SMTPAuth   = true;
	$mail->Host       = "email-smtp.us-east-1.amazonaws.com";
	$mail->Port       = "587";
	$mail->SMTPSecure = "tls";
	$mail->Username   = "AKIAJEDEGEVJAFFXEVTA";
	$mail->Password   = "AgK8XPx2MLj2uVc5sQHLAzGeY5QGIDipvxZfB8m7lUkU";
	$mail->SetFrom('chuongtrinh@mobiistar.vn', 'Mobiistar');
	$mail->CharSet = 'UTF-8';
	
	$mail->Subject = $title;
	$body = $content;
	$mail->MsgHTML($body);
	$mail->AddAddress($userClass->email, addslashes($userClass->full_name));
// 	$mail->AddAddress('kinhluan.mobiistar@gmail.com', addslashes($userClass->full_name));
// 	$mail->AddAddress('conglinh.tran@mobiistar.vn', "Leon");
	   $mail->AddCC('hotro@mobiistar.vn', "");
	// $mail->AddCC('an.le@mobiistar.vn', "");
	//	 $mail->AddCC('hoa.tang@mobiistar.vn', "");
	//	 $mail->AddBCC('buihuynh.kinhluan@gmail.com', "Kinh Luan");
	   $mail->AddBCC('kinhluan.mobiistar@gmail.com', "Kinh Luan");
	//    $mail->AddBCC('tuan.tran@mobiistar.vn', "Tuan Xuong");
	//    $mail->AddBCC('hoa.tang@mobiistar.vn', "A Hoa");
	$mail->AddBCC('conglinh.tran@mobiistar.vn', "Leon");
	//    $mail->AddBCC('an.le@mobiistar.vn', "Leon");
	return $mail->Send();
}

function invite_mail($userClass){
	/* Kiem tra mot so thong tin can thiet */
	if(empty($userClass->email)){ return false; }
	if(filter_var($userClass->email, FILTER_VALIDATE_EMAIL) === false){ return false; }
	
		$contentVoucher = "
		
		";
		
		$userClass->full_name = ucwords($userClass->full_name); // viet hoa cac ky tu dau cua ten
		// 	$title = '[MOBIISTAR] Chúc mừng '.(addslashes($userClass->full_name)).' nhận mã ưu đãi từ chương trình “XXX”';
		// 	$title = 'Mobiistar chúc mừng '.(addslashes($userClass->full_name)).' đặt trước thành công trong chương trình đặt trước PRIME X Max (2018): "ĐẶT CÀNG SỚM, GIÁ CÀNG SƯỚNG"  ';
		$title = 'Thư mời tham gia MỞ BÁN VÀ OFFLINE PRIME X MAX 2018';
		$content = file_get_contents(MEDIAPATH.'files/invite.html'); /* Noi dung se de trong file html o thu muc media/files */
		
		/* Thay the nhung thong tin can thiet tu noi dung trong file */
// 		$content = str_replace('VAR_NAME', $userClass->full_name, $content);
		$content = str_replace('VAR_CONTENT_VOUCHER', $contentVoucher, $content);
		// 	$content = str_replace('VOUCHER_VALUE', $userClass->voucher_value, $content);
		
		//	require_once(APPPATH.'third_party/mail/class.phpmailer.php');
		require_once(APPPATH.'third_party/mail/PHPMailerAutoload.php');
		$mail = new PHPMailer();
		$mail->IsSMTP();
		$mail->SMTPAuth   = true;
		$mail->Host       = "email-smtp.us-east-1.amazonaws.com";
		$mail->Port       = "587";
		$mail->SMTPSecure = "tls";
		$mail->Username   = "AKIAJEDEGEVJAFFXEVTA";
		$mail->Password   = "AgK8XPx2MLj2uVc5sQHLAzGeY5QGIDipvxZfB8m7lUkU";
		$mail->SetFrom('chuongtrinh@mobiistar.vn', 'Mobiistar');
		$mail->CharSet = 'UTF-8';
		
		$mail->Subject = $title;
		$body = $content;
		$mail->MsgHTML($body);
		$mail->AddEmbeddedImage(MEDIAPATH."files/thumoifan.png", "myattach", "thumoi.png");
		$mail->AddAttachment(MEDIAPATH."files/thumoifan.png");
		$mail->AddAddress($userClass->email, addslashes($userClass->full_name));
		// 	$mail->AddAddress('kinhluan.mobiistar@gmail.com', addslashes($userClass->full_name));
		// 	$mail->AddAddress('conglinh.tran@mobiistar.vn', "Leon");
// 		$mail->AddCC('hotro@mobiistar.vn', "");
		// $mail->AddCC('an.le@mobiistar.vn', "");
		//	 $mail->AddCC('hoa.tang@mobiistar.vn', "");
		//	 $mail->AddBCC('buihuynh.kinhluan@gmail.com', "Kinh Luan");
// 		$mail->AddBCC('kinhluan.mobiistar@gmail.com', "Kinh Luan");
		//    $mail->AddBCC('tuan.tran@mobiistar.vn', "Tuan Xuong");
		//    $mail->AddBCC('hoa.tang@mobiistar.vn', "A Hoa");
		$mail->AddBCC('conglinh.tran@mobiistar.vn', "Leon");
		//    $mail->AddBCC('an.le@mobiistar.vn', "Leon");
		return $mail->Send();
}

function invite_mail2($userClass){
	/* Kiem tra mot so thong tin can thiet */
	if(empty($userClass->email)){ return false; }
	if(filter_var($userClass->email, FILTER_VALIDATE_EMAIL) === false){ return false; }
	
	$contentVoucher = "
			
		";
	
	$userClass->full_name = ucwords($userClass->full_name); // viet hoa cac ky tu dau cua ten
	// 	$title = '[MOBIISTAR] Chúc mừng '.(addslashes($userClass->full_name)).' nhận mã ưu đãi từ chương trình “XXX”';
	// 	$title = 'Mobiistar chúc mừng '.(addslashes($userClass->full_name)).' đặt trước thành công trong chương trình đặt trước PRIME X Max (2018): "ĐẶT CÀNG SỚM, GIÁ CÀNG SƯỚNG"  ';
	$title = 'Thư mời tham gia Offline Trải nghiệm PRIME X Max 2018 cùng Camera Tinh Tế Miền Tây';
	$content = file_get_contents(MEDIAPATH.'files/invite2.html'); /* Noi dung se de trong file html o thu muc media/files */
	
	/* Thay the nhung thong tin can thiet tu noi dung trong file */
	// 		$content = str_replace('VAR_NAME', $userClass->full_name, $content);
	$content = str_replace('VAR_CONTENT_VOUCHER', $contentVoucher, $content);
	// 	$content = str_replace('VOUCHER_VALUE', $userClass->voucher_value, $content);
	
	//	require_once(APPPATH.'third_party/mail/class.phpmailer.php');
	require_once(APPPATH.'third_party/mail/PHPMailerAutoload.php');
	$mail = new PHPMailer();
	$mail->IsSMTP();
	$mail->SMTPAuth   = true;
	$mail->Host       = "email-smtp.us-east-1.amazonaws.com";
	$mail->Port       = "587";
	$mail->SMTPSecure = "tls";
	$mail->Username   = "AKIAJEDEGEVJAFFXEVTA";
	$mail->Password   = "AgK8XPx2MLj2uVc5sQHLAzGeY5QGIDipvxZfB8m7lUkU";
	$mail->SetFrom('chuongtrinh@mobiistar.vn', 'Mobiistar');
	$mail->CharSet = 'UTF-8';
	
	$mail->Subject = $title;
	$body = $content;
	$mail->MsgHTML($body);
// 	$mail->AddEmbeddedImage(MEDIAPATH."files/thumoifan2.png", "myattach", "thumoi.png");
// 	$mail->AddAttachment(MEDIAPATH."files/thumoifan2.png");
	$mail->AddAddress($userClass->email, addslashes($userClass->full_name));
	// 	$mail->AddAddress('kinhluan.mobiistar@gmail.com', addslashes($userClass->full_name));
	// 	$mail->AddAddress('conglinh.tran@mobiistar.vn', "Leon");
	// 		$mail->AddCC('hotro@mobiistar.vn', "");
	// $mail->AddCC('an.le@mobiistar.vn', "");
	//	 $mail->AddCC('hoa.tang@mobiistar.vn', "");
	//	 $mail->AddBCC('buihuynh.kinhluan@gmail.com', "Kinh Luan");
	// 		$mail->AddBCC('kinhluan.mobiistar@gmail.com', "Kinh Luan");
	//    $mail->AddBCC('tuan.tran@mobiistar.vn', "Tuan Xuong");
	//    $mail->AddBCC('hoa.tang@mobiistar.vn', "A Hoa");
	$mail->AddBCC('conglinh.tran@mobiistar.vn', "Leon");
	//    $mail->AddBCC('an.le@mobiistar.vn', "Leon");
	return $mail->Send();
}

function send_mail_to_booker($userClass){
	/* Kiem tra mot so thong tin can thiet */
	if(empty($userClass->email)){ return false; }
	if(filter_var($userClass->email, FILTER_VALIDATE_EMAIL) === false){ return false; }
	
// 	if(is_numeric($userClass->voucher_value)){
// 		$userClass->voucher_value = number_format($userClass->voucher_value, 0, ",", ".");
// 	}
	
	if(strpos($userClass->model_name, "S2") !== false){
		$expirationDate = 'Từ ngày 10/06/2017 đến 29/06/2017';
		$userClass->model_price = '3.790.000';
	} else{
		$userClass->model_price = '2.790.000';
		$expirationDate = 'Từ ngày 16/06/2017 đến 29/06/2017';
	}
	$voucherValue = &$userClass->voucher_value;
	if($voucherValue == '50%'){ /* Quy dinh gia tri 50% la mua 1 duoc 2 */
		$voucherName = 'MUA 1 ĐƯỢC 2';
		$preVoucherName = 'MÃ ĐẶT TRƯỚC MUA 1 ĐƯỢC 2';
		if(strpos($userClass->model_name, "S2") !== false){
			$expirationDate = 'Duy nhất trong ngày 09/06/2017';
		} else{
			$expirationDate = 'Duy nhất trong ngày 15/06/2017';
		}
	} else{
		$voucherName= 'ĐẶT TRƯỚC '.$voucherValue;
		$preVoucherName = 'MÃ ĐẶT TRƯỚC '.$voucherValue;
	}
	
	$support = "<a href='http://muahang.mobiistar.vn/huong-dan-mua-hang-online.html'>http://muahang.mobiistar.vn/huong-dan-mua-hang-online.html</a>";
	$contentVoucher = "
	$preVoucherName: <label style=\"color: #fd1011;\">$userClass->voucher_code</label><br>
	Giá trị của mã $voucherName được áp dụng trên giá bán chính thức của $userClass->model_name là $userClass->model_price đồng.<br>
	Thời gian nhận hàng với mã $voucherName: $expirationDate.<br>
	";
	if($voucherValue == '50%'){ /* Quy dinh gia tri 50% la mua 1 duoc 2 */
		$contentVoucher.= "
		Mã $voucherName áp dụng khi mua sản phẩm $userClass->model_name tại 3 hệ thống cửa hàng Mobiistar trên toàn quốc hoặc mua online.<br>
		Bạn vui lòng tham khảo cách sử dụng mã $voucherName tại đây: $support<br>
		<bold>Lưu ý:</bold> Đối với khách hàng đặt mua online tại trang mua hàng: <a href='http://muahang.mobiistar.vn/'>http://muahang.mobiistar.vn/</a>, khách hàng vui lòng chọn số lượng mua là 02 để được xác nhận mã và tính thành tiền chỉ 01 máy.<br>
		";
	} else{
		$contentVoucher.= "
		Mã $voucherName áp dụng khi mua sản phẩm $userClass->model_name tại 3 hệ thống cửa hàng Mobiistar trên toàn quốc, hệ thống FPT shop, Viễn Thông A toàn quốc hoặc mua online.<br>
		Bạn vui lòng tham khảo cách sử dụng mã $voucherName tại đây: $support<br>
		";
	}
	
	$userClass->full_name = ucwords($userClass->full_name); // viet hoa cac ky tu dau cua ten
	$title = 'MOBIISTAR Chúc mừng khách hàng '.(addslashes($userClass->full_name)).' đặt mua thành công chương trình “MUA 1 ĐƯỢC 2- SĂN NGAY KẺO HẾT”';
	$content = file_get_contents(MEDIAPATH.'files/mail_to_booker.html'); /* Noi dung se de trong file html o thu muc media/files */
	
	/* Thay the nhung thong tin can thiet tu noi dung trong file */
	$content = str_replace('VAR_NAME', $userClass->full_name, $content);
	$content = str_replace('VAR_MODEL', $userClass->model_name, $content);
	$content = str_replace('VAR_VOUCHER_NAME', $voucherName, $content);
	$content = str_replace('VAR_CONTENT_VOUCHER', $contentVoucher, $content);
// 	echo $content;
	//	require_once(APPPATH.'third_party/mail/class.phpmailer.php');
	require_once(APPPATH.'third_party/mail/PHPMailerAutoload.php');
// 	$mail = new PHPMailer();
// 	$mail->IsSMTP();
// 	$mail->SMTPAuth   = true;
// 	$mail->Host       = "smtp.gmail.com";
// 	$mail->Port       = "587";
// 	$mail->SMTPSecure = "tls";
// 	$mail->Username   = "labs.mobiistar@gmail.com";
// 	$mail->Password   = "sRNKwD8x";
// 	$mail->SetFrom('chuongtrinh@mobiistar.vn', 'Mobiistar');
// 	$mail->CharSet = 'UTF-8';
	$mail = new PHPMailer();
	$mail->IsSMTP();
	$mail->SMTPAuth   = true;
	$mail->Host       = "email-smtp.us-east-1.amazonaws.com";
	$mail->Port       = "587";
	$mail->SMTPSecure = "tls";
	$mail->Username   = "AKIAJEDEGEVJAFFXEVTA";
	$mail->Password   = "AgK8XPx2MLj2uVc5sQHLAzGeY5QGIDipvxZfB8m7lUkU";
	$mail->SetFrom('chuongtrinh@mobiistar.vn', 'Mobiistar');
	$mail->CharSet = 'UTF-8';
// 	$mail->SMTPDebug = 2;
	
	$mail->Subject = $title;
	$body = $content;
	$mail->MsgHTML($body);
	$mail->AddAddress($userClass->email, "");
	$mail->AddCC('hotro@mobiistar.vn', "");
	// $mail->AddCC('an.le@mobiistar.vn', "");
	//	 $mail->AddCC('hoa.tang@mobiistar.vn', "");
//  	$mail->AddBCC('buihuynh.kinhluan@gmail.com', "Kinh Luan");
	$mail->AddBCC('kinhluan.mobiistar@gmail.com', "Kinh Luan");
	//    $mail->AddBCC('tuan.tran@mobiistar.vn', "Tuan Xuong");
	//    $mail->AddBCC('hoa.tang@mobiistar.vn', "A Hoa");
	$mail->AddBCC('conglinh.tran@mobiistar.vn', "Leon");
	//    $mail->AddBCC('an.le@mobiistar.vn', "Leon");
// 	return $mail->Send();
	if(!$mail->send()) {
		if(!empty($userClass->debug)){
			echo 'Message could not be sent.';
			echo 'Mailer Error: ' . $mail->ErrorInfo;
		}
		return false;
	} else {
		return true;
	}
}

function mail_test_1(){

    $contentCard = '';
    $contentVoucher = '';
    $contentApplyFor = ' ';
    $contactLater = 'Mobiistar sẽ liên hệ với bạn về quy trình nhận giải thưởng sau khi chương trình kết thúc vào ngày 04/02/2017.<br><br>';

    $title = 'Tran Cong Linh Test';
    $content = file_get_contents(MEDIAPATH.'files/primex2017.html'); /* Noi dung se de trong file html o thu muc media/files */

    $link = "http://api.labs.mobiistar.com/api/crontabs/metadata/background.jpg?v=".time();
    $link2 = "http://api.labs.mobiistar.com/api/crontabs/metadata/facebook.png?v=".time();
    $link3 = "http://api.labs.mobiistar.com/api/crontabs/metadata/envelope.jpg?v=".time();

    /* Thay the nhung thong tin can thiet tu noi dung trong file */
    $content = str_replace('VAR_NAME', 'Cong Linh', $content);
    $content = str_replace('VAR_GIFT', 'Giai thuong', $content);
    $content = str_replace('VAR_APPLY_FOR', $contentApplyFor, $content);
    $content = str_replace('VAR_CONTENT_CARD', $contentCard, $content);
    $content = str_replace('VAR_CONTENT_VOUCHER', $contentVoucher, $content);
    $content = str_replace('VAR_CONTACT_LATER', $contactLater, $content);
    $content = str_replace('VAR_BACKGROUND', $link, $content);
    $content = str_replace('VAR_FACEBOOK', $link2, $content);
    $content = str_replace('VAR_ENVELOPE', $link3, $content);

//	require_once(APPPATH.'third_party/mail/class.phpmailer.php');
    require_once(APPPATH.'third_party/mail/PHPMailerAutoload.php');
    $mail = new PHPMailer();
    $mail->IsSMTP();
    $mail->SMTPAuth   = true;
    $mail->Host       = "email-smtp.us-east-1.amazonaws.com";
    $mail->Port       = "587";
    $mail->SMTPSecure = "tls";
    $mail->Username   = "AKIAJEDEGEVJAFFXEVTA";
    $mail->Password   = "AgK8XPx2MLj2uVc5sQHLAzGeY5QGIDipvxZfB8m7lUkU";
    $mail->SetFrom('chuongtrinh@mobiistar.vn', 'Mobiistar');
    $mail->CharSet = 'UTF-8';
    $mail->SMTPDebug = 2;
   	$mail->SMTPDebug = 2;

    $mail->Subject = $title;
    $body = $content;
    $mail->MsgHTML($body);
//    $mail->AddAddress($userClass->email, "");
    $mail->AddAddress('conglinh.tran@mobiistar.vn', "Leon");
//    $mail->AddAddress('tclinhga@yahoo.com', "Leon");
//	$mail->AddCC('hotro@mobiistar.vn', "");
    // $mail->AddCC('an.le@mobiistar.vn', "");
//	 $mail->AddCC('hoa.tang@mobiistar.vn', "");
//	 $mail->AddBCC('buihuynh.kinhluan@gmail.com', "Kinh Luan");
//    $mail->AddBCC('kinhluan.mobiistar@gmail.com', "Kinh Luan");
//    $mail->AddBCC('tuan.tran@mobiistar.vn', "Tuan Xuong");
//    $mail->AddBCC('conglinh.tran@mobiistar.vn', "Leon");
//     return $mail->Send();
    if(!$mail->send()) {
    	echo 'Message could not be sent.';
    	echo 'Mailer Error: ' . $mail->ErrorInfo;
    	return false;
    } else {
    	return true;
    }
}

function file_get_php_classes($filepath, &$modules) {
    $php_code = file_get_contents($filepath);
    get_php_classes($php_code, $modules);
}

function get_php_classes($php_code, &$modules) {
    $funcs = array();
    $class_name = null;
    $tokens = token_get_all($php_code);
    $count = count($tokens);
    for ($i = 2; $i < $count; $i++) {
        if ($tokens[$i - 2][0] == T_CLASS
            && $tokens[$i - 1][0] == T_WHITESPACE
            && $tokens[$i][0] == T_STRING) {
            $class_name = $tokens[$i][1]; // $classes[] = $class_name; $classes[$class_name] = array();
        }
        if ($tokens[$i - 2][0] == T_FUNCTION
            && $tokens[$i - 1][0] == T_WHITESPACE
            && $tokens[$i][0] == T_STRING) {
            $func_name = $tokens[$i][1];
            $funcs[$func_name] = 1;
        }
    }
    if(!empty($class_name)){
        $modules[strtolower($class_name)] = $funcs;
    }
}

/* 
	Optimize send mail function
	- parabody = array(
		'VAR_FULL_NAME' => $full_name,
		'VAR_VOUCHER' => $voucher
	);
	- addtion = array(
		// config
	);
 */
function send_mail_optimize($to, $cc, $bcc, $title, $parabody, $addtion){
	
}

function exchange_mail($userClass){
    /* Kiem tra mot so thong tin can thiet */
    if(empty($userClass->email)){ return false; }
    if(filter_var($userClass->email, FILTER_VALIDATE_EMAIL) === false){ return false; }

    $userClass->full_name = ucwords($userClass->full_name); // viet hoa cac ky tu dau cua ten
    $title = 'Đăng kí thành công Mã Đông Đủ Đẹp sắm PRIME X Max và Zumbo S2 Dual với mức giá cực sướng.';
    $content = file_get_contents(MEDIAPATH.'files/exchange.html'); /* Noi dung se de trong file html o thu muc media/files */

    /* Thay the nhung thong tin can thiet tu noi dung trong file */
    $content = str_replace('VAR_NAME', $userClass->full_name, $content);
    $content = str_replace('VAR_CODE', $userClass->voucher_code, $content);

    //	require_once(APPPATH.'third_party/mail/class.phpmailer.php');
    require_once(APPPATH.'third_party/mail/PHPMailerAutoload.php');
//    require_once(APPPATH.'third_party/mail/class.smtp.php');

    $mail = new PHPMailer();
    $mail->IsSMTP();
    $mail->SMTPAuth   = true;
    $mail->Host       = "email-smtp.us-east-1.amazonaws.com";
    $mail->Port       = "587";
    $mail->SMTPSecure = "tls";
    $mail->Username   = "AKIAJEDEGEVJAFFXEVTA";
    $mail->Password   = "AgK8XPx2MLj2uVc5sQHLAzGeY5QGIDipvxZfB8m7lUkU";
    $mail->SetFrom('chuongtrinh@mobiistar.vn', 'Mobiistar');
    $mail->CharSet = 'UTF-8';
//    $mail->SMTPDebug = 2;

//    $mail->AltBody = 'Đăng kí thành công Mã Đông Đủ Đẹp sắm PRIME X Max và Zumbo S2 Dual với mức giá cực sướng.';
//    $mail->Body = '<a href="'.base_url().'">sdajs</a>';
//    $mail->isHTML(true);
    $mail->AddAddress($userClass->email, addslashes($userClass->full_name));
//    $mail->AddAddress('conglinh.tran@mobiistar.vn', "Leon");
    $mail->AddBCC('conglinh.tran@mobiistar.vn', "Leon");

    $mail->Subject = $title;
    $mail->MsgHTML($content);

    $emailed = $mail->Send();
    if(!$emailed) {
        echo 'Message could not be sent.';
//        echo 'Mailer Error: ' . $mail->ErrorInfo;
    }
    return $emailed;
}

function envelope_mail($userClass){
    /* Kiem tra mot so thong tin can thiet */
    if(empty($userClass->email)){ return false; }
    if(filter_var($userClass->email, FILTER_VALIDATE_EMAIL) === false){ return false; }

    $giftList = envelopes_gifts();
    if(!isset($userClass->gift_id) || !isset($giftList[$userClass->gift_id])){
        return false;
    }
    $userClass->full_name = ucwords($userClass->full_name); // viet hoa cac ky tu dau cua ten
    if($userClass->gift_id == 1 || $userClass->gift_id == 2){ /* Noi dung trung non dien thoai */
        $title = 'Chúc mừng bạn nhận lì xì lớn từ Mobiistar - Trúng 01 '.$giftList[$userClass->gift_id].'!';
        $mainContent = 'Mobiistar chúc bạn một năm mới Mậu Tuất tràn tài lộc và đầy niềm vui nhé! Cảm ơn bạn đã tham gia hái lì xì từ Mobiistar và chúc mừng bạn đã may mắn trúng 01 điện thoại Zumbo S2 Dual trong chương trình "Nhận Lộc Tết Đông Đủ Đẹp".';
        $mainContent.='<br>';
        $mainContent.='Máy sẽ được giao hàng đến tận nhà theo địa chỉ bạn cung cấp.';
        $mainContent.='<br>';
        $mainContent.='<br>';
        $mainContent.='Lưu ý:';
        $mainContent.='<br>';
        $mainContent.='- Toàn bộ chi phí giao hàng và vận chuyển đều do Mobiistar chịu trách nhiệm.';
        $mainContent.='<br>';
        $mainContent.='- Khách hàng phải xuất trình đầy đủ các giấy tờ theo quy định mới có thể nhận máy.';
    } elseif ($userClass->gift_id == 3){ /* Noi dung trung non bao hiem */
        $carrierList = carrier_list_arr();
        $title = 'Chúc mừng bạn nhận được lì xì từ Mobiistar - Trúng 01 '.$giftList[$userClass->gift_id].'.';
        $mainContent = 'Mobiistar chúc mừng bạn đã may mắn trúng 01 nón bảo hiểm thời trang. Với phần quà này, Mobiistar thân chúc bạn một năm mới nhiều bình an và may mắn nhé!';
        $mainContent.='<br>';
        $mainContent .= 'Nón sẽ được giao hàng đến tận nhà theo địa chỉ bạn cung cấp.';
    }  elseif ($userClass->gift_id > 3 && $userClass->gift_id < 10){ /* Noi dung trung non the cao */
//        $carrierList = carrier_list_arr();
        $title = 'Chúc mừng bạn nhận được lì xì từ Mobiistar - Trúng 01 '.$giftList[$userClass->gift_id].'.';
        $mainContent = 'Thẻ cào của bạn có mã thẻ là: '.(isset($userClass->code) ? $userClass->code : 'Liên hệ BTC');
        $mainContent.='<br>';
        $mainContent .= 'Nhà mạng bạn đã chọn: '.(isset($userClass->carrier_name) ? $userClass->carrier_name : 'N/A');
    } elseif ($userClass->gift_id == 10){ /* Noi dung trung code free-shipping */
        $title = 'Chúc mừng bạn nhận được lì xì từ Mobiistar - Trúng 01 '.$giftList[$userClass->gift_id].'.';
        $mainContent = 'Mobiistar chúc mừng bạn đã may mắn trúng 01 mã giao hàng miễn phí free-shipping. Với phần quà nay, Mobiistar chúc bạn một năm mới thuận buồm xuôi gió như thời gian ship cực nhanh mà lại miễn phí từ dịch vụ free-shipping của Mobiistar vậy!';
        $mainContent.='<br>';
        $mainContent .= 'Mã được áp dụng khi bạn mua hàng online cho bất kì sản phẩm nào của Mobiistar tại website http://muahang.mobiistar.vn theo 3 bước sau:';
        $mainContent.='<br>';
        $mainContent.='- Bước 1: Vào website http://muahang.mobiistar.vn/ chọn mua sản phẩm như bình thường';
        $mainContent.='<br>';
        $mainContent.='- Bước 2: Nhận cuộc gọi xác nhận đơn hàng và ưu đãi từ nhân viên Mobiistar';
        $mainContent.='<br>';
        $mainContent.='- Bước 3: Nhận hàng và thanh toán đúng với số tiền ưu đãi mà nhân viên xác nhận cho bạn';
        $mainContent.='<br>';
        $mainContent.='Lưu ý: Mã giao hàng miễn phí chỉ áp dụng với những trường hợp vận chuyển dưới 100K.';
        $mainContent.='<br>';
        $mainContent.='<br>';
        $mainContent.='Năm mới đến rồi, còn chờ gì mà chưa sắm ngay điện thoại mới với mã giao hàng miễn phí đặc biệt từ Mobiistar để đón Tết Đông Đủ Đẹp!';
    } else{
        return false;
    }
    $content = file_get_contents(MEDIAPATH.'files/envelopes.html'); /* Noi dung se de trong file html o thu muc media/files */

    /* Thay the nhung thong tin can thiet tu noi dung trong file */
    $content = str_replace('VAR_NAME', $userClass->full_name, $content);
    $content = str_replace('VAR_BODY', $mainContent, $content);

    //	require_once(APPPATH.'third_party/mail/class.phpmailer.php');
    require_once(APPPATH.'third_party/mail/PHPMailerAutoload.php');
    $mail = new PHPMailer();
    $mail->IsSMTP();
    $mail->SMTPAuth   = true;
    $mail->Host       = "email-smtp.us-east-1.amazonaws.com";
    $mail->Port       = "587";
    $mail->SMTPSecure = "tls";
    $mail->Username   = "AKIAJEDEGEVJAFFXEVTA";
    $mail->Password   = "AgK8XPx2MLj2uVc5sQHLAzGeY5QGIDipvxZfB8m7lUkU";
    $mail->SetFrom('chuongtrinh@mobiistar.vn', 'Mobiistar');
    $mail->CharSet = 'UTF-8';

    $mail->Subject = $title;
    $body = $content;
    $mail->MsgHTML($body);
    $mail->AddAddress($userClass->email, addslashes($userClass->full_name));
    $mail->AddBCC('conglinh.tran@mobiistar.vn', "Leon");
    return $mail->Send();
}
function exchange_mail2($userClass){
    /* Kiem tra mot so thong tin can thiet */
    if(empty($userClass->email)){ return false; }
    if(filter_var($userClass->email, FILTER_VALIDATE_EMAIL) === false){ return false; }

    $userClass->full_name = ucwords($userClass->full_name); // viet hoa cac ky tu dau cua ten
    $title = 'Đăng kí thành công Mã Đông Đủ Đẹp sắm PRIME X Max và Zumbo S2 Dual với mức giá cực sướng.';
    $content = file_get_contents(MEDIAPATH.'files/exchange_test.html'); /* Noi dung se de trong file html o thu muc media/files */

    /* Thay the nhung thong tin can thiet tu noi dung trong file */
    $content = str_replace('VAR_NAME', $userClass->full_name, $content);
    $content = str_replace('VAR_CODE', $userClass->voucher_code, $content);

    //	require_once(APPPATH.'third_party/mail/class.phpmailer.php');
    require_once(APPPATH.'third_party/mail/PHPMailerAutoload.php');
//    require_once(APPPATH.'third_party/mail/class.smtp.php');

    $mail = new PHPMailer();
//    $mail->IsSMTP();
//    $mail->SMTPAuth   = true;
//    $mail->Host       = "ssl://email-smtp.us-east-1.amazonaws.com";
//    $mail->Port       = "443";
//    $mail->SMTPSecure = "ssl";
//    $mail->Username   = "AKIAJEDEGEVJAFFXEVTA";
//    $mail->Password   = "AgK8XPx2MLj2uVc5sQHLAzGeY5QGIDipvxZfB8m7lUkU";
//    $mail->SetFrom('chuongtrinh@mobiistar.vn', 'Mobiistar');
//    $mail->CharSet = 'UTF-8';
//    $mail->SMTPDebug = 2;
//
////    $mail->AltBody = 'Đăng kí thành công Mã Đông Đủ Đẹp sắm PRIME X Max và Zumbo S2 Dual với mức giá cực sướng.';
////    $mail->Body = '<a href="'.base_url().'">sdajs</a>';
////    $mail->isHTML(true);
////    $mail->AddAddress($userClass->email, addslashes($userClass->full_name));
//    $mail->AddAddress('tplus.tcl@gmail.com', "Leon");
////    $mail->AddBCC('conglinh.tran@mobiistar.vn', "Leon");
//
//    $mail->Subject = $title;
//    $mail->MsgHTML($content);
//
//    $emailed = $mail->Send();
//    if(!$emailed) {
//        echo 'Message could not be sent.';
//        echo 'Mailer Error: ' . $mail->ErrorInfo;
//    }
    $mail->SMTPDebug = 3;
    $mail->CharSet = 'UTF-8';
    // Tell PHPMailer to use SMTP
    $mail->isSMTP();

// Replace sender@example.com with your "From" address.
// This address must be verified with Amazon SES.
    $mail->setFrom('chuongtrinh@mobiistar.vn', 'Mobiistar');

// Replace recipient@example.com with a "To" address. If your account
// is still in the sandbox, this address must be verified.
// Also note that you can include several addAddress() lines to send
// email to multiple recipients.
    $mail->addAddress('tplus.tcl@gmail.com', 'Tran Cong Linh');

// Replace smtp_username with your Amazon SES SMTP user name.
    $mail->Username = 'AKIAJEDEGEVJAFFXEVTA';

// Replace smtp_password with your Amazon SES SMTP password.
    $mail->Password = 'AgK8XPx2MLj2uVc5sQHLAzGeY5QGIDipvxZfB8m7lUkU';

// Specify a configuration set. If you do not want to use a configuration
// set, comment or remove the next line.
//    $mail->addCustomHeader('X-SES-CONFIGURATION-SET', 'ConfigSet');

// If you're using Amazon SES in a region other than US West (Oregon),
// replace email-smtp.us-west-2.amazonaws.com with the Amazon SES SMTP
// endpoint in the appropriate region.
    $mail->Host = 'email-smtp.us-east-1.amazonaws.com';

// The subject line of the email
    $mail->Subject = 'Amazon SES test (SMTP interface accessed using PHP)';

// The HTML-formatted body of the email
//    $mail->Body = '<h1>Email Test</h1>
//    <p>This email was sent through the
//    <a href="https://aws.amazon.com/ses">Amazon SES</a> SMTP
//    interface using the <a href="https://github.com/PHPMailer/PHPMailer">
//    PHPMailer</a> class.</p>';
$mail->Body = $content;
// Tells PHPMailer to use SMTP authentication
    $mail->SMTPAuth = true;

// Enable TLS encryption over port 587
    $mail->SMTPSecure = 'ssl';
    $mail->Port = 465;

// Tells PHPMailer to send HTML-formatted email
    $mail->isHTML(true);

// The alternative email body; this is only displayed when a recipient
// opens the email in a non-HTML email client. The \r\n represents a
// line break.
    $mail->AltBody = "Email Test\r\nThis email was sent through the 
    Amazon SES SMTP interface using the PHPMailer class.";
$emailed = $mail->send();
    if(!$emailed) {
        echo "Email not sent. " , $mail->ErrorInfo , PHP_EOL;
    } else {
        echo "Email sent!" , PHP_EOL;
    }

    return $emailed;
}

function testSession(){
	echo '---test---';
	echo $_SESSION['user_username'];
}