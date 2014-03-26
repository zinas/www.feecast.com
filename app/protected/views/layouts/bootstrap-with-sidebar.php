<?php /* @var $this Controller */ ?>
<?php $this->beginContent('//layouts/bootstrap-base'); ?>
<div class="container">
    <div class="row">
        <div class="col-sm-3">
            <h3>Company</h3>
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
            </ul>
        </div>
        <div class="col-sm-9">
            <?php echo $content; ?>
        </div>
    </div>
</div><!-- content -->
<?php $this->endContent(); ?>