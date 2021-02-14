<div class="navbar navbar-default navbar-top first">
    <div class="container">
        <div class="navbar-header">
            <a href="/" class="navbar-brand" target="_blank"><?php echo $sitename; ?></a>
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="navbar-collapse collapse" id="navbar-main">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> <?php echo $this->session->userdata('username'); ?><b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="/admin/auth/edit_user/<?php echo $this->session->userdata('user_id'); ?>"><i class="fa fa-asterisk"></i> Мой профиль</a></li>
                        <li class="divider"></li>
                        <li><a href="/admin/auth/logout"><i class="fa fa-lock"></i> Выйти</a></li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-right search-form" action="/admin/search" method="post">
                <input type="text" class="form-control" name="search" placeholder="Поиск">
                <a href="#" class="submit" id="search-submit"><i class="fa fa-search fa-lg"></i></a>
            </form>
        </div>
    </div>
</div>

<div class="navbar navbar-inverse navbar-fixed-top second">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div id="hmenu" class="navbar-collapse collapse navbar-inverse-collapse">
            <ul class="nav navbar-nav">
                <li><a href="/admin"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Главная</a></li>
                <li><a href="/admin/forms"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span> Заявки <span class="badge"><?= $new_form_orders; ?></span></a> </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="glyphicon glyphicon-align-justify" aria-hidden="true"></span> Материалы<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="/admin/page">Все страницы</a></li>
                        <li><a href="/admin/page/add">Создать страницу</a></li>
                    </ul>
                </li>

                <?php if($is_menu == '1') { ?>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="glyphicon glyphicon-tasks" aria-hidden="true"></span> Меню<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="/admin/menu/menus_list">Список меню</a></li>
                        <li class="divider"></li>
                        <?php foreach ($menus_list as $menu) : ?>
                            <li><a href="/admin/menu/menu_list/<?=$menu['id']?>"><?=$menu['name']?></a></li>
                        <?php endforeach; ?>
                    </ul>
                </li>
                <?php } ?>

                <?php if($is_shop == '1') { ?>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> eCommerce<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-header">Каталог товаров</li>
                            <li><a href="/admin/shop_product/product_list">Товары</a></li>
                            <li><a href="/admin/shop_catalog/catalog_list">Каталоги</a></li>
                            <li><a href="/admin/shop_product/properties_list">Характеристики товаров</a></li>
                            <li class="divider"></li>
                            <li class="dropdown-header">Заказы</li>
                            <li><a href="/admin/shop/order_list">Все заказы</a></li>
                            <li class="divider"></li>
                            <li class="dropdown-header">Настройки</li>
                            <li><a href="/admin/shop/brand_list">Бренды</a></li>
                            <li><a href="/admin/shop/currency_list">Валюта</a></li>
                            <li><a href="/admin/shop/delivery_list">Способы доставки</a></li>
                            <li><a href="/admin/shop/payment_list">Способы оплаты</a></li>
                        </ul>
                    </li>
                <?php } ?>

                <?php if($is_fragments == '1') { ?>
                    <li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> Фрагменты<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li class="dropdown-header">Фрагменты</li>
							<li><a href="/admin/fragments/fragments">Все фрагменты</a></li>
							<li><a href="/admin/fragments/add_fragment">Добавить фрагмент</a></li>
							<li class="divider"></li>
							<li class="dropdown-header">Категории фрагментов</li>
							<li><a href="/admin/fragments/catalogs">Все категории</a></li>
							<li><a href="/admin/fragments/add_catalog">Создать категорию</a></li>
						</ul>
					</li>
                <?php } ?>

                <?php if($is_landing == '1') { ?>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> Лендинг<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-header">Блок коллекции</li>
                            <li><a href="/admin/landing/list_collection">Коллекции</a></li>
                            <li class="divider"></li>
                            <li class="dropdown-header">Блок преимущества</li>
                            <li><a href="/admin/landing/edit_advantages">Преимущества</a></li>
                            <li class="divider"></li>
                            <li class="dropdown-header">Блок монтаж</li>
                            <li><a href="/admin/landing/edit_description">Монтаж</a></li>
                            <li class="divider"></li>
                            <li class="dropdown-header">Блок где купить</li>
                            <li><a href="/admin/landing/list_shop_city">Города</a></li>
                            <li><a href="/admin/landing/list_shop">Организации</a></li>
                        </ul>
                    </li>
                <?php } ?>

                <?php if($is_widget > 0) { ?>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="glyphicon glyphicon-th-large" aria-hidden="true"></span> Виджеты<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <?php foreach ($widget_list as $widget) : ?>
                                <li><a href="/admin/<?=$widget['name']?>"><?=$widget['title']?></a></li>
                            <?php endforeach; ?>
                        </ul>
                    </li>
                <?php } ?>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="glyphicon glyphicon-hdd" aria-hidden="true"></span> Система<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-header">Настройки</li>
                        <li><a href="/admin/settings">Конфигурация сайта</a></li>
                        <li><a href="/admin/modules">Модули</a></li>
                        <li class="divider"></li>
                        <li class="dropdown-header">Пользователи</li>
                        <li><a href="/admin/auth/users_list">Список пользователей</a></li>
                        <li><a href="/admin/auth/groups_list">Группы и права</a></li>
                        <li><a href="/admin/settings/logs">Журнал событий</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
