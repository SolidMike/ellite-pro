<?php if(!empty($comments)) : ?>
	<div class="content">
		<div class="hblock animated slideInDown wow">
		   <div class="h2"><span class="font-size">Отзывы </span><br><b>о нашей работе</b></div>
		   <img class="screen-icon" src="/themes/site/images/screen12-icon.png" alt="" title=""> 
		</div>
		<div class="owl-carousel owl-theme screen12-carousel">
			<?php foreach($comments as $comment) : ?>
			   <div class="item">
				  <div class="item-content">
					 <img src="<?=$comment['image']?>" alt="<?=$comment['name']?>" title="">
					 <div class="text-otxiv">
						<div class="h3"><?=$comment['name']?></div>
						<span class="organization"><?=$comment['organization']?></span>
						<?=$comment['message']?>
						<span class="date"><?=date('Y.m.d', strtotime($comment['created']))?></span>
					 </div>
				  </div>
			   </div>
		   <?php endforeach; ?>
		</div>
	</div>
	<div class="clearfix"></div>
<?php endif; ?>