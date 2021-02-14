<section id="main" class="screen screen_main">
            <img src="themes/site/images/scroll-down.png" class="scroll-down" alt="">
            <div class="container">
                <div class="row _fl _fl-wr">
                    <div class="gradient col-sm-5 col-xs-12">
                        <div class="gradient_bg">
                            <img class="image" src="themes/site/images/bg/bg-gradient.jpg" alt="">
                            <img class="text" src="themes/site/images/bg/back-logo.png" alt="">
                        </div>
                        <h1 class="title title_xl title_invert uppercase" data-aos="fade-up"><?=$category['content_1']?></h1>
                        <div class="button-wrapper _fl-in _fl-wr _fl-al-cen" data-aos="fade-up">
                            <button class="button modal-video" type="button" data-toggle="modal" data-target="#modal-video" data-video="<?=$category['content_2']?>"><span>смотреть видео</span></button>
                            <div class="play modal-video _fl _fl-al-cen" data-toggle="modal" data-target="#modal-video" data-video="<?=$category['content_2']?>">
                                <img src="themes/site/images/icon-play.png" alt="">
                                <span><?=$category['content_3']?></span>
                            </div>
                        </div>
                    </div>
                    <ul class="utp col-lg-5 col-md-6 col-sm-7 col-xs-12" data-aos="zoom-out">
                         <? foreach ($fragments as $row) {?>
                        <li class="utp__item _fl _fl-al-cen">
                            <div class="utp__item-text"><?=$row['name']?></div>
                            <div class="utp__item-image">
                                <img src="<?=$row['custom_icon']?>" alt="">
                            </div>
                        </li>
                        <? } ?>
                     </ul>
                </div>
            </div>
        </section>