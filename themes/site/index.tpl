<!DOCTYPE html>
<html>
<head lang="ru">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Ellite</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <link rel="stylesheet" type="text/css" href="/themes/site/css/libs.min.css">
    <link rel="stylesheet" type="text/css" href="/themes/site/css/bootstrap-custom.css">
    <link rel="stylesheet" type="text/css" href="/themes/site/css/style.css">
    <link rel="stylesheet" type="text/css" href="/themes/site/css/bootstrapValidator.min.css">
</head>
<body>
    <div class="wrapper">
        <header class="header">
            <div class="container">
                <div class="row _fl _fl-wr _fl-just-bet _fl-al-cen">
                    <a href="/" class="logo">
                        <img class="logo_w" src="/themes/site/images/logo-w.png" alt="">
                        <img class="logo_b" src="/themes/site/images/logo-b.png" alt="">
                    </a>
                    <nav id="navbar" class="nav-bar">
               <?=Modules::run('menu/get_simple_menu', 'main_menu', '', 'uppercase')?>
                        <div class="header-contact visible-550 _fl _fl-col">
                            <div class="header-phone col-lg-6 col-md-5">
                                <a href="tel:89034011882">{tel}</a>
                            </div>
                            <div class="header-button col-lg-6 col-md-7">
                                <button type="button" class="button modalAjax" data-toggle="modal" data-target="#modal" data-url="/forms/forms/get/order_call"><span>Обратный звонок</span></button>
                            </div>
                        </div>
                    </nav>
                    <div class="header-contact col-md-4">
                        <div class="row _fl _fl-wr _fl-al-cen">
                            <div class="header-phone col-lg-6 col-md-5">
                                <a href="tel:89034011882">{tel}</a>
                            </div>
                            <div class="header-button col-lg-6 col-md-7">
                                <button type="button" class="button modalAjax" data-toggle="modal" data-target="#modal" data-url="/forms/forms/get/order_call"><span>Обратный звонок</span></button>
                            </div>
                        </div>
                    </div>
                    <button type="button" class="nav-toggle">
                        <span class="_top"></span>
                        <span class="_mid"></span>
                        <span class="_bot"></span>
                    </button>
                </div>
            </div>
        </header>

{content}

        <section id="contacts" class="screen screen_contact">
            <div class="container">
                <div class="row _fl _fl-wr">
                    <div class="gradient col-lg-5 col-sm-6 col-xs-12">
                        <div class="gradient_bg">
                            <img class="image" src="/themes/site/images/bg/bg-gradient.jpg" alt="">
                        </div>
                        <div class="title title_invert uppercase _after _fl _fl-al-cen" data-aos="fade-up">сомневаетесь?</div>
                        <div class="contact-list" data-aos="fade-up">
                            <div class="contact-list__item">
                                <div class="contact-list__label _fl _fl-al-cen">
                                    <div class="contact-list__icon">
                                        <img src="/themes/site/images/icon-phone.png" alt="">
                                    </div>
                                    Телефон:
                                </div>
                                <div class="contact-list__text">
                                    <a href="tel:8 (903) 401-18-82">{tel}</a>
                                </div>
                            </div>
                            <div class="contact-list__item">
                                <div class="contact-list__label _fl _fl-al-cen">
                                    <div class="contact-list__icon">
                                        <img src="/themes/site/images/icon-address.png" alt="">
                                    </div>
                                    Адрес:
                                </div>
                                <div class="contact-list__text">
                                    {adress}
                                </div>
                            </div>
                            <div class="contact-list__item">
                                <div class="contact-list__label _fl _fl-al-cen">
                                    <div class="contact-list__icon">
                                        <img src="/themes/site/images/icon-email.png" alt="">
                                    </div>
                                    E-mail:
                                </div>
                                <div class="contact-list__text">
                                    <a href="mailto:Prestige_beauty7@mail.ru">{email}</a>
                                </div>
                            </div>
                            <div class="contact-list__item">
                                <div class="contact-list__label _fl _fl-al-cen">
                                    <div class="contact-list__icon">
                                        <img src="/themes/site/images/icon-schedulle.png" alt="">
                                    </div>
                                    Часы работы:
                                </div>
                                <div class="contact-list__text">
                                    {time_work_contact}
                                </div>
                            </div>
                            <div class="contact-list__item">
                                <div class="contact-list__label _fl _fl-al-cen">
                                    <div class="contact-list__icon">
                                        <img src="/themes/site/images/icon-instagram.png" alt="">
                                    </div>
                                    Мы в Instagram:
                                </div>
                                <div class="contact-list__text">
                                    <a href="https://www.instagram.com/zaharov_as" target="_blank" rel="nofollow noopener">
                                        @zaharov_as
                                    </a>
                                    <a href="https://www.instagram.com/mihailov_a.a_" target="_blank" rel="nofollow noopener">
                                        @mihailov_a.a_
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="contact-map col-lg-7 col-sm-6 col-xs-12">
                        <div id="contact-map"></div>
                    </div>
                </div>
            </div>
        </section>

    </div>

    <div id="back-top">
        <a href="#main">
            
            <!-- Generator: Adobe Illustrator 19.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
            <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                 viewBox="0 0 256 256" style="enable-background:new 0 0 256 256;" xml:space="preserve">
        <g>
            <g>
                <polygon points="128,48.907 0,176.907 30.187,207.093 128,109.28 225.813,207.093 256,176.907         "/>
            </g>
        </g>
        </svg>
        </a>
    </div>

    <div id="modal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
            </div>
        </div>
    </div>

    <div id="modal-policy" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
            </div>
        </div>
    </div>

    <div id="modal-video" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content"></div>
        </div>
    </div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://api-maps.yandex.ru/2.1/?lang=ru_RU&amp;coordorder=latlong"></script>
        <script src="/themes/site/js/libs.min.js"></script>
        <script src="/themes/site/js/bootstrap-custom.min.js"></script>
        <script src="/themes/site/js/common.js"></script>
        <script src="/themes/site/js/ya-map.js"></script>
        <script src="/themes/site/js/bootstrapvalidator.js"></script>
         <!-- Yandex.Metrika counter -->
<script type="text/javascript" >
   (function(m,e,t,r,i,k,a){m[i]=m[i]||function(){(m[i].a=m[i].a||[]).push(arguments)};
   m[i].l=1*new Date();k=e.createElement(t),a=e.getElementsByTagName(t)[0],k.async=1,k.src=r,a.parentNode.insertBefore(k,a)})
   (window, document, "script", "https://mc.yandex.ru/metrika/tag.js", "ym");

   ym(56797552, "init", {
        clickmap:true,
        trackLinks:true,
        accurateTrackBounce:true,
        webvisor:true
   });
</script>
<noscript><div><img src="https://mc.yandex.ru/watch/56797552" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->
<!-- Facebook Pixel Code -->
<script>
  !function(f,b,e,v,n,t,s)
  {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
  n.callMethod.apply(n,arguments):n.queue.push(arguments)};
  if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
  n.queue=[];t=b.createElement(e);t.async=!0;
  t.src=v;s=b.getElementsByTagName(e)[0];
  s.parentNode.insertBefore(t,s)}(window, document,'script',
  'https://connect.facebook.net/en_US/fbevents.js');
  fbq('init', '775490552968198');
  fbq('track', 'PageView');
</script>
<noscript><img height="1" width="1" style="display:none"
  src="https://www.facebook.com/tr?id=775490552968198&ev=PageView&noscript=1"
/></noscript>
<!-- End Facebook Pixel Code -->

</body>
</html>