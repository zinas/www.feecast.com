<?php /* @var $this Controller */ ?>
<?php $this->beginContent('//layouts/bootstrap-base'); ?>
<div class="container">
    <div class="row">
        <div class="col-sm-3">
            <!-- <h3>Company</h3>
            <ul class="nav nav-pills nav-stacked">
              <li class="<?php echo Yii::app()->request->getQuery('view')=='about'?'active':'';?>"><a href="<?php echo Yii::app()->createUrl('site/page', array('view'=>'about')) ?>">About</a></li>
              <li class="<?php echo Yii::app()->request->getQuery('view')=='team'?'active':'';?>"><a href="<?php echo Yii::app()->createUrl('site/page', array('view'=>'team')) ?>">Team</a></li>
              <li class="<?php echo Yii::app()->request->getQuery('view')=='careers'?'active':'';?>"><a href="<?php echo Yii::app()->createUrl('site/page', array('view'=>'careers')) ?>">Careers</a></li>
              <li class="<?php echo Yii::app()->request->getQuery('view')=='contact'?'active':'';?>"><a href="<?php echo Yii::app()->createUrl('site/page', array('view'=>'contact')) ?>">Contact</a></li>
              <li class="<?php echo Yii::app()->request->getQuery('view')=='suggestions'?'active':'';?>"><a href="<?php echo Yii::app()->createUrl('site/page', array('view'=>'suggestions')) ?>">Suggestions</a></li>
              <li class="<?php echo Yii::app()->request->getQuery('view')=='help'?'active':'';?>"><a href="<?php echo Yii::app()->createUrl('site/page', array('view'=>'help')) ?>">Help</a></li>
              <li class="<?php echo Yii::app()->request->getQuery('view')=='blog'?'active':'';?>"><a href="<?php echo Yii::app()->createUrl('site/page', array('view'=>'blog')) ?>">Blog</a></li>
              <li class="<?php echo Yii::app()->request->getQuery('view')=='media'?'active':'';?>"><a href="<?php echo Yii::app()->createUrl('site/page', array('view'=>'media')) ?>">Media Kit</a></li>
            </ul>
            <hr />
            <h3>For users</h3>
            <ul class="nav nav-pills nav-stacked">
              <li class="<?php echo Yii::app()->request->getQuery('view')=='howto'?'active':'';?>"><a href="<?php echo Yii::app()->createUrl('site/page', array('view'=>'howto')) ?>">How it works</a></li>
              <li class="<?php echo Yii::app()->request->getQuery('view')=='legal'?'active':'';?>"><a href="<?php echo Yii::app()->createUrl('site/page', array('view'=>'legal')) ?>">Legal</a></li>
            </ul> -->

            <section class="panel">
                <div class="panel-body">
                    <h3>Company</h3>
                    <ul class="nav nav-pills nav-stacked mail-nav">
                      <li class="<?php echo Yii::app()->request->getQuery('view')=='about'?'active':'';?>"><a href="<?php echo Yii::app()->createUrl('site/page', array('view'=>'about')) ?>"><i class="fa fa-info"></i>About</a></li>
                      <li class="<?php echo Yii::app()->request->getQuery('view')=='team'?'active':'';?>"><a href="<?php echo Yii::app()->createUrl('site/page', array('view'=>'team')) ?>"><i class="fa fa-group"></i>Team</a></li>
                      <li class="<?php echo Yii::app()->request->getQuery('view')=='careers'?'active':'';?>"><a href="<?php echo Yii::app()->createUrl('site/page', array('view'=>'careers')) ?>"><i class="fa fa-briefcase"></i>Careers</a></li>
                      <li class="<?php echo Yii::app()->request->getQuery('view')=='contact'?'active':'';?>"><a href="<?php echo Yii::app()->createUrl('site/page', array('view'=>'contact')) ?>"><i class="fa fa-comments"></i>Contact</a></li>
                      <li class="<?php echo Yii::app()->request->getQuery('view')=='help'?'active':'';?>"><a href="<?php echo Yii::app()->createUrl('site/page', array('view'=>'help')) ?>"><i class="fa fa-question"></i>Help</a></li>
                      <li class="<?php echo Yii::app()->request->getQuery('view')=='blog'?'active':'';?>"><a href="<?php echo Yii::app()->createUrl('site/page', array('view'=>'blog')) ?>"><i class="fa fa-font"></i>Blog</a></li>
                      <li class="<?php echo Yii::app()->request->getQuery('view')=='media'?'active':'';?>"><a href="<?php echo Yii::app()->createUrl('site/page', array('view'=>'media')) ?>"><i class="fa fa-camera"></i>Media Kit</a></li>
                    </ul>
                </div>
            </section>
            <section class="panel">
                <div class="panel-body">
                    <h3>For users</h3>
                    <ul class="nav nav-pills nav-stacked mail-nav">
                        <li class="<?php echo Yii::app()->request->getQuery('view')=='howto'?'active':'';?>"><a href="<?php echo Yii::app()->createUrl('site/page', array('view'=>'howto')) ?>"><i class="fa fa-lightbulb-o"></i>How it works</a></li>
                        <li class="<?php echo Yii::app()->request->getQuery('view')=='legal'?'active':'';?>"><a href="<?php echo Yii::app()->createUrl('site/page', array('view'=>'legal')) ?>"><i class="fa fa-legal"></i>Legal</a></li>
                    </ul>
                </div>
            </section>


        </div>
        <div class="col-sm-9">
            <?php echo $content; ?>
        </div>
    </div>
</div><!-- content -->
<?php $this->endContent(); ?>