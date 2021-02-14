/**
 * @copyright 2015 MSCMS
 * @author http://polyakov.co.ua <zhenya_polyakov@mail.ru>
 * @cms http://mscms.com.ua <dev@mscms.com.ua>
 */
$(document).ready(function() {
});


// ========================================================================= custom fields

if($('*').is('#inputCustomFieldsJson')) {
    var customFieldsArray = new Array();

    var loadCustomFieldsJson = $("#inputCustomFieldsJson").val();

    if (loadCustomFieldsJson != "") {
        customFieldsArray = JSON.parse(loadCustomFieldsJson);
        updateCustomFieldsTable();
    }

}

$(document).ready(function() {

    $("#add-custom-field").click(function() {

        var name = $("#custom-field-name").val();
        var key = $("#custom-field-systemKey").val();
        var type = $("#custom-field-type").val();

        var dublikate = false;
        customFieldsArray.forEach(function(item, i, arr) {
            if (item[1] == key) {
                alert("Системный ключ не может повторяться, придумайте уникальный ключ!");
                dublikate = true;
            }
        });

        if (dublikate == true) {
            return false;
        }

        if (name == "" || key == "" || type == "") { alert("Заполните все поля!"); return false; }

        var customField = new Array();
        customField[0] = name;
        customField[1] = key;
        customField[2] = type;

        customFieldsArray.push(customField);

        updateCustomFieldsTable();

        $("#custom-field-name").val("");
        $("#custom-field-systemKey").val("");

        return false;
    });

});

function deleteCustomField(key) {
    customFieldsArray.forEach(function(item, i, arr) {
        if (item[1] == key) {
            customFieldsArray.splice(i, 1);
        }
    });

    updateCustomFieldsTable();

    return false;
}

function updateCustomFieldsTable() {
    $("#table-custom-fields tbody").empty();

    customFieldsArray.forEach(function(item, i, arr) {
        $("#table-custom-fields tbody").append('<tr><th scope="row">'+item[1]+'</th> <td>'+item[0]+'</td> <td>'+item[2]+'</td> <td><button type="button" onclick="deleteCustomField(\''+item[1]+'\')" class="btn btn-danger deleteCustomField">Удалить</button></td> </tr>');
    });

    updateCustomFieldsJson();
}

function updateCustomFieldsJson() {
    var json = JSON.stringify(customFieldsArray);

    if(json == "[]") json = "";

    $("#inputCustomFieldsJson").val(json);
}


// ========================================================================= menu active
$(function () {
    $('#hmenu a').each(function () {
        var location = window.location.href;
        var link = this.href;
        if(location == link) {
            $(this).parent('li').addClass('active');
            $(this).parent('li').parent('ul').parent('li:not(.module)').addClass('active');
        }
    });
});

//===================================================== search form
$(document).ready(function() {
    $('.page-header .search-form .form-control').on('click', function () {
        $(this).addClass("open");
        $(this).find('.form-control').focus();

        $('.page-header .search-form .form-control').on('blur', function () {
            $(this).removeClass("open");
            $(this).unbind("blur");
        });
    });
    // handle header search button click
    $('#search-submit').on('click', function () {
        $(this).closest('.search-form').submit();
    });
});
// ===================================== fixedMenu
$(window).scroll(function(){
    if($(window).scrollTop() >= 50) {
        $(".navbar-fixed-top.second").addClass('fixed');
    } else {
        $(".navbar-fixed-top.second").removeClass('fixed');
    }
});

//======================================== InitTextEditor
$(function() {
    $('textarea.texteditor').tinymce({
        // Location of TinyMCE script
        script_url : '/plugins/tinymce/tinymce.min.js',
        // General options
        theme : "modern",
        language : "ru",


        height: 500,
        plugins: [
            'advlist autolink lists link image charmap print preview hr anchor pagebreak',
            'searchreplace wordcount visualblocks visualchars code fullscreen',
            'insertdatetime media nonbreaking save table contextmenu directionality',
            'emoticons template paste textcolor colorpicker textpattern imagetools codesample toc'
        ],
        toolbar1: ' copy paste | undo redo | insert |  bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent |  visualblocks | code ',
        toolbar2: ' styleselect | link image | forecolor backcolor emoticons | print preview | table fontsizeselect | fontselect',
        image_advtab: true,
        templates: [
            { title: 'Test template 1', content: 'Test 1' },
            { title: 'Test template 2', content: 'Test 2' }
        ],
        /*content_css: [
            '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
            '//www.tinymce.com/css/codepen.min.css'
        ],*/

		fontsize_formats : "8px 9px 10px 11px 12px 13px 14px 15px 16px 17px 18px 19px 20px 21px 22px 24px 26px 32px 36px 40px",


        extended_valid_elements: "span[*]",
		
		gecko_spellcheck:true,
        /*plugins : ["advlist autolink lists link image charmap print preview hr anchor pagebreak",
            "searchreplace wordcount visualblocks visualchars code fullscreen",
            "insertdatetime media nonbreaking save table contextmenu directionality",
            "emoticons template paste textcolor jbimages"],*/
        pagebreak_separator: "<!-- more -->",
        menubar : false,
        /*toolbar1: "copy paste | undo redo | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent ",
        toolbar2: "pagebreak | link image media | styleselect | forecolor backcolor | print preview | table |  visualblocks | code ",*/
        theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",

        file_browser_callback: function(field_name, url, type, win) {
            if (typeof path == 'undefined')
                path = '';
            $('<div/>').dialogelfinder({
                url: '/admin/elfinder_init',
                lang: 'ru',
                uiOptions: {
                    // toolbar configuration
                    toolbar: [
                        ['back', 'forward'],
                        ['reload'],
                        ['home', 'up'],
                        ['mkdir', 'mkfile', 'upload'],
                        //        		['mkfile', 'upload'],
                        //        		['open', 'download', 'getfile'],
                        ['download'],
                        ['info'],
                        ['quicklook'],
                        ['rm'],
                        //        		['duplicate', 'rename', 'edit', 'resize'],
                        ['duplicate', 'rename', 'edit'],
                        ['extract', 'archive'],
                        ['view', 'sort'],
                        ['help']
                        //['search']
                    ],
                    // directories tree options
                    tree: {
                        // expand current root on init
                        openRootOnLoad: true,
                        // auto load current dir parents
                        syncTree: true
                    }
                },
                dialog: {
                    width: 900,
                    modal: true,
                    title: 'Files',
                    zIndex: 900001
                },
                commandsOptions: {
                    getfile: {
                        onlyURL  : false,
                        oncomplete: 'destroy' // close/hide elFinder
                    }
                },
                getFileCallback: function (file) {
                    if (path != '')
                    {
                        var str = file.path;
                        var m = str.match('[\\\\ /]');
                        console.log(m)
                        file.path = file.path.substr(m.index + 1);
                        if (path[0] != '/')
                            path = '/' + path;
                    }
                    file.path = file.path.replace(/\134/g, '/');
                    $('#' + field_name).val(path + '/' + file.path);
                },
                customData: {
                    path: path
                }
            })
        }
    });
});


//============================================ ADMINAPI

var CMSApi = {
    //======================================== bootBox show image
    show_image: function(element){
        var img_src = $(element).attr('src');
        bootbox.dialog({
            message: '<div class="boot_box_image"><img src="'+img_src+'" /></div>'
        });
    },
    //======================================== ajax file Uploader
    ajax_file_upload: function(folder, input_id, input_image){
        var formData = new FormData($(".form-horizontal")[0]);
        formData.append('folder', folder);
        $.ajax({
            url: '/admin/do_upload',
            type: 'POST',
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            enctype: 'multipart/form-data',
            processData: false,
            success: function (response) {
                var obj = jQuery.parseJSON(response);
                CMSApi.showMessage('info', "Файл "+obj['files'][0]['name']+" загружен на сервер!");
                //выводим товар
                $('#'+input_id).val(obj['files'][0]['url']);
                $('#'+input_image).attr('src', obj['files'][0]['url']);
            }
        });
        return true;
    },
    ajax_one_file_upload: function(folder, input_id, input_image, nameInput){

        var formData = new FormData();
        formData.append('userfile', $('input[name='+nameInput+']')[0].files[0]);
        formData.append('folder', folder);

        $.ajax({
            url: '/admin/do_upload',
            type: 'POST',
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            enctype: 'multipart/form-data',
            processData: false,
            success: function (response) {
                var obj = jQuery.parseJSON(response);
                CMSApi.showMessage('info', "Файл "+obj['files'][0]['name']+" загружен на сервер!");
                //выводим товар
                $('#'+input_id).val(obj['files'][0]['url']);
                $('#'+input_image).attr('src', obj['files'][0]['url']);
            }
        });
        return true;
    },
    //======================================== ajax file Uploader 222222
    ajax_file_upload_slider: function(folder, input_id, input_image){
        var formData = new FormData($(".form-horizontal")[0]);
        formData.append('folder', folder);
        $.ajax({
            url: '/gallery/gallery_uploader/do_upload_slider',
            type: 'POST',
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            enctype: 'multipart/form-data',
            processData: false,
            success: function (response) {
			console.log(response);
                var obj = jQuery.parseJSON(response);
				console.log(obj);
                CMSApi.showMessage('info', "Файл "+obj['files'][0]['name']+" загружен на сервер!");
                //выводим товар
                $('#'+input_id).val(obj['files'][0]['url']);
                $('#'+input_image).attr('src', obj['files'][0]['url']);
            }
        });
        return true;
    },

    //======================================== showMessages after breadcrumb
    showMessage: function(type, message){
        if(type == "success") {
            $('.alert').remove();
            $('#alerts').append('<div class=\"alert alert-dismissible alert-success\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong>Системное сообщение</strong> - ' + message + '</div>');
            $('.alert').hide().fadeIn("slow").delay(2500).fadeOut("slow");
        }
        else if(type == "danger") {
            $('.alert').remove();
            $('#alerts').append('<div class=\"alert alert-dismissible alert-danger\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong>Системное сообщение</strong> - ' + message + '</div>');
            $('.alert').hide().fadeIn("slow").delay(2500).fadeOut("slow");
        }
        else if(type == "warning") {
            $('.alert').remove();
            $('#alerts').append('<div class=\"alert alert-dismissible alert-warning\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong>Системное сообщение</strong> - ' + message + '</div>');
            $('.alert').hide().fadeIn("slow").delay(2500).fadeOut("slow");
        }
        else if(type == "info") {
            $('.alert').remove();
            $('#alerts').append('<div class=\"alert alert-dismissible alert-info\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong>Системное сообщение</strong> - ' + message + '</div>');
            $('.alert').hide().fadeIn("slow").delay(2500).fadeOut("slow");
        }
    },
    newFormAction: function(url, selector) {
        $(document).trigger({
            'type': 'showActivity'
        });
        //$(this).hide();
        //$(this).append('Пожалуйста подождите...');
        $.ajax({
            url: url,
            data: $(selector).serialize(),
            type: "post",
            cache: false,
            dataType: "html",
            success: function(html){
                $('.modal-body').html(html);
            }
        });
        return false;
    },

    //======================================== elFinder
    elFinderPopup: function(type, id, path)
    {
        var dialog;
        fId = id;
        if (typeof path == 'undefined') path = '';

            dialog = $('#elFinder').dialogelfinder({
                url: '/admin/elfinder_init',
                lang: 'ru',
                commands: [
                    'open', 'reload', 'home', 'up', 'back', 'forward', 'getfile', 'quicklook', 'delete',
                    'download', 'rm', 'rename', 'mkdir', 'mkfile', 'upload', 'edit', 'preview', 'extract', 'archive', 'search', 'info', 'view', 'help', 'sort'
                ],
                uiOptions: {
                    // toolbar configuration
                    toolbar: [
                        ['back', 'forward'],
                        ['reload'],
                        ['home', 'up'],
                        ['mkdir', 'mkfile', 'upload'],
                        //        		['mkfile', 'upload'],
                        //        		['open', 'download', 'getfile'],
                        ['download'],
                        ['info'],
                        ['quicklook'],
                        ['rm'],
                        //        		['duplicate', 'rename', 'edit', 'resize'],
                        ['duplicate', 'rename', 'edit'],
                        ['extract', 'archive'],
                        ['view', 'sort'],
                        ['help']
                        //['search']
                    ],
                    // directories tree options
                    tree: {
                        // expand current root on init
                        openRootOnLoad: true,
                        // auto load current dir parents
                        syncTree: true
                    }
                },
                commandsOptions: {
                    getfile: {
                        onlyURL  : false,
                        oncomplete: 'destroy' // close/hide elFinder
                    }
                },
                getFileCallback: function(file) {
                    if (path != '')
                    {
                        var str = file.path;
                        var m = str.match('[\\\\ /]');
                        console.log(m)
                        file.path = file.path.substr(m.index + 1);
                        if (path[0] != '/')
                            path = '/' + path;
                    }
                    file.path = file.path.replace(/\134/g, '/');
                    $('#' + fId).val(path + '/' + file.path);
                },
                contextmenu: {
                    files: [
                        'edit', 'rename', '|', 'download', '|',
                        'rm', '|', 'archive', 'extract', '|', 'info'
                    ]
                },
                customData: {
                    path: path
                }
            });

    },
    //=============================== urlTranslit
    urlTranslit: function(namefield, urlfield){
        var translitChars = new Array;
        var auto = true;

        translitChars['А'] = 'a'; translitChars['Б'] = 'b'; translitChars['В'] = 'v'; translitChars['Г'] = 'g'; translitChars['Д'] = 'd'; translitChars['Е'] = 'e'; translitChars['Ж'] = 'j'; translitChars['З'] = 'z';
        translitChars['И'] = 'i'; translitChars['Й'] = 'y'; translitChars['К'] = 'k'; translitChars['Л'] = 'l'; translitChars['М'] = 'm'; translitChars['Н'] = 'n'; translitChars['О'] = 'o'; translitChars['П'] = 'p';
        translitChars['Р'] = 'r'; translitChars['С'] = 's'; translitChars['Т'] = 't'; translitChars['У'] = 'u'; translitChars['Ф'] = 'f'; translitChars['Х'] = 'h'; translitChars['Ц'] = 'ts'; translitChars['Ч'] = 'ch';
        translitChars['Ш'] = 'sh'; translitChars['Щ'] = 'sch'; translitChars['Ъ'] = ''; translitChars['Ы'] = 'yi'; translitChars['Ь'] = ''; translitChars['Э'] = 'e'; translitChars['Ю'] = 'yu'; translitChars['Я'] = 'ya';
        translitChars['а'] = 'a'; translitChars['б'] = 'b'; translitChars['в'] = 'v'; translitChars['г'] = 'g'; translitChars['д'] = 'd'; translitChars['е'] = 'e'; translitChars['ж'] = 'j'; translitChars['з'] = 'z';
        translitChars['и'] = 'i'; translitChars['й'] = 'y'; translitChars['к'] = 'k'; translitChars['л'] = 'l'; translitChars['м'] = 'm'; translitChars['н'] = 'n'; translitChars['о'] = 'o'; translitChars['п'] = 'p';
        translitChars['р'] = 'r'; translitChars['с'] = 's'; translitChars['т'] = 't'; translitChars['у'] = 'u'; translitChars['ф'] = 'f'; translitChars['х'] = 'h'; translitChars['ц'] = 'ts'; translitChars['ч'] = 'ch';
        translitChars['ш'] = 'sh'; translitChars['щ'] = 'sch'; translitChars['ъ'] = 'y'; translitChars['ы'] = 'yi'; translitChars['ь'] = ''; translitChars['э'] = 'e'; translitChars['ю'] = 'yu'; translitChars['я'] = 'ya';
        translitChars[' '] = '-'; translitChars['.'] = ''; translitChars['/'] = '-';

        function translit(string) {
            var result = '';
            for (var i = 0; i < 126; i++) {
                var stringChar = string.substr(i, 1);
                if (translitChars[stringChar]) {
                    result += translitChars[stringChar];
                } else {
                    result += stringChar;
                }
            }
            result = result.replace(/[^A-Za-z0-9_\-]/g, '');
            return result.toLowerCase();
        }

        var string = $('#' + namefield).val();
        var translitString = translit(string);
        $('#' + urlfield).val(translitString);


        $('.form-horizontal').bootstrapValidator('revalidateField', urlfield);

    },

    //========================================DELETE AJAX FUNCTION
    deleteFunction: function(element, refresh)
    {
        var ids = new Array();
        $('.checkbox-del input[type=checkbox]:checked').each(function() {
            ids.push($(this).val());
        });
        //берем ссылку из атрибута кнопки
        var href = $('#' + element).attr('href');
        $.post(
            href,
            { ids: ids},
            function(html){
                window.location.href = (refresh);
            },
            'html');
        return false;
    },
    redirect_after_save: function(element)
    {
        $(element).closest('form').append('<input type="hidden" name="redirect_after_save" value="true" />');
        $(element).closest('form').submit();
    }
}

//===================================================== выпадающее меню в категориях
$('#category .btn:has(.fa-plus)').die('click').live('click', function() {
    var $this = $(this);
    $this.closest('.row-category').next().show();
    $this.hide().prev().show();
});
$('#category .btn:has(.fa-minus)').die('click').live('click', function() {
    var $this = $(this);
    $this.closest('.row-category').next().hide();
    $this.hide().next().show();
});

//===================================================== checkBoxes
$(document).ready(function() {

    $.fn.checkNice = function() {
        var count_checked = $(".checkbox-del input[type=checkbox]:checked").length; // count the checked rows
        if(count_checked == 0)
        {
            $('#deleteCheckbox').attr('disabled', 'disabled');
            return false;
        }
        else {
            $('#deleteCheckbox').removeAttr('disabled');
        }
    };

    $('.checkbox-del:not("#allCheckbox")').on('click', function(){

        if ($(this).children('input').prop('checked') == false){
            $(this).addClass('checked');
            $(this).children('input').attr('checked', 'checked');
            $(this).checkNice();
        }
        else{
            $(this).removeClass('checked');
            $(this).children('input').removeAttr('checked');
            $(this).checkNice();
        }

    });

    $('#deleteCheckbox').on('click', function(){
        var arr = new Array();
        var inputs = $('.checkbox-del').children('input');
        inputs.each(function() {
            var inp = $(this);
            if (inp.attr('checked') === 'checked')
            {
                if (inp.attr('value') != 'On') {
                    arr.push(inp.attr('value'));
                }
            }
        });
        $(this).checkNice();
    });

    $('#allCheckbox').on('click', function(){
        var inputs = $('.checkbox-del').children('input');

        if ($(this).children('input').prop('checked') == false) {
            $(this).addClass('checked');
            $(this).children('input').attr('checked', 'checked');

            inputs.each(function() {
                //var inp = $(this);

                    $(inputs).attr('checked', 'checked');
                    $(inputs).parent('.checkbox-del').addClass('checked');

            });
        }else{
            $(this).children('input').removeAttr('checked');
            $(this).removeClass('checked');
            inputs.each(function() {
                $(inputs).removeAttr('checked');
                $(inputs).parent('.checkbox-del').removeClass('checked');
            });

        }
        $(this).checkNice();
    });

    $('.checkbox-nice').on('click', function(){

        if ($(this).children('input').prop('checked') == false){
            $(this).addClass('checked');
            $(this).children('input').attr('checked', 'checked');
            $(this).checkNice();
        }
        else{
            $(this).removeClass('checked');
            $(this).children('input').removeAttr('checked');
            $(this).checkNice();
        }

    });

});

//======================================== автоматическое заполнение meta_url при вводе названия

$(document).ready(function() {
    var translitChars = new Array;
    var auto = true;
    translitChars['А'] = 'a'; translitChars['Б'] = 'b'; translitChars['В'] = 'v'; translitChars['Г'] = 'g'; translitChars['Д'] = 'd'; translitChars['Е'] = 'e'; translitChars['Ж'] = 'j'; translitChars['З'] = 'z';
    translitChars['И'] = 'i'; translitChars['Й'] = 'y'; translitChars['К'] = 'k'; translitChars['Л'] = 'l'; translitChars['М'] = 'm'; translitChars['Н'] = 'n'; translitChars['О'] = 'o'; translitChars['П'] = 'p';
    translitChars['Р'] = 'r'; translitChars['С'] = 's'; translitChars['Т'] = 't'; translitChars['У'] = 'u'; translitChars['Ф'] = 'f'; translitChars['Х'] = 'h'; translitChars['Ц'] = 'ts'; translitChars['Ч'] = 'ch';
    translitChars['Ш'] = 'sh'; translitChars['Щ'] = 'sch'; translitChars['Ъ'] = ''; translitChars['Ы'] = 'yi'; translitChars['Ь'] = ''; translitChars['Э'] = 'e'; translitChars['Ю'] = 'yu'; translitChars['Я'] = 'ya';
    translitChars['а'] = 'a'; translitChars['б'] = 'b'; translitChars['в'] = 'v'; translitChars['г'] = 'g'; translitChars['д'] = 'd'; translitChars['е'] = 'e'; translitChars['ж'] = 'j'; translitChars['з'] = 'z';
    translitChars['и'] = 'i'; translitChars['й'] = 'y'; translitChars['к'] = 'k'; translitChars['л'] = 'l'; translitChars['м'] = 'm'; translitChars['н'] = 'n'; translitChars['о'] = 'o'; translitChars['п'] = 'p';
    translitChars['р'] = 'r'; translitChars['с'] = 's'; translitChars['т'] = 't'; translitChars['у'] = 'u'; translitChars['ф'] = 'f'; translitChars['х'] = 'h'; translitChars['ц'] = 'ts'; translitChars['ч'] = 'ch';
    translitChars['ш'] = 'sh'; translitChars['щ'] = 'sch'; translitChars['ъ'] = 'y'; translitChars['ы'] = 'yi'; translitChars['ь'] = ''; translitChars['э'] = 'e'; translitChars['ю'] = 'yu'; translitChars['я'] = 'ya';
    translitChars[' '] = '-'; translitChars['.'] = ''; translitChars['/'] = '-';

    $(function () {
        if ($("#meta_url").val() != '' || $("#meta_url").val() > 130) {
            auto = false;
        }
        $("#inputName").keyup(function () {
            if (auto) {
                var string = $(this).val();
                var translitString = translit(string);
                $("#meta_url").val(translitString);
            }
        });
        $("#meta_url").keyup(function () {
            auto = $(this).val() == '';
        });
    });

    function translit(string) {
        var result = '';
        for (var i = 0; i < 126; i++) {
            var stringChar = string.substr(i, 1);
            if (translitChars[stringChar]) {
                result += translitChars[stringChar];
            } else {
                result += stringChar;
            }
        }
        result = result.replace(/[^A-Za-z0-9_\-]/g, '');
        return result.toLowerCase();
    }
});

//======================================== validation bootstrap
