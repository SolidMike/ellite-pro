<link href="/modules/admin/assets/css/admin-index.css" rel="stylesheet">
<script type="text/javascript" src="/modules/admin/assets/js/jquery.sparkline.min.js"></script>
<script type="text/javascript" src="/modules/admin/assets/js/moment.js"></script>
<script type="text/javascript" src="/modules/admin/assets/js/admin.js"></script>

<div id="main">
    <div class="row">
        <div class="col-sm-10">
            <ul class="breadcrumb dashboard">
                <li class="active"><i class="fa fa-dashboard"></i> Панель управления</li>
            </ul>
        </div>
        <div class="col-sm-2">
            <div class="btn-group dashboard">
                <a href="#" class="btn btn-grey dropdown-toggle col-sm-12" data-toggle="dropdown" aria-expanded="true">
                    <i class="fa fa-bolt"></i> Новая запись
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li class="dropdown-header">Материалы</li>
                    <li><a href="/admin/page/add">Создать страницу</a></li>
                    <li><a href="/admin/category/add">Создать категорию</a></li>
                    <?php if ($is_shop == 1) { ?>
                        <li class="dropdown-header">eCommerce</li>
                        <li><a href="/admin/shop/add_order">Создать заказ</a></li>
                        <li><a href="/admin/shop_product/add_product">Создать товар</a></li>
                        <li><a href="/admin/shop_product/add_properties">Создать характеристики товара</a></li>
                        <li><a href="/admin/shop_catalog/add_catalog">Создать каталог</a></li>
                    <?php } ?>
                    <li class="dropdown-header">Пользователи</li>
                    <li><a href="/admin/auth/create_user">Создать пользователя</a></li>
                </ul>
            </div>
        </div>
    </div>

    <!-- admin_top_menu -->
    <div class="menu-header" id="banner">
        <div class="hidden-xs">
            <?php if ($is_shop == 1) { ?>
                <div class="row">
                    <div class="col-md-2 col-sm-4">
                        <div class="circle-tile">
                            <a href="/admin/auth/users_list">
                                <div class="circle-tile-heading dark-blue">
                                    <i class="fa fa-users fa-fw fa-3x"></i>
                                </div>
                            </a>
                            <div class="circle-tile-content dark-blue">
                                <div class="circle-tile-description text-faded">
                                    Пользователи
                                </div>
                                <div class="circle-tile-number text-faded">
                                    <?=$users?>
                                    <span id="sparklineA"></span>
                                </div>
                                <a href="#" class="circle-tile-footer">Подробнее <i class="fa fa-chevron-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-4">
                        <div class="circle-tile">
                            <a href="/admin/shop/order_list">
                                <div class="circle-tile-heading green">
                                    <i class="fa fa-money fa-fw fa-3x"></i>
                                </div>
                            </a>
                            <div class="circle-tile-content green">
                                <div class="circle-tile-description text-faded">
                                    Общая прибыль
                                </div>
                                <div class="circle-tile-number text-faded">
                                    <?=$total_sum['order_price']?>
                                </div>
                                <a href="#" class="circle-tile-footer">Подробнее <i class="fa fa-chevron-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-4">
                        <div class="circle-tile">
                            <a href="/admin/page">
                                <div class="circle-tile-heading orange">
                                    <i class="fa fa-image fa-fw fa-3x"></i>
                                </div>
                            </a>
                            <div class="circle-tile-content orange">
                                <div class="circle-tile-description text-faded">
                                    Материалы
                                </div>
                                <div class="circle-tile-number text-faded">
                                    <?=$pages+$category+$products+$catalogs?>
                                    <span id="sparklineB"><?=$pages?>, <?=$category?>, <?=$products?>, <?=$catalogs?></span>
                                </div>
                                <a href="#" class="circle-tile-footer">Подробнее <i class="fa fa-chevron-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-4">
                        <div class="circle-tile">
                            <a href="/admin/modules">
                                <div class="circle-tile-heading blue">
                                    <i class="fa fa-cogs fa-fw fa-3x"></i>
                                </div>
                            </a>
                            <div class="circle-tile-content blue">
                                <div class="circle-tile-description text-faded">
                                    Модули
                                </div>
                                <div class="circle-tile-number text-faded">
                                    <?=$modules?>
                                </div>
                                <a href="#" class="circle-tile-footer">Подробнее <i class="fa fa-chevron-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-4">
                        <div class="circle-tile">
                            <a href="/admin/shop/order_list">
                                <div class="circle-tile-heading red">
                                    <i class="fa fa-shopping-cart fa-fw fa-3x"></i>
                                </div>
                            </a>
                            <div class="circle-tile-content red">
                                <div class="circle-tile-description text-faded">
                                    Заказы
                                </div>
                                <div class="circle-tile-number text-faded">
                                    <?=$orders?>
                                    <span id="sparklineC"></span>
                                </div>
                                <a href="#" class="circle-tile-footer">Подробнее <i class="fa fa-chevron-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-4">
                        <div class="circle-tile">
                            <a href="/admin/forms">
                                <div class="circle-tile-heading purple">
                                    <i class="fa fa-comments fa-fw fa-3x"></i>
                                </div>
                            </a>
                            <div class="circle-tile-content purple">
                                <div class="circle-tile-description text-faded">
                                    Заявки
                                </div>
                                <div class="circle-tile-number text-faded">
                                    <?=$forms?>
                                    <span id="sparklineD"></span>
                                </div>
                                <a href="#" class="circle-tile-footer">Подробнее <i class="fa fa-chevron-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            <?php } else { ?>
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="circle-tile">
                            <a href="/admin/auth/users_list">
                                <div class="circle-tile-heading dark-blue">
                                    <i class="fa fa-users fa-fw fa-3x"></i>
                                </div>
                            </a>
                            <div class="circle-tile-content dark-blue">
                                <div class="circle-tile-description text-faded">
                                    Пользователи
                                </div>
                                <div class="circle-tile-number text-faded">
                                    <?=$users?>
                                    <span id="sparklineA"></span>
                                </div>
                                <a href="#" class="circle-tile-footer">Подробнее <i class="fa fa-chevron-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="circle-tile">
                            <a href="/admin/page">
                                <div class="circle-tile-heading green">
                                    <i class="fa fa-image fa-fw fa-3x"></i>
                                </div>
                            </a>
                            <div class="circle-tile-content green">
                                <div class="circle-tile-description text-faded">
                                    Материалы
                                </div>
                                <div class="circle-tile-number text-faded">
                                    <?=$pages+$category?>
                                    <span id="sparklineB"><?=$pages?>, <?=$category?></span>
                                </div>
                                <a href="#" class="circle-tile-footer">Подробнее <i class="fa fa-chevron-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="circle-tile">
                            <a href="/admin/modules">
                                <div class="circle-tile-heading blue">
                                    <i class="fa fa-cogs fa-fw fa-3x"></i>
                                </div>
                            </a>
                            <div class="circle-tile-content blue">
                                <div class="circle-tile-description text-faded">
                                    Модули
                                </div>
                                <div class="circle-tile-number text-faded">
                                    <?=$modules?>
                                </div>
                                <a href="#" class="circle-tile-footer">Подробнее <i class="fa fa-chevron-circle-right"></i></a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-sm-6">
                        <div class="circle-tile">
                            <a href="/admin/forms">
                                <div class="circle-tile-heading red">
                                    <i class="fa fa-comments fa-fw fa-3x"></i>
                                </div>
                            </a>
                            <div class="circle-tile-content red">
                                <div class="circle-tile-description text-faded">
                                    Заявки
                                </div>
                                <div class="circle-tile-number text-faded">
                                    <?=$forms?>
                                    <span id="sparklineD"></span>
                                </div>
                                <a href="#" class="circle-tile-footer">Подробнее <i class="fa fa-chevron-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            <?php } ?>
        </div>
    </div>
    <!-- admin_top_menu -->


    <div class="row">
        <div class="col-sm-3">
            <!--<div id="mscms">
                <a target="_blank" href="http://mscms.com.ua"><img src="/modules/admin/assets/images/mscms_2.png" title="http://mscms.com.ua" alt="http://mscms.com.ua" class="img-thumbnail" /></a>
            </div>-->
            <a target="_blank" href="http://mscms.com.ua"><img src="/modules/admin/assets/images/mnogoslovcms.png" title="http://mscms.com.ua" alt="http://mscms.com.ua" /></a>
            <div class="panel panel-info" style="margin-top: -58px;">
                <div class="panel-heading">Информация о системе</div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <p><?=$_SERVER['SERVER_SOFTWARE']?></p>
                            <hr>
                            <p>Версия MySQL: <?=mysql_get_server_info()?></p>
                            <p>Версия PHP: <?=phpversion()?></p>
                            <p>IP сервера: <?=$_SERVER['SERVER_ADDR']?></p>
                            <p>IP пользователя: <?=$_SERVER["REMOTE_ADDR"];?></p>
                            <hr>
                            <p><?=php_uname()?></p>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-9">
            <div class="panel panel-default">
                <div class="panel-heading">Журнал событий</div>
                <div class="panel-body">
                    <table class="table table-striped table-hover ">
                        <thead>
                        <tr>
                            <th class="col-sm-1">ID</th>
                            <th class="col-sm-3">Дата</th>
                            <th class="col-sm-7">Событие</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php foreach($logs as $log) : ?>
                            <tr>
                                <td><?=$log['id']?></td>
                                <td><i class="fa fa-calendar-o"></i>&nbsp;<?=$log['date']?></td>
                                <td><i class="fa fa-bullhorn"></i>&nbsp;<?=$log['message']?></td>
                            </tr>
                        <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>