<section class="page-gallery">
    <div class="page-gallery-content">
        <?=Modules::run('breadcrumbs/get_breadcrumbs')?>
        <h1 class="text-header uppercase"><?=("$meta_h1" != '') ? "$meta_h1" : "$name"?></h1>
        <div class="gallery-container">
            <?php foreach ($images as $image): ?>
                <div class="grid">
                    <div class="img-block">
                        <a data-fancybox="gallery" href="<?=$image["image_url"]?>"><img src="<?=$image["image_thumb_url"]?>" alt="<?=$image['image_title']?>" title="<?=$image['image_title']?>">
                            <div class="overlay-hover"><img src="/themes/site/images/zoom.png" alt=""></div>
                        </a>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>

        <?=$links?>


        <?php if($content != '') { ?>
            <div class="content-text">
                <?=$content?>
            </div>
        <?php } ?>
    </div>
</section>