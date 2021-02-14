<section id="price" class="screen screen_price">
            <div class="container">
                <div class="row">
                    <div class="title uppercase _after _fl _fl-al-cen" data-aos="fade-up">сколько стоит процедура?</div>
                    <div class="col-lg-4 col-md-5 col-xs-12" data-aos="zoom-out-up">
                        <ul class="tab-list" role="tablist">
                            <li role="presentation" class="active"><a href="#female" aria-controls="female" role="tab" data-toggle="tab" id="female_button">Женщина</a></li>
                            <li role="presentation"><a href="#male" aria-controls="male" role="tab" data-toggle="tab" id="male_button">Мужчина</a></li>
                        </ul>
                    </div>
                    <div class="clearfix"></div>
                    <div class="tab-content" data-aos="zoom-out-up">
                        <div role="tabpanel" class="tab-pane active fade in" id="female">
                            <div class="tab-point col-lg-4 col-md-5 col-sm-7">
                                <img src="/themes/site/images/female.png" alt="">
                                <ul class="point-list" role="tablist">

                                    <?php 
                                    $current = 0;
                                    for($i=0;$i<count($fragments);$i++): 
                                        if ($fragments[$i]['custom_gender'] === "Мужчина") {
                                            continue;
                                        }else {
                                            $current++;
                                        }
                                        ?>
                                        <li role="presentation" class="<? if($current==1) echo 'active'; ?>"><a href="#female-<?=$current?>" aria-controls="female-<?=$current?>" role="tab" data-toggle="tab"><span class="point"></span><span><?=$fragments[$i]['name']?></span></a></li>
                                    <?php endfor; ?>

                                </ul>
                            </div>
                            <div class="tab-wrapper col-lg-8 col-md-7 col-xs-12 dots">
                                <div class="tab-content">

                                    <?php 
                                    $current = 0;
                                    for($i=0;$i<count($fragments);$i++): 
                                            if ($fragments[$i]['custom_gender'] === "Мужчина") {
                                                continue;
                                            }else {
                                                $current++;
                                            }?>

                                            <div role="tabpanel" class="tab-pane <? if($current==1) echo 'active'; ?> fade in" id="female-<?=$current?>">
                                            <div class="tab-pane__content _fl _fl-wr">
                                                <div data-name="<?=$fragments[$i]['name']?>" class="title title_s uppercase"><?=$fragments[$i]['name']?></div>
                                                <div class="results__item">
                                                    <div class="results__item-wrapper _fl _fl-wr">
                                                        <div class="results__item-image">
                                                            <img src="<?=$fragments[$i]['custom_image_before']?>" alt="">
                                                        </div>
                                                        <div class="results__item-image">
                                                            <img src="<?=$fragments[$i]['custom_image_after']?>" alt="">
                                                        </div>
                                                        <div class="results__item-text _fl">
                                                            <span>До</span>
                                                            <span>После</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="text">
                                                    <div class="content">
                                                        <?=$fragments[$i]['custom_description']?>
                                                    </div>
                                                    <div class="price-wrapper">
                                                        Цена - <span data-price="<?=$fragments[$i]['custom_price']?>" class="price"><b><?=$fragments[$i]['custom_price']?></b>руб.</span>
                                                    </div>
                                                    <button class="button modalAjax button_massage" type="button" data-toggle="modal" data-target="#modal" data-url="/forms/forms/get/order_massage"><span>Заказать</span></button>
                                                </div>
                                            </div>
                                        </div>
                                    <?php endfor; ?>

                                </div>
                            </div>
                        </div>
                         <div role="tabpanel" class="tab-pane fade" id="male">
                           <div class="tab-point col-lg-4 col-md-5 col-sm-7">
                                <img src="/themes/site/images/male.png" alt="">
                                <ul class="point-list" role="tablist">
                                     <?php 
                                     $current = 0;
                                     for($i=0;$i<count($fragments);$i++): 

                                        if ($fragments[$i]['custom_gender'] === "Женщина") {
                                                continue;
                                            }else {	
                                                $current++;
                                            }

                                        ?>
                                    <li role="presentation" class="<? if($current==1) echo 'active'; ?>"><a href="#male-<?=$current?>" aria-controls="male-<?=$current?>" role="tab" data-toggle="tab"><span class="point"></span><span><?=$fragments[$i]['name']?></span></a></li>
                                     <?php endfor; ?>
                                </ul>
                            </div>
                          <div class="tab-wrapper col-lg-8 col-md-7 col-xs-12 dots">
                              <div class="tab-content">
                                 <?php 
                                $current = 0;
                                 for($i=0;$i<count($fragments);$i++): 
                                    if ($fragments[$i]['custom_gender'] === "Женщина") {
                                                continue;
                                            }else {
                                                $current++;
                                            }?>
                                 <div role="tabpanel" class="tab-pane <? if($current==1) echo 'active'; ?> fade in" id="male-<?=$current?>">
                                        <div class="tab-pane__content _fl _fl-wr">
                                            <div data-name="<?=$fragments[$i]['name']?>" class="title title_s uppercase"><?=$fragments[$i]['name']?></div>
                                            <div class="results__item">
                                                <div class="results__item-wrapper _fl _fl-wr">
                                                    <div class="results__item-image">
                                                        <img src="<?=$fragments[$i]['custom_image_before']?>" alt="">
                                                    </div>
                                                    <div class="results__item-image">
                                                        <img src="<?=$fragments[$i]['custom_image_after']?>" alt="">
                                                    </div>
                                                    <div class="results__item-text _fl">
                                                        <span>До</span>
                                                        <span>После</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="text">
                                                <div class="content">
                                                  <?=$fragments[$i]['custom_description']?>
                                                </div>
                                                <div class="price-wrapper">
                                                    Цена - <span data-price="<?=$fragments[$i]['custom_price']?>" class="price" ><b><?=$fragments[$i]['custom_price']?></b>руб.</span>
                                                </div>
                                                <button class="button modalAjax button_massage" type="button" data-toggle="modal" data-target="#modal" data-url="/forms/forms/get/order_massage"><span>Заказать</span></button>
                                            </div>
                                        </div>
                                    </div>
                                    <?php endfor; ?>
                              </div>
                          </div>
                      </div> 
                    </div>
                </div>
            </div>
        </section>