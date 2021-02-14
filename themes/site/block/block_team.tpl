 <section id="team" class="screen screen_team">
            <div class="container dots">
                <div class="row">
                    <div class="text col-md-8 col-md-offset-4 col-xs-12">
                        <div class="title uppercase _after" data-aos="fade-up"><?=$category['content_1']?></div>
                        <div class="team-image" data-aos="fade-right">
                            <?php foreach($fragments as $row) {?>
                            <div class="image">
                                <img src="<?=$row['custom_photo']?>" alt="">
                            </div>
                            <? } ?>
                        </div>
                        <div class="team-content" data-aos="fade-left">
                            <?php foreach($fragments as $row) {?>
                            <div class="content">
                                 <p>Ручную липопластику проводит <span class="title title_m" style="color: #2b3e83"><?=$row['name']?></span></p>
                                <p>&nbsp;</p>
                                <?=$row['custom_description']?>
                            </div>
                        <? } ?>
                       </div>

                    </div>
                </div>
            </div>
        </section>