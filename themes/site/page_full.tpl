
<section class="page-about">
    <div class="page-about-content" style="margin-top: 8em;">
		<?=Modules::run('breadcrumbs/get_breadcrumbs')?>
        <h1 class="text-header uppercase" style="text-align: center;"><?=("$meta_h1" != '') ? "$meta_h1" : "$name"?></h1>
        <?php /*=date("d.m.Y", strtotime($created))*/ ?>
        <?php if ($content != '') : ?>
            <div class="content-text" style="text-align: center; font-size: 2em;">
                <?=$content?>
                <button style="max-width: 190px;" class="button"><a style="color:#fff;border-radius: 25px;width: 100%;" href="/"><span>Вернуться на Главную</span></a></button>
            </div>
        <?php endif; ?>

        <?php echo Modules::run('block/get_block', 'block_our_employees'); ?>

    </div>
</section>