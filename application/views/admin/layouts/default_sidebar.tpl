
<section class="sidebar">
    <!-- Sidebar user panel -->
    <div class="user-panel">
        <div class="pull-left image">
            <a href="/{$this->session->userdata('lang_key')}/admin/profiles/view" style="color:#ffffff;">
            <img style="width:45px; height: 45px;" src="{if $this->session->userdata('user_avatar') eq ""}{base_url()}media/images/160_160.png{else}{base_url()}media/images/profiles/{$this->session->userdata('user_avatar')}{/if}" class="img-circle" alt="User Image" />
            </a>
        </div>
        <div class="pull-left info">
            <p><a href="/{$this->session->userdata('lang_key')}/admin/profiles/view" style="color:#ffffff;">{$this->session->userdata('user_fullname')}</a></p>
            <a href="/{$this->session->userdata('lang_key')}/admin/profiles/view"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
    </div>
    {$this->session->userdata('user_menu')}
</section>
<!-- /.sidebar -->
<script>
    /*Active menu*/
    var homeText = '{lang('home')}';
    var excludeList = {
        models_spec: 'models_view',
        models_edit: 'models_view',
        models_release: 'models_view',
        brands_edit: 'brands_view',
        comparisons_detail: 'comparisons_view',
        comparisons_edit: 'comparisons_view',
        skus_edit: 'skus_view',
        skus_spec: 'skus_view',
        segments_edit: 'segments_view',
        points_detail: 'points_view',
        points_edit: 'points_view',
        languages_edit: 'languages_view',
        'manage-document_detail': 'manage-document_view',
        'manage-document_edit': 'manage-document_view'
    };
    try{
        var langKey = '{$smarty.session.lang_key}';
        var currPath = window.location.pathname;
        var realTitle = '';
        currPath = currPath.replace('/elearning', '');
        currPath = currPath.replace('/'+langKey+'/admin/', '');
        currPath = currPath.replace('/admin/', '');
        currPath = currPath.replace('/', '_');
        currPath = (currPath.indexOf('/') > 0) ? currPath.substr(0, currPath.indexOf('/')) : currPath;
        console.log(currPath);
        if(excludeList.hasOwnProperty(currPath)){
            currPath = excludeList[currPath];
            realTitle = true;
        }
        var objTmp = $('.'+currPath);
        objTmp.addClass('active');
        var level = $('.'+currPath).attr('level');
        var breadcrumb = [objTmp.text()];
        if(level != '' && level != undefined && level != null && parseInt(level) > 0){
            if(objTmp.attr('level') == 1){
                breadcrumb.push(objTmp.attr('head'));
            }
            level = parseInt(level);
            for(var i=0; i<level; i++){
                objTmp = objTmp.parent().parent();
                if(objTmp.prop('nodeName') === 'LI'){
                    objTmp.addClass('active');
                    var anchorText = objTmp.find('a');
                    if(typeof anchorText === 'object'){
                        anchorText = anchorText[0];
                        breadcrumb.push($(anchorText).text());
                    }
                }
                if(objTmp.attr('level') == 1){
                    breadcrumb.push(objTmp.attr('head'));
                }
            }
        } else {
            $('.'+currPath).parent().parent().addClass('active');
        }
        $(document).ready(function() {
            try{
                if(realTitle){
                    realTitle = $('#real-title').text();
                    if(realTitle != ''){
                        breadcrumb[0] = realTitle;
                    }
                }
                var lenCrumb = breadcrumb.length;
                var bcHtml = '<li><a href="#"><i class="fa fa-home"></i> '+homeText+'</a></li>';
                for(var i=lenCrumb - 1; i >= 0; i--){
                    bcHtml += '<li>'+breadcrumb[i]+'</li>';
                }
                $('.breadcrumb').html(bcHtml);
                var iTmp = 1;
                if(lenCrumb == 2){
                    iTmp = 0;
                }
                if(typeof breadcrumb[iTmp] == 'string'){
                    document.title += ' - '+ breadcrumb[iTmp];
                }
            } catch (e){
                console.log(e.message);
            }
        });
    } catch(e){
        console.log(e.message);
    }
</script>
