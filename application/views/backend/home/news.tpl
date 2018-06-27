<textarea class="edit-text" id="edit-content-detail" style="width: 100%; height: 500px;">{$product->detail}</textarea>
<button type="button" class="btn btn-success" data-dismiss="modal" onclick="saveData()" style="margin-top: 20px;">Save</button>

<script>
    editorDetail = null;
    let nid = '{$product->id}';
    function saveData(){
        let info = {
            type:'update',
            id: nid,
            detail: editorDetail.getValue()
        };
        $.ajax({
            type: 'post',
            url: '/backend/save',
            data: info,
            dataType: 'json',
            success: function (result) {
                console.log(result);
            },
            error: function (XMLHttpRequest) {
                console.log(XMLHttpRequest.statusText);
            }
        });
    }
    window.onload = function(){
        $( document ).ready(function() {
            console.log( "ready!!!" );
            Simditor.locale = 'en-US';
            let toolbar = ['title', 'bold', 'italic', 'underline', 'strikethrough', 'fontScale', 'color', '|', 'ol', 'ul', 'blockquote', 'code', 'table', '|', 'link', 'image', 'hr', '|', 'indent', 'outdent', 'alignment'];
            mobileToolbar = ["bold", "underline", "strikethrough", "color", "ul", "ol"];
            if (mobilecheck()) {
                toolbar = mobileToolbar;
            }
            setTimeout(function(){
                editorDetail = new Simditor({
                    textarea: $('#edit-content-detail'),
                    placeholder: 'Soạn nội dung',
                    toolbar: toolbar,
                    pasteImage: true,
                    defaultImage: 'assets/images/image.png',
                    upload: location.search === '?upload' ? {
                        url: '/upload'
                    } : false
                });
            }, 10);
            $preview = $('#preview');
            if ($preview.length > 0) {
                return editor.on('valuechanged', function(e) {
                    return $preview.html(editor.getValue());
                });
            }
        });
        $( '#edit-photo-container' ).on( 'hidden.bs.modal' , function() {
            if ( $( '.modal:visible' ).length ) {
                setTimeout(function(){
                    $( 'body' ).addClass( 'modal-open' );
                }, 100);
            }
        } );
    };
</script>
<!-- Include Sim-editor file. -->
<link rel='stylesheet' href='/static/frontend/plugins/simditor/styles/simditor.css' type='text/css'/>
<script type='text/javascript' src='/static/frontend/plugins/simditor/scripts/mobilecheck.js'></script>
<script type='text/javascript' src='/static/frontend/plugins/simditor/scripts/module.js'></script>
<script type='text/javascript' src='/static/frontend/plugins/simditor/scripts/hotkeys.js'></script>
<script type='text/javascript' src='/static/frontend/plugins/simditor/scripts/uploader.js'></script>
<script type='text/javascript' src='/static/frontend/plugins/simditor/scripts/simditor.js'></script>


<!-- Facebook Comments Plugin for WordPress: http://peadig.com/wordpress-plugins/facebook-comments/ -->
<!--
<div class='fb-cmt'>
    <h3 class="facebook123">Bình Luật Trên Facebook</h3>
    <div class="fb-comments" data-href="https://trumgiasi.com/" data-numposts="5" data-width="100%" data-colorscheme="light"></div>
</div>
-->