//==========================   Ajax модальные окна   ==========================
$('body').on('click','.modalAjax', function(){
    var urlModal = $(this).data('url'),
        classModal = $(this).data('class'),
        targetModal = $(this).data('target'),
        subjectModal = $(this).data('subject');
    $(targetModal).find('.modal-content').html('<div class="loader"><div class="progress progress-striped active"><div class="progress-bar progress-bar-info" style="width: 100%"><span class="">Загрузка...</span></div></div></div>');

    $.ajax({
        url: urlModal,
        cache: false,
        data: urlModal,
        type: "POST",
        success: function(html) {
            $(".loader").remove();
            $(targetModal).addClass(classModal);
            $(targetModal).find('.modal-content').html(html);
            $(targetModal).find('input[name="subject"]').val(subjectModal);

            removeData(classModal,targetModal);
            //Optional callback functions
            maskTel();

        },
        error: function(){
            $(targetModal).find('.modal-content').html('<div class="alert alert-danger" style="margin: 0;"><div style="text-align: center; font-size: 20px;"><span>При загрузке данных произошла ошибка!</span></div></div>');
            errorData(classModal,targetModal);
        }
    });
});

function removeData(classModal,targetModal){
    $(targetModal).on('hidden.bs.modal', function (e) {
        $(this).removeClass(classModal);
        $(targetModal).find('.modal-content').html('');
    });
}

function errorData(classModal,targetModal){
    setTimeout(function(){
        $(targetModal).modal('hide');
        removeData(classModal,targetModal);
    },2000);
}

$('#modal-policy').on('hidden.bs.modal', function () {
    if ($(".modal-backdrop").is(":visible")) {
        $('body').addClass('modal-open');
        window.setTimeout("$('body').addClass('modal-open')", 350);//на всяк случай
    }
});


//==========================   Разделитель чисел   ==========================
function prettify (num) {
    var n = num.toString();
    var separator = " ";
    return n.replace(/(\d{1,3}(?=(?:\d\d\d)+(?!\d)))/g, "$1" + separator);
}
//==========================   Скролл по якорям   ==========================
function scrollNav() {
    $('header a, #back-top a').click(function () {
        var url = $(this).attr('href');
        var type = url.split('#');
        var hash = '';
        if(type.length > 1) hash = type[1];
        var block = $("#" + hash).offset();
        var offset_top = block.top - 100;
        $('html, body').stop().animate({scrollTop: offset_top}, 400);
        if ($(".nav-bar").css('display') == 'block') {
            $('header .nav-bar').removeClass('opened').hide(300);
        } else {
            $('header .nav-bar').removeClass('opened');
        }
        $('.nav-toggle').removeClass('active');
        $('body').css('height', 'auto');
        $('body').css('overflow-x', 'hidden');
        $('body').css('overflow-y', 'visible');
        return false;
    });
}
scrollNav();
//==========================   Маска телефона   ==========================
function maskTel(){
    $("input[type$='tel']").mask("+7 (999) 999-99-99");
}
maskTel();

$(window).scroll(function () {
    if ($(this).scrollTop() > 100) {
        $('#back-top').fadeIn();
    } else {
        $('#back-top').fadeOut();
    }
});

function widthDetect() {
    if ($(window).width() <= 991) {
        var navHeight = $(window).height() - $('.header_top').height();
        $(".nav-bar").css('max-height',navHeight);
    }
    else {
    }
}
// widthDetect();

$(window).resize(function () {
    widthDetect();
});

$(window).load(function(){
    $('body').scrollspy({
        target: '#navbar',
        offset: 120
    });

    $('.nav-toggle').on('click', function(){
        $('.nav-toggle').toggleClass('active');
        if ($(".nav-bar").is(":visible")) {
            $(".nav-bar").hide(300).removeClass('opened');

            $('body').css('height','auto');
            $('body').css('overflow-x','hidden');
            $('body').css('overflow-y','visible');
        } else {
            var navHeight = $(window).height() - $('.header_top').height();
            $(".nav-bar").show(300).addClass('opened').css('max-height',navHeight);

            $('body').css('height','100vh');
            $('body').css('overflow-x','hidden');
            $('body').css('overflow-y','hidden');
        }
    });

    $(".price > b, .price > strong, .price > span").each(function(){
        var val = $(this).text();
        $(this).text(prettify(val));
    });

    // Всплывающее окно с видео
    $('.modal-video').click(function () {
        var video = $(this).data('video');
        $('#modal-video').modal('show');
        $('#modal-video .modal-content').html(
            '<button type="button" class="close" data-dismiss="modal"></button>\n' +
            '<div class="modal-body">\n' +
            '<div class="embed-responsive embed-responsive-16by9">\n' +
            '<iframe src="https://www.youtube.com/embed/' + video + '?autoplay=1&amp;rel=0&amp;showinfo=0" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>\n' +
            '</div>\n' +
            '</div>'
        );

        return false;
    });
    $('#modal-video ').on('hidden.bs.modal', function () {
        $('#modal-video .modal-content').html('');
    });

    $('.results').slick({
        infinite: true,
        fade: false,
        speed: 300,
        autoplay: false,
        autoplaySpeed: 5000,
        variableWidth: false,
        pauseOnFocus: false,
        pauseOnHover: false,
        slidesToShow: 3,
        slidesToScroll: 1,
        arrows: true,
        prevArrow: '<div class="slider__arrow_prev slider__arrow"></div>',
        nextArrow: '<div class="slider__arrow_next slider__arrow"></div>',
        dots: false,
        responsive: [
            {
                breakpoint: 992,
                settings: {
                    slidesToShow: 2
                }
            },
            {
                breakpoint: 768,
                settings: {
                    slidesToShow: 2
                }
            },
            {
                breakpoint: 480,
                settings: {
                    slidesToShow: 1
                }
            }
        ]
    });

    $('.team-image').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: true,
        prevArrow: '<div class="slider__arrow_prev slider__arrow"></div>',
        nextArrow: '<div class="slider__arrow_next slider__arrow"></div>',
        fade: true,
        asNavFor: '.team-content'
    });
    $('.team-content').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        asNavFor: '.team-image',
        arrows: false,
        prevArrow: '<div class="slider__arrow_prev slider__arrow"></div>',
        nextArrow: '<div class="slider__arrow_next slider__arrow"></div>',
        dots: false,
        adaptiveHeight: true
    });

    $(".twentytwenty-container").twentytwenty({
        default_offset_pct: 0.6, // How much of the before image is visible when the page loads
        // orientation: 'vertical', // Orientation of the before and after images ('horizontal' or 'vertical')
        before_label: 'Before', // Set a custom before label
        after_label: 'After', // Set a custom after label
        no_overlay: true, //Do not show the overlay with before and after
        move_slider_on_hover: false, // Move slider on mouse hover?
        move_with_handle_only: true, // Allow a user to swipe anywhere on the image to control slider movement.
        click_to_move: true // Allow a user to click (or tap) anywhere on the image to move the slider to that location.
    });

});

$(window).load(function(){
    AOS.init({
        offset: 100,
        delay: 0,
        duration: 1000,
        once: false,
        disable: 'mobile'
    });
});

//==========================   Шапка при скролле   ==========================
$(window).scroll(function() {
    var $menu = $(".header");
    var windowHeight = $(window).height();
    var percent = 5;
    if ($(window).scrollTop() > (windowHeight/100*percent)) {
        $menu.addClass("scroll");
    } else if ($(window).scrollTop() <= (windowHeight/100*percent)){
        $menu.removeClass("scroll");
    }
});

$(document).ready(function(){
	$('.button_massage').click(function() {
		var price = $(this).parent().find('.price').attr('data-price');
		var name = $(this).parent().siblings('.title').attr('data-name');
		setTimeout(function () {
	$('#form-massage').find('input[name=title]').val(name);
	$('#form-massage').find('input[name=price]').val(price);
}, 1000); 
	});
});

//==========================   форма в шапке   ==========================
$(document).on('click', '#send_order_call', function() {
    $('#form-call').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            name: {
                validators: {
                    notEmpty: {},
                    stringLength: {
                        min: 3,
                        max: 40
                    },
                    regexp: {
                        regexp: /^[a-zA-Zа-яА-Я0-9 _\.]+$/,
                        message: 'Имя может содержать буквы, цифры, пробел, точки и подчеркивания'
                    }
                }
            },
            tel: {
                validators: {
                    notEmpty: {},
                    stringLength: {
                        min: 6
                    }
                }
            },
        },
        /*onError: function(e) {
            alert('Ошибка');
        },*/
    }).off('success.form.bv').on('success.form.bv', function(e) {
        e.preventDefault();
        var $form = $(e.target);
        var bv = $form.data('formValidation');
        $.post($form.attr('action'), $form.serialize(), function(html) {
            $('#form-call').prepend(html);
        }, 'html');
        window.location.replace("http://ellite-pro.com/page/spasibo");
    })
});
//==========================   форма "получить консультацию"   ==========================
$(document).on('click', '#send_order_consultation', function() {
    $('#form-consultation').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            name: {
                validators: {
                    notEmpty: {},
                    stringLength: {
                        min: 3,
                        max: 40
                    },
                    regexp: {
                        regexp: /^[a-zA-Zа-яА-Я0-9 _\.]+$/,
                        message: 'Имя может содержать буквы, цифры, пробел, точки и подчеркивания'
                    }
                }
            },
            tel: {
                validators: {
                    notEmpty: {},
                    stringLength: {
                        min: 6
                    }
                }
            },
        },
        /*onError: function(e) {
            alert('Ошибка');
        },*/
    }).off('success.form.bv').on('success.form.bv', function(e) {
        e.preventDefault();
        var $form = $(e.target);
        var bv = $form.data('formValidation');
        $.post($form.attr('action'), $form.serialize(), function(html) {
            $('#form-consultation').prepend(html);
        }, 'html');
        window.location.replace("http://ellite-pro.com/page/spasibo");
    })
});

//==========================   форма "хочу также"   ==========================
$(document).on('click', '#send_order_same', function() {
    $('#form-same').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            name: {
                validators: {
                    notEmpty: {},
                    stringLength: {
                        min: 3,
                        max: 40
                    },
                    regexp: {
                        regexp: /^[a-zA-Zа-яА-Я0-9 _\.]+$/,
                        message: 'Имя может содержать буквы, цифры, пробел, точки и подчеркивания'
                    }
                }
            },
            tel: {
                validators: {
                    notEmpty: {},
                    stringLength: {
                        min: 6
                    }
                }
            },
        },
        /*onError: function(e) {
            alert('Ошибка');
        },*/
    }).off('success.form.bv').on('success.form.bv', function(e) {
        e.preventDefault();
        var $form = $(e.target);
        var bv = $form.data('formValidation');
        $.post($form.attr('action'), $form.serialize(), function(html) {
            $('#form-same').prepend(html);
        }, 'html');
        window.location.replace("http://ellite-pro.com/page/spasibo");
    })
});

//==========================   форма аказать массаж   ==========================
$(document).on('click', '#send_order_massage', function() {
    $('#form-massage').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            name: {
                validators: {
                    notEmpty: {},
                    stringLength: {
                        min: 3,
                        max: 40
                    },
                    regexp: {
                        regexp: /^[a-zA-Zа-яА-Я0-9 _\.]+$/,
                        message: 'Имя может содержать буквы, цифры, пробел, точки и подчеркивания'
                    }
                }
            },
            tel: {
                validators: {
                    notEmpty: {},
                    stringLength: {
                        min: 6
                    }
                }
            },
        },
        /*onError: function(e) {
            alert('Ошибка');
        },*/
    }).off('success.form.bv').on('success.form.bv', function(e) {
        e.preventDefault();
        var $form = $(e.target);
        var bv = $form.data('formValidation');
        $.post($form.attr('action'), $form.serialize(), function(html) { 
            $('#form-massage').prepend(html);
        }, 'html');
        window.location.replace("http://ellite-pro.com/page/spasibo");
    })
});

/*$('.point').on('click', function() {
      $('html, body').animate({
      scrollTop: $('.tab-pane__content').offset().top - 100
  }, 2000);
      return false;
});
*/
$( document ).ready(function() {
    var win = $(this);
        if (win.width() <= 768) { 
        $('a[data-toggle="tab"]').not('#male_button').not('#female_button').on('shown.bs.tab', function (e) {
          $('html, body').animate({
              scrollTop: $($(this).attr("href")).offset().top - 100
          }, 2000);
              return false;
        });
    }
});