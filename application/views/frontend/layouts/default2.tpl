<!DOCTYPE html>
<html lang="en">
<head>
  <title>Công ty TNHH Cơ Khí Chính Xác Toàn Thắng {if $subtitle neq null} - {$subtitle} {/if}</title>
  <meta charset="utf-8"/>
  <meta name="format-detection" content="telephone=no"/>
  <link rel="canonical" href="http://www.mobiistar.vn/" />
	<link rel="author" href="https://plus.google.com/+MobiistarOfficial" />
	<meta name="description" content="Công ty TNHH Cơ Khí Chính Xác Toàn Thắng - Dẫn đầu chất lượng" />
	<meta property="og:type" content="article" />
	<meta property="og:title" content="Công ty TNHH Cơ Khí Chính Xác Toàn Thắng - Dẫn đầu chất lượng" />
	<meta property="og:description" content="Công ty TNHH Cơ Khí Chính Xác Toàn Thắng - Dẫn đầu chất lượng" />
	<meta property="og:url" content="{base_url()}" />
	<meta property="og:image" content="{base_url()}media/filemanager/source/home/introduce.jpg" />
	<meta property="article:published_time" content="2017-10-19" />
	<meta property="article:modified_time" content="2017-10-20" />
	<meta property="og:site_name" content="Toan Thang Precision" />
	<meta property="fb:app_id" content="472186849643124" />
  
  <link rel="icon" href="{base_url()}static/default/frontend/images/favicon.ico" type="image/x-icon"/>
  <link rel="stylesheet" href="{base_url()}static/default/frontend/css/grid.css"/>
  <link rel="stylesheet" href="{base_url()}static/default/frontend/css/style.css"/>
  <link rel='stylesheet' href="{base_url()}static/default/frontend/css/material-icons.css">
  <!-- <link rel='stylesheet' href="{base_url()}static/default/frontend/css/google-map.css"> -->
  <link rel="stylesheet" href="{base_url()}static/default/frontend/css/camera.css"/>
  <link rel="stylesheet" href="{base_url()}static/default/frontend/css/custom.css"/>
  {$listCss}
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
  <script src="{base_url()}static/default/frontend/js/jquery.js"></script>
  <script src="{base_url()}static/default/frontend/js/jquery-migrate-1.2.1.js"></script> 
  <script src='{base_url()}static/default/frontend/js/device.min.js'></script>
  <script type="text/javascript">
  	var rootBaseUrl = '{base_url()}';
  	var googleMapIframe = '{$smarty.session.sys_cnf->cnf_google_map->v1}';
  	var youtubeIframe = '{$smarty.session.sys_cnf->cnf_video_youtube->v1}';
  </script>
  
</head>
<body>
<div class="page">
  {include file='frontend/layouts/social.tpl'}
  {include file='frontend/layouts/header.tpl'}
  <main>
	{$content}
  </main>
  {include file='frontend/layouts/footer.tpl'}
</div>
<!-- <div class="loading">Loading&#8230;</div> -->
<script src="{base_url()}static/admin/template/plugins/blockui/jquery.blockUI.js"></script>
<script src="{base_url()}static/default/frontend/js/script.js"></script>
	{$listJs}
	
  {include file='frontend/layouts/contact.tpl'}
<script type="text/javascript">
setTimeout(function(){
	var giframe = document.getElementById('google-map-iframe');
    if(giframe != null){
        giframe.setAttribute('src', googleMapIframe);
	}
}, 3000);
setTimeout(function(){
	var yiframe = document.getElementById('youtube-iframe');
	if(yiframe != null){
		yiframe.setAttribute('src', youtubeIframe);
	}
}, 1000);
function seekingAct(e, _this) {
    if (e.which === 13) {
        var seekingUrl = rootBaseUrl+'seek/'+encodeURIComponent(_this.value);
        console.log(seekingUrl);
        window.location = seekingUrl;
        return false;
    }
};
</script>
</body>