 <section id="faq" class="screen screen_faq">
            <div class="container dots">
                <div class="row">
                    <div class="title uppercase _after _fl _fl-al-cen _fl-just-cen col-xs-12" data-aos="fade-up">FAQ</div>
                    <div class="panel-group col-xs-12" id="accordion-1" role="tablist" aria-multiselectable="true" data-aos="zoom-out-up">
                        <?php $i=0; foreach($fragments as $row) : $i++;?>
                        <div class="panel">
                            <div class="panel-heading" role="tab" id="heading-1-<?=$i?>">
                                <a role="button" data-toggle="collapse" data-parent="#accordion-<?=$i?>" href="#collapse-1-<?=$i?>"
                                   aria-expanded="<?=($i == 1 ? 'true' : 'false')?>" aria-controls="collapse-1-<?=$i?>">
                                    <?=$row['name']?>
                                </a>
                            </div>
                            <div id="collapse-1-<?=$i?>" class="panel-collapse collapse <?=($i == 1 ? 'in' : '')?>" role="tabpanel" aria-labelledby="heading-1-<?=$i?>">
                                <div class="panel-body content">
                                    <?=$row['custom_answer']?>
                                </div>
                            </div>
                        </div>
                       <?php endforeach;?>
                    </div>
                </div>
            </div>
        </section>