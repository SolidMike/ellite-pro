<section class="page-contacts">
    <div class="page-contacts-content">
        <?=Modules::run('breadcrumbs/get_breadcrumbs')?>
        <h1 class="text-header uppercase"><?=("$meta_h1" != '') ? "$meta_h1" : "$name"?></h1>

        <div class="grid-container">
            <div class="grid">
                <div class="grid-left">
                    <img src="/themes/site/images/location-contacts.png">
                </div>
                <div class="grid-right">
                    <div class="text1">Адрес</div>
                    <div class="text2">{adress}</div>
                </div>
            </div>
            <div class="grid">
                <div class="grid-left">
                    <img src="/themes/site/images/phone-contacts.png">
                </div>
                <div class="grid-right">
                    <div class="text1">Телефон</div>
                    <div class="text2">{tel}</div>
                </div>
            </div>
            <div class="grid">
                <div class="grid-left">
                    <img src="/themes/site/images/mail-contacts.png">
                </div>
                <div class="grid-right">
                    <div class="text1">E-mail</div>
                    <div class="text2">{email}</div>
                </div>
            </div>
            <div class="grid">
                <div class="grid-left">
                    <img src="/themes/site/images/calendar-contacts.png">
                </div>
                <div class="grid-right">
                    <div class="text1">График работы</div>
                    <div class="text2">{time_work_contact}</div>
                </div>
            </div>
        </div>

        <div id="map"></div>

        <?php if($content != '') { ?>
            <div class="content-text">
                <?=$content?>
            </div>
        <?php } ?>
    </div>
</section>