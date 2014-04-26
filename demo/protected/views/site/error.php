<?php if ($code == 404) { ?>
<div class="container">
    <div class="row">
        <div class="col-lg-6 col-lg-offset-3 p404 centered">
            <img src="<?php echo Yii::app()->baseUrl?>/img/404.png" alt="">
            <h1>DON'T PANIC!!</h1>
            <h3>The page you are looking for doesn't exist.</h3>
            <br>
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                  <input type="text" class="form-control" id="form1Name" name="form1Name">
                  <button class="btn btn-theme mt">Search</button>
                </div>
            </div>

            <h5 class="mt">Hey, maybe you will be interested in these pages:</h5>
            <p><a href="<?php echo Yii::app()->baseUrl?>">Home</a> | <a href="#">Sitemap</a> | <a href="#"> Contact</a></p>
        </div>
    </div>
</div>
<?php } else { ?>
<div class="container">
    <div class="row">
        <div class="col-lg-6 col-lg-offset-3 p404 centered">
            <img src="<?php echo Yii::app()->baseUrl?>/img/500.png" alt="">
            <h1>ERROR 500</h1>
            <h3>Ouch!! Something Went Wrong!</h3>
            <br>
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                  <input type="text" class="form-control" id="form1Name" name="form1Name">
                  <button class="btn btn-theme mt">Search</button>
                </div>
            </div>

            <h5 class="mt">Hey, maybe you will be interested in these pages:</h5>
            <p><a href="<?php echo Yii::app()->baseUrl?>">Index</a> | <a href="#">Sitemap</a> | <a href="#"> Contact</a></p>
        </div>
    </div>
</div>

<?php } ?>