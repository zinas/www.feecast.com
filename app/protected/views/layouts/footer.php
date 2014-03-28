        <footer id="footer-main" class="container">
            <ul class="nav nav-justified">
                <li><a href="<?php echo Yii::app()->createUrl('site/page', array('view'=>'about')) ?>">About</a></li>
                <li><a href="<?php echo Yii::app()->createUrl('site/page', array('view'=>'help')) ?>">Help</a></li>
                <li><a href="<?php echo Yii::app()->createUrl('site/page', array('view'=>'contact')) ?>">Contact</a></li>
                <li><a href="<?php echo Yii::app()->createUrl('site/page', array('view'=>'blog')) ?>">Blog</a></li>
                <li><a href="<?php echo Yii::app()->createUrl('site/page', array('view'=>'media')) ?>">Media Kit</a></li>
            </ul>

          <hr>
          <div class="row">
            <div class="col-lg-12">
              <div class="col-md-8">
                <a href="#">Terms of Service</a>
                <a href="#">Privacy</a>
                <a href="#">Security</a>
              </div>
              <div class="col-md-4">
                <p class="muted pull-right">&copy; 2014 FeeCast Corporation. All rights reserved</p>
              </div>
            </div>
          </div>
        </footer>
