<div class="owl-carousel owl-theme">
    <?php foreach ($images as $image): ?>
		<div class="item">
			<a href="<?=$image["image_url"]?>" class="gal-item" data-fancybox-group="gallery1">
				<img src="<?=$image["image_thumb_url"]?>" alt="<?=$image['image_title']?>" title="<?=$image['image_title']?>">
			</a>
		</div>
	<?php endforeach; ?>
</div>