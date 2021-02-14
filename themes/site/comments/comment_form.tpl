<!-- commnet-form of the page -->
<form action="/comments/send_comment/product" class="comment-form validate-form">
    <input type="hidden" name="article_id" value="<?=$article_id?>">
    <fieldset>
        <div class="input-row field form-group">
            <input class="form-control input-field required" type="text" name="name" placeholder="Ваше имя *">
        </div>
        <!-- <div class="input-row field form-group">
            <input class="form-control input-field required-email" type="email" name="email" placeholder="Ваш email *">
        </div> -->
        <div class="input-row form-group">
            <textarea  class="form-control input-field textarea" cols="30" rows="10" name="message" placeholder="Сообщение *"></textarea>
        </div>
        <?php if(isset($captcha) && $captcha == 1) { ?>
            <div class="form-group">
                <div id="imgcode" class="pull-left"> <img src="/forms/captcha" />
                    <input type="text" name="code" style="float: left;width: 50px;display: inline-block;margin: 0px 10px;"/></div>
            </div>
        <?php } ?>
        <div class="input-row text-right">
            <input class="btn btn-primary big-btn comment-submit" type="submit" value="Отправить">
        </div>
    </fieldset>
</form>

