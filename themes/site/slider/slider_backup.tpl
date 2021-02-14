<div id="main-slider" class="carousel slide hidden-xs" data-ride="carousel" data-interval="4500">
    <ol class="carousel-indicators">
        <?php if(isset($sliders)) foreach ($sliders as $key => $slider):?>
        <li data-target="#main-slider" data-slide-to="<?=$key?>" class="<?=($key==0) ? 'active' : ''?>"></li>
        <?php endforeach; ?>
    </ol>

    <div class="carousel-inner" role="listbox">
        <?php if(isset($sliders)) foreach ($sliders as $key => $slider):?>
            <div class="item <?=($key==0) ? 'active' : ''?>">
                <img src="<?=($slider["picture"] != '') ? $slider["picture"] : ''?>" alt="<?=$slider["name"]?>">
                <div class="carousel-caption hidden">
                    <div class="row">
                        <div class="col-xs-12">
                            <p class="carousel_header"><?=$slider["name"]?></p>
                            <?=($slider["text"] != '') ? '<div class="slider-text">'.$slider['text'].'</div>' : ''?>
                            <?php if ($slider["url"] != ""){ ?>
                                <a href="<?=($slider["url"] != '') ? $slider["url"] : '/'?>" class="btn btn-green carousel_button"><?=($slider["button_name"] != '') ? $slider["button_name"] : 'Подробнее'?></a>
                            <?php } ?>
                        </div>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>

    <a class="carousel_control left" href="#main-slider" data-slide="prev">
    </a>
    <a class="carousel_control right" href="#main-slider" data-slide="next">
    </a>
</div>
