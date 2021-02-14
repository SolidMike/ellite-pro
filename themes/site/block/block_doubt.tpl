  <section class="screen screen_pluses">
            <div class="container">
                <img src="themes/site/images/pluses-girl.png" alt="" class="image">
                <div class="row dots">
                    <div class="results__item col-lg-5 col-md-5 col-md-offset-0 col-sm-6 col-sm-offset-3 col-xs-12" data-aos="zoom-out-right">
                        <div class="results__item-wrapper _fl _fl-wr">
                            <div class="results__item-compare twentytwenty-container">
                                <img src="<?=$fragments['0']['custom_before']?>" alt="">
                                <img src="<?=$fragments['0']['custom_after']?>" alt="">
                            </div>
                            <div class="results__item-text _fl">
                                <span>До</span>
                                <span>После</span>
                            </div>
                        </div>
                    </div>
                    <div class="text col-lg-5 col-md-5 col-xs-12" data-aos="fade-up">
                        <div class="title title_invert uppercase _after _fl _fl-al-cen"><?=$category['name']?></div>
                        <div class="content">
                            <h5 style="text-transform: uppercase;"><?=$fragments['0']['name']?></h5>
                            <p>&nbsp;</p>
                            <?=$fragments['0']['custom_description']?>
                        </div>
                        <button class="button modalAjax" type="button" data-toggle="modal" data-target="#modal" data-url="/forms/forms/get/consultation"><span>Получить консультацию</span></button>
                    </div>
                </div>
            </div>
        </section>