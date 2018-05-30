{literal}
    <script type="text/javascript">
        function showHidechatbox(){
            var t=document.getElementById("chatbox"),o=t.offsetWidth;
            t.opened?movechatbox(0,19-o):movechatbox(19-o,0),t.opened=!t.opened;
            t.opened?$('#coccoc-alo-phoneIcon').hide():($('#coccoc-alo-phoneIcon').show());
        }
        function movechatbox(t,o){
            var a=document.getElementById("chatbox"),e=Math.abs(t-o)>10?5:1,n=o>t?1:-1,i=t+e*n;
            a.style.right=i.toString()+"0px",t!=o&&setTimeout("movechatbox("+i+", "+o+")",1)
        }
    </script>
{/literal}

<div class="phone-s">
    <div class="coccoc-alo-phone coccoc-alo-green coccoc-alo-show" id="coccoc-alo-phoneIcon" onclick="showHidechatbox(); $(this).hide();" style="position: fixed; right: -40px; bottom: 0px; display: block; transform: scale(1, 1); transform-origin: left top 0px;top: 15%">
        <div class="coccoc-alo-ph-circle-time">
            <img id="coccoc-alo-external-site-favicon" src="">
            <span id="coccoc-alo-external-site-counter"></span>
        </div>
        <canvas id="stopwatch"></canvas>
        <div class="coccoc-alo-ph-circle"></div>
        <div class="coccoc-alo-ph-circle-fill"></div>
        <div class="coccoc-alo-ph-img-circle coccoc-alo-ph-circle-shake"></div>
        <div class="coccoc-alo-ph-circle-close"></div>
    </div>
    <div style="right: -230px;" id="chatbox">
        <span class="closeqc" onclick="showHidechatbox()"></span>
        <div class="chatboxtab" onclick="showHidechatbox()"></div>
        <div class="chatboxcontent">
            <h4 style="padding-left: 60px;">Hỗ trợ & Tư vấn</h4>
            <!-- /ZALO -->
            <div class='support-online'>
                <div class='support-img'><img src="/wp-content/uploads/2017/02/zaloicon.jpg" alt="Zalo Trùm Giá Sỉ" height="30" width="30"></div>
                <div class='support-phone'><a href="tel://0974330551">0932.642.505</a></div>
            </div>
            <div class='support-online'>
                <div class='support-img'><img src="/wp-content/uploads/2017/02/zaloicon.jpg" alt="Zalo Trùm Giá Sỉ" height="30" width="30"></div>
                <div class='support-phone'><a href="tel://0994493123">0979.493.123</a></div>
            </div>
            <div class='support-online'>
                <div class='support-img'><img src="/wp-content/uploads/2017/02/zaloicon.jpg" alt="Zalo Trùm Giá Sỉ" height="30" width="30"></div>
                <div class='support-phone'><a href="tel://0919705086">0919.7050.86</a></div>
            </div>
            <div class='support-online'>
                <div class='support-img'><img src="https://trumgiasi.com/wp-content/uploads/2017/02/fbicon.jpg" alt="Facebook Trùm Giá Sỉ" height="30" width="30"></div>
                <div class='support-phone'><a href="https://www.facebook.com/trumgiasi.san/" target="_blank">FB Chủ Shop</a></div>
            </div>
            <div class='support-online'>
                <div class='support-img'><img src="https://trumgiasi.com/wp-content/uploads/2017/02/fbicon.jpg" alt="Facebook Trùm Giá Sỉ" height="30" width="30"></div>
                <div class='support-phone'><a href="https://www.facebook.com/trumgiasishop/" target="_blank">Fanpage Shop</a></div>
            </div>
            <div class='support-online'>
                <div class='support-img'><img src="/wp-content/uploads/2017/02/phone-icon.jpg" alt="SĐT Trùm Giá Sỉ" height="30" width="30"></div>
                <div class='support-phone'><a href="tel://0919705086">0919.7050.86</a></div>
            </div>
            <!-- /ZALO -->
        </div>
    </div>
    <script>//showHidechatbox()</script>


</div>