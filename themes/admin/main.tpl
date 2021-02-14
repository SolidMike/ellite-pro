<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MS CMS Dashboard</title>
    <link rel="icon" type="image/png" href="/themes/admin/images/favicon.png" />
    <!-- Bootstrap -->
    <link href="/themes/admin/css/bootstrap-spacelab-my.css" rel="stylesheet">
    <link href="/themes/admin/css/admin.css" rel="stylesheet">
    <!----font-Awesome----->
    <link href="/themes/admin/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <?=$added_style?>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/themes/admin/js/jquery-1.10.2.min.js"></script>

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/themes/admin/js/bootstrap.min.js"></script>

    <!-- ElFinder scripts and styles -->
    <link rel="stylesheet" type="text/css" media="screen" href="/plugins/elfinder/css/elfinder.min.css">
    <script type="text/javascript" src="/plugins/elfinder/js/elfinder.min.js"></script>
    <script type="text/javascript" src="/plugins/elfinder/js/i18n/elfinder.ru.js"></script>

    <!-- jQuery UI -->
    <link rel="stylesheet" type="text/css" media="screen" href="/themes/admin/js/jqueryui/jquery-ui.min.css" />
    <script type="text/javascript" src="/themes/admin/js/jqueryui/jquery-ui.min.js"></script>

    <?=$added_scripts?>

</head>
<body>

<div class="page-header">
    <?=$admin_main_menu?>
</div>

<div class="main">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <!--<div id="page-breadcrumbs">
                    <?=$admin_menu_breadcrumbs?>
                </div>-->

                <div id="alerts">
                    <?=$admin_alerts?>
                </div>

                <div id="page-content">
                    <?=$content?>
                </div>
            </div>
        </div>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <p class="text-muted pull-left"><img src="/themes/admin/images/logo/1_64_64.png" width="24" height="24" title="MSCMS" /> <a href="http://mscms.com.ua" target="_blank" title="Поддержка системы администрирования сайтом. Разработка модулей. MSCMS" alt="MSCMS"> MSCMS</a> v::<?=$cms_version?></p>
        <p class="text-muted pull-right">Загружено за <strong><?php echo $this->benchmark->elapsed_time();?></strong> секунд</p>
    </div>
</footer>

<div id="elFinder"></div>
<!-- jQuery tinyMce -->
<script type="text/javascript" src="/plugins/tinymce/jquery.tinymce.min.js"></script>
<!-- jQuery polyakov.co.ua scripts -->
<script type="text/javascript" src="/themes/admin/js/cms-admin.js"></script>
<!-- bootstrap validator -->
<script type="text/javascript" src="/themes/admin/js/bootstrapValidator.js"></script>
<!-- bootstrap bootbox -->
<script type="text/javascript" src="/themes/admin/js/bootbox.min.js"></script>

</body>
</html>