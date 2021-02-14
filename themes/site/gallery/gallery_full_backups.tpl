<div class="section">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="header_h1">
                    <h1><?=("$meta_h1" != '') ? "$meta_h1" : "$name"?></h1>
                </div>
            </div>
        </div>
        <div class="row">
        <?php foreach ($categories as $key => $category): ?>
            <div class="col-sm-4 text-center">
                <a href="/gallery/<?=$category['meta_url']?>"><img class="img-thumb" src="<?=$category['image']?>"></a>
                <h2 class="height-fixed"><a href="/gallery/<?=$category['meta_url']?>"><?=$category['name']?></a></h2>
            </div>
        <?php endforeach; ?>
        </div>
        <br>
        <?php if(!empty($images)) { ?>
            <div class="row gallery">
            <?php foreach ($images as $image): ?>
                <div class="col-md-4 col-sm-6 col-xs-12 gallery-image">
                    <div class="icon"><i class="fa fa-search-plus"></i></div>
                    <a href="<?=$image['image_url']?>" data-lightbox="gallery" data-title='<?=$image['image_title']?>'><img class="img-thumbnail" src="<?=$image['image_url']?>"></a>
                    <p><?=$image['image_title']?></p>
                </div>
            <?php endforeach; ?>
            </div>
        <?php } ?>
        <?php if(count($images) <= 3) { echo "<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>";} ?>
        <div class="row">
            <div class="col-sm-12 text-center">
                <?=$links?>
            </div>
        </div>

        <?php if($content != '') { ?>
            <div class="row">
                <div class="col-sm-12">
                    <?=$content?>
                </div>
            </div>
        <?php } ?>

    </div>
</div>


