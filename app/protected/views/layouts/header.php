         <div class="nav-wrapper">
         <div class="container">
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
              <div class="col-sm-6">
                <form class="navbar-form" role="search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search by name" name="q">
                    <div class="input-group-btn">
                      <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                    </div>
                  </div>
                </form>
              </div>
              <ul class="nav navbar-nav navbar-right">
                <li><a href="<?php echo Yii::app()->createUrl('site/page?view=help') ?>">Help</a></li>
                <?php if (Yii::app()->user->id) {?>
                  <li>
                    <!-- <a href="#"><?php echo Yii::app()->user->firstName?></a> -->

                    <a class="dropdown-toggle" data-toggle="dropdown" href="#"><?php echo Yii::app()->user->firstName?><span class="caret"></span></a>
                    <ul class="dropdown-menu">
                      <li><a href="#">Dashboard</a></li>
                      <li><a href="#">My appointments</a></li>
                      <li><a href="#">My reviews</a></li>
                      <li><a href="#">Profile</a></li>
                      <li class="divider"></li>
                      <li><a href="<?php echo Yii::app()->createUrl('site/logout') ?>">Logout</a></li>
                    </ul>
                  </li>
                  <li></li>
                <?php } else { ?>
                  <li><a href="<?php echo Yii::app()->createUrl('site/signup') ?>">Sign up</a></li>
                  <li><a data-toggle="modal" href="#login-form-modal">Login</a></li>
                <?php } ?>
              </ul>
            </div>
          </nav>
          <?php $this->widget('application.widgets.LoginWidget'); ?>
        </header>
      </div>
    </div>