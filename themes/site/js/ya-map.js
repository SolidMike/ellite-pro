if($('#map').length){
    ymaps.ready(init);
}

function init() {
    var myMap = new ymaps.Map('map', {
            center: [55.786450, 37.727346],
            zoom: 13,
            controls: ["zoomControl", "fullscreenControl"]
        }),
        // Создание макета балуна на основе Twitter Bootstrap.
        MyBalloonLayout = ymaps.templateLayoutFactory.createClass(
            '<div class="custom-balloon">' +
            '<div class="custom-balloon__arrow"></div>' +
            '<div class="custom-balloon__close"><svg width="11" height="11" viewBox="0 0 11 11" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M1 1L10 10M10 1L1 10" stroke="#BDBDBD"/></svg></div>' +
            '$[[options.contentLayout observeSize minWidth=235 maxWidth=235 maxHeight=350]]' +
            '</div>', {
                /**
                 * Строит экземпляр макета на основе шаблона и добавляет его в родительский HTML-элемент.
                 * @see https://api.yandex.ru/maps/doc/jsapi/2.1/ref/reference/layout.templateBased.Base.xml#build
                 * @function
                 * @name build
                 */
                build: function () {
                    this.constructor.superclass.build.call(this);

                    this._$element = $('.custom-balloon', this.getParentElement());

                    this.applyElementOffset();

                    this._$element.find('.custom-balloon__close')
                        .on('click', $.proxy(this.onCloseClick, this));
                },

                /**
                 * Удаляет содержимое макета из DOM.
                 * @see https://api.yandex.ru/maps/doc/jsapi/2.1/ref/reference/layout.templateBased.Base.xml#clear
                 * @function
                 * @name clear
                 */
                clear: function () {
                    this._$element.find('.custom-balloon__close')
                        .off('click');

                    this.constructor.superclass.clear.call(this);
                },

                /**
                 * Метод будет вызван системой шаблонов АПИ при изменении размеров вложенного макета.
                 * @see https://api.yandex.ru/maps/doc/jsapi/2.1/ref/reference/IBalloonLayout.xml#event-userclose
                 * @function
                 * @name onSublayoutSizeChange
                 */
                onSublayoutSizeChange: function () {
                    MyBalloonLayout.superclass.onSublayoutSizeChange.apply(this, arguments);

                    if(!this._isElement(this._$element)) {
                        return;
                    }

                    this.applyElementOffset();

                    this.events.fire('shapechange');
                },

                /**
                 * Сдвигаем балун, чтобы "хвостик" указывал на точку привязки.
                 * @see https://api.yandex.ru/maps/doc/jsapi/2.1/ref/reference/IBalloonLayout.xml#event-userclose
                 * @function
                 * @name applyElementOffset
                 */
                applyElementOffset: function () {
                    this._$element.css({
                        left: -(this._$element[0].offsetWidth / 2),
                        // top: -(this._$element[0].offsetHeight + this._$element.find('.custom-balloon__arrow')[0].offsetHeight)
                        top: 16
                    });
                },

                /**
                 * Закрывает балун при клике на крестик, кидая событие "userclose" на макете.
                 * @see https://api.yandex.ru/maps/doc/jsapi/2.1/ref/reference/IBalloonLayout.xml#event-userclose
                 * @function
                 * @name onCloseClick
                 */
                onCloseClick: function (e) {
                    e.preventDefault();

                    this.events.fire('userclose');
                },

                /**
                 * Используется для автопозиционирования (balloonAutoPan).
                 * @see https://api.yandex.ru/maps/doc/jsapi/2.1/ref/reference/ILayout.xml#getClientBounds
                 * @function
                 * @name getClientBounds
                 * @returns {Number[][]} Координаты левого верхнего и правого нижнего углов шаблона относительно точки привязки.
                 */
                getShape: function () {
                    if(!this._isElement(this._$element)) {
                        return MyBalloonLayout.superclass.getShape.call(this);
                    }

                    var position = this._$element.position();

                    return new ymaps.shape.Rectangle(new ymaps.geometry.pixel.Rectangle([
                        [position.left, position.top], [
                            position.left + this._$element[0].offsetWidth,
                            position.top + this._$element[0].offsetHeight + this._$element.find('.custom-balloon__arrow')[0].offsetHeight
                        ]
                    ]));
                },

                /**
                 * Проверяем наличие элемента (в ИЕ и Опере его еще может не быть).
                 * @function
                 * @private
                 * @name _isElement
                 * @param {jQuery} [element] Элемент.
                 * @returns {Boolean} Флаг наличия.
                 */
                _isElement: function (element) {
                    return element && element[0] && element.find('.custom-balloon__arrow')[0];
                }
            }),

        // Создание вложенного макета содержимого балуна.
        MyBalloonContentLayout = ymaps.templateLayoutFactory.createClass(
            // '<div class="custom-balloon__title">$[properties.balloonHeader]</div>' +
            '<div class="custom-balloon__content">$[properties.balloonContent]</div>' //+
            // '<div class="custom-balloon__footer">$[properties.balloonFooter]</div>'
        );


    parsePoints();
    function parsePoints() {

        var data = $('#map-points').html(),
            data_json = $.parseJSON(data),
            menu = $('#map-list');

        // Коллекция для геообъектов группы.
        var collection = new ymaps.GeoObjectCollection(null);

        // Добавляем коллекцию на карту.
        myMap.geoObjects.add(collection);

        for (var j = 0, m = data_json.features.length; j < m; j++) {
            createPoint(data_json.features[j], collection);
        }

        function createPoint(item, collection) {
            var itemClass = '';
            if( j == 0){
                itemClass = 'active';
            }
            // Пункт меню.
            var menuItem = $('<li role="presentation" class="'+ itemClass +'"><a href="#' + item.properties.pointId + '" class="title title_xs uppercase" aria-controls="' + item.properties.pointId + '" role="tab" data-toggle="tab">' + item.properties.balloonContentHeader + '</a></li>');
            // Создаем метку.
            var placemark = new ymaps.Placemark(item.geometry.coordinates, {
                name: item.properties.balloonContentFooter,
                balloonHeader: item.properties.balloonContentHeader,
                balloonContent: item.properties.balloonContentBody,
                balloonFooter: item.properties.balloonContentFooter
            }, {
                balloonShadow: false,
                balloonLayout: MyBalloonLayout,
                balloonContentLayout: MyBalloonContentLayout,
                balloonPanelMaxMapArea: 0,
                // Не скрываем иконку при открытом балуне.
                hideIconOnBalloonOpen: false,
                // И дополнительно смещаем балун, для открытия над иконкой.
                // balloonOffset: [0, -150],
                iconLayout: 'default#image',
                iconImageHref: '/themes/site/images/map-point.png',
                iconImageSize: [26, 35], // размер иконки
                iconImageOffset: [-13, -35], // позиция иконки
            });

            // Добавляем пункт в меню.
            menuItem
                .appendTo(menu)
                // При клике по пункту подменю открываем/закрываем баллун у метки.
                .find('a')
                .bind('click', function () {
                    if (!placemark.balloon.isOpen()) {
                        placemark.balloon.open();
                        myMap.setCenter(placemark.geometry._coordinates);
                        $(this).tab('show');
                    } else {
                        // placemark.balloon.close();
                    }
                    return false;
                });

            // Добавляем метку в коллекцию.
            collection.add(placemark);
        }
    }
}


if($('#contact-map').length){
    ymaps.ready(initContact);
}

function initContact() {
    var myMapContact = new ymaps.Map('contact-map', {
            center: [47.230774, 39.724607],
            zoom: 15,
            controls: ["zoomControl", "fullscreenControl"]
        }),
        // Создание макета балуна на основе Twitter Bootstrap.
        MyBalloonLayout = ymaps.templateLayoutFactory.createClass(
            '<div class="custom-balloon">' +
            '<div class="custom-balloon__arrow"></div>' +
            '<div class="custom-balloon__close"><svg width="11" height="11" viewBox="0 0 11 11" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M1 1L10 10M10 1L1 10" stroke="#BDBDBD"/></svg></div>' +
            '$[[options.contentLayout observeSize minWidth=235 maxWidth=235 maxHeight=350]]' +
            '</div>', {
                /**
                 * Строит экземпляр макета на основе шаблона и добавляет его в родительский HTML-элемент.
                 * @see https://api.yandex.ru/maps/doc/jsapi/2.1/ref/reference/layout.templateBased.Base.xml#build
                 * @function
                 * @name build
                 */
                build: function () {
                    this.constructor.superclass.build.call(this);

                    this._$element = $('.custom-balloon', this.getParentElement());

                    this.applyElementOffset();

                    this._$element.find('.custom-balloon__close')
                        .on('click', $.proxy(this.onCloseClick, this));
                },

                /**
                 * Удаляет содержимое макета из DOM.
                 * @see https://api.yandex.ru/maps/doc/jsapi/2.1/ref/reference/layout.templateBased.Base.xml#clear
                 * @function
                 * @name clear
                 */
                clear: function () {
                    this._$element.find('.custom-balloon__close')
                        .off('click');

                    this.constructor.superclass.clear.call(this);
                },

                /**
                 * Метод будет вызван системой шаблонов АПИ при изменении размеров вложенного макета.
                 * @see https://api.yandex.ru/maps/doc/jsapi/2.1/ref/reference/IBalloonLayout.xml#event-userclose
                 * @function
                 * @name onSublayoutSizeChange
                 */
                onSublayoutSizeChange: function () {
                    MyBalloonLayout.superclass.onSublayoutSizeChange.apply(this, arguments);

                    if(!this._isElement(this._$element)) {
                        return;
                    }

                    this.applyElementOffset();

                    this.events.fire('shapechange');
                },

                /**
                 * Сдвигаем балун, чтобы "хвостик" указывал на точку привязки.
                 * @see https://api.yandex.ru/maps/doc/jsapi/2.1/ref/reference/IBalloonLayout.xml#event-userclose
                 * @function
                 * @name applyElementOffset
                 */
                applyElementOffset: function () {
                    this._$element.css({
                        left: -(this._$element[0].offsetWidth / 2),
                        // top: -(this._$element[0].offsetHeight + this._$element.find('.custom-balloon__arrow')[0].offsetHeight)
                        top: 16
                    });
                },

                /**
                 * Закрывает балун при клике на крестик, кидая событие "userclose" на макете.
                 * @see https://api.yandex.ru/maps/doc/jsapi/2.1/ref/reference/IBalloonLayout.xml#event-userclose
                 * @function
                 * @name onCloseClick
                 */
                onCloseClick: function (e) {
                    e.preventDefault();

                    this.events.fire('userclose');
                },

                /**
                 * Используется для автопозиционирования (balloonAutoPan).
                 * @see https://api.yandex.ru/maps/doc/jsapi/2.1/ref/reference/ILayout.xml#getClientBounds
                 * @function
                 * @name getClientBounds
                 * @returns {Number[][]} Координаты левого верхнего и правого нижнего углов шаблона относительно точки привязки.
                 */
                getShape: function () {
                    if(!this._isElement(this._$element)) {
                        return MyBalloonLayout.superclass.getShape.call(this);
                    }

                    var position = this._$element.position();

                    return new ymaps.shape.Rectangle(new ymaps.geometry.pixel.Rectangle([
                        [position.left, position.top], [
                            position.left + this._$element[0].offsetWidth,
                            position.top + this._$element[0].offsetHeight + this._$element.find('.custom-balloon__arrow')[0].offsetHeight
                        ]
                    ]));
                },

                /**
                 * Проверяем наличие элемента (в ИЕ и Опере его еще может не быть).
                 * @function
                 * @private
                 * @name _isElement
                 * @param {jQuery} [element] Элемент.
                 * @returns {Boolean} Флаг наличия.
                 */
                _isElement: function (element) {
                    return element && element[0] && element.find('.custom-balloon__arrow')[0];
                }
            }),

        // Создание вложенного макета содержимого балуна.
        MyBalloonContentLayout = ymaps.templateLayoutFactory.createClass(
            '<div class="custom-balloon__title" style="margin-bottom: 8px;"><img src="/themes/site/images/logo-b.png" alt=""></div>' +
            '<div class="custom-balloon__content">$[properties.balloonHeader]</div>' +
            '<div>Вход через Арку</div>'
        ),

        // Создание метки с пользовательским макетом балуна.
        myPlacemark = window.myPlacemark = new ymaps.Placemark(myMapContact.getCenter(), {
            balloonHeader: 'Ростов-на-Дону, Ул. Красноармейская 103',
        }, {
            balloonShadow: true,
            balloonLayout: MyBalloonLayout,
            balloonContentLayout: MyBalloonContentLayout,
            balloonPanelMaxMapArea: 0,
            // Не скрываем иконку при открытом балуне.
            hideIconOnBalloonOpen: false,
            // И дополнительно смещаем балун, для открытия над иконкой.
            // balloonOffset: [3, -40]
            iconLayout: 'default#image',
            iconImageHref: '/themes/site/images/map-point.png', // иконка иконки
            iconImageSize: [26, 35], // размер иконки
            iconImageOffset: [-13, -35], // позиция иконки
        });

    myMapContact.geoObjects.add(myPlacemark);
}