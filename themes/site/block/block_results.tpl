        <section id="results" class="screen screen_results">
            <div class="container">
                <div class="row">
                	<div class="title uppercase _after _fl _fl-al-cen" data-aos="fade-up"><?=$category['name']?></div>
                    <div class="results" data-aos="zoom-out-up">
                	<? foreach ($fragments as $row) {?>
                        <div class="results__item">
                            <div class="results__item-wrapper _fl _fl-wr">
                                <div class="results__item-image">
                                    <img src="<?=$row['custom_results_before']?>" alt="">
                                </div>
                                <div class="results__item-image">
                                    <img src="<?=$row['custom_results_after']?>" alt="">
                                </div>
                                <div class="results__item-text _fl">
                                    <span>До</span>
                                    <span>После</span>
                                </div>
                            </div>
                        </div>
                        <?}?>
                </div>
                <button class="button modalAjax" type="button" data-toggle="modal" data-target="#modal" data-aos="fade-up" data-url="/forms/forms/get/same"><span>Хочу также</span></button>
            </div>
          </div>
        </section>