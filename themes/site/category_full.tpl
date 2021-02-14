<section id="speedbar">
	<div class="content">
		<?=Modules::run('breadcrumbs/get_breadcrumbs')?>
		<div class="clear"></div>
	</div>
</section>
<section id="articles">
	<h1 class="text1"><?=("$meta_h1" != '') ? "$meta_h1" : "$name"?></h1>
	<a href="/" class="global-button" style="float: none;margin: 0 auto; max-width: 80px;">Вернуться</a>
	<?php if(empty($pages)): ?>
		<div class="content">В категории нет страниц</div>
	<?php else: ?>
		<div class="content">
			<?php foreach ($pages as $page): ?>
				<div class="itemStat">
					<img src="<?=$page['image']?>" alt="<?=$page['name']?>" title="<?=$page['name']?>">
					<div class="text2"><a href="/page/<?=$page['meta_url']?>" class="linc_title"><?=$page['name']?></a></div>
					<div class="text3"><?=$page['short_content']?></div>
					<a href="/page/<?=$page['meta_url']?>" class="end">Подробнее ></a>
					<div class="date"><?=date("d.m.Y", strtotime($page['created']))?></div>
				</div>
			<?php endforeach; ?>
			<div class="clear"></div>
			<?=$links?>
		</div>
	<?php endif; ?>
	<div class="content">
		<?=$content?>
	</div>
</section>