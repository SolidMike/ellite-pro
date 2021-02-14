 <section id="address" class="screen screen_address">
            <div class="container">
                <div class="row _fl _fl-wr">
                    <div class="title uppercase _after _fl _fl-al-cen col-xs-12" data-aos="fade-up">где и когда происходит?</div>
                    <div class="text col-lg-5 col-md-6 col-xs-12" data-aos="fade-up">
                        <div class="image">
                            <img src="<?=$category['image']?>" alt="">
                        </div>
                        <ul class="map-list _fl-in _fl-wr" id="map-list" role="tablist"></ul>
                        <div class="tab-content content">
                            <?for($i=0;$i<count($fragments);$i++):?>
                            <div role="tabpanel" class="tab-pane fade in <? if($i==0) echo 'active'; ?>" id="address-<?=$i+1?>">
                                <?=$fragments[$i]['custom_date']?>
                            </div>
                            <?endfor;?>
                        </div>
                        <button class="button modalAjax" type="button" data-toggle="modal" data-target="#modal" data-url="/forms/forms/get/consultation"><span>Получить консультацию</span></button>
                    </div>
                    <div class="map col-lg-7 col-md-6 col-xs-12" data-aos="zoom-out">
                        <div id="map"></div>
                    </div>
                    <noindex>
                        <div id="map-points" class="hidden">
                            {
                                "type": "FeatureCollection",
                                "features": [
                                <?for($i=0;$i<count($fragments);$i++):?>
                                    {"type": "Feature", "id": <?=$i?>, "geometry": {"type": "Point", "coordinates": [<?=$fragments[$i]['custom_map']?>]}, "properties": {"pointId": "address-<?=$i+1?>", "balloonContentHeader": "<?=$fragments[$i]['name']?>", "balloonContentBody": "<?=$fragments[$i]['custom_address']?>", "balloonContentFooter": ""}}<?=($i==count($fragments)-1 ? '' : ',')?>
                                <?endfor;?>
                                ]
                            }
                        </div>
                    </noindex>
                </div>
            </div>
        </section>