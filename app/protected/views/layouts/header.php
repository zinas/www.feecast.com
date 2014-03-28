         <header id="header-main">
          <nav class="navbar navbar-default" role="navigation">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="<?php echo Yii::app()->request->baseUrl; ?>"><div>FeeCast</div><small>Healthcare fees at your fingertips.</small></a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <div class="col-sm-3 col-md-3">
                <form class="navbar-form" role="search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search" name="q">
                    <div class="input-group-btn">
                      <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                    </div>
                  </div>
                </form>
              </div>
              <ul class="nav navbar-nav navbar-right">
                <li><a href="<?php echo Yii::app()->createUrl('site/page?view=help') ?>">Help</a></li>
                <li><a href="<?php echo Yii::app()->createUrl('site/signup') ?>">Sign up</a></li>
                <li><a data-toggle="modal" href="#login-form-modal">Login</a></li>
              </ul>
            </div>
          </nav>
          <?php $this->widget('application.widgets.LoginWidget'); ?>
        </header>