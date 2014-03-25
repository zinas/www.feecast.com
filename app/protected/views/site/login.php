<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.css" rel="stylesheet">


      <script id="metamorph-1-start" type="text/x-placeholder"></script><script id="metamorph-21-start" type="text/x-placeholder"></script>

    <div class="container text-center">
        <form class="form-signin" data-ember-action="2">
            <h2 class="form-signin-heading">Sign in</h2>

            <small class="text-muted">Connect <a>FeeCast</a> with your favorite social network</small>
            <br><br>


<p>
<a class="btn btn-primary social-login-btn social-facebook" href="/auth/facebook"><i class="fa fa-facebook"></i></a>
<a class="btn btn-primary social-login-btn social-twitter" href="/auth/twitter"><i class="fa fa-twitter"></i></a>
</p>
<p>
<a class="btn btn-primary social-login-btn social-linkedin" href="/auth/linkedin"><i class="fa fa-linkedin"></i></a>
<a class="btn btn-primary social-login-btn social-google" href="/auth/google"><i class="fa fa-google-plus"></i></a>
</p>

<div class="btn-group social-login-more">
  <button type="button" class="btn btn-default dropdown-toggle btn-block" data-toggle="dropdown">
    More...
  </button>
  <ul class="dropdown-menu text-left " role="menu">
    <li><a href="#"><i class="fa fa-tumblr-sign"></i>   Tumblr</a></li>
    <li><a href="#"><i class="fa fa-github-alt"></i>   Github</a></li>
    <li><a href="#"><i class="fa fa-dropbox"></i>   Dropbox</a></li>
    <li><a href="/auth/amazon"><span class="zocial-amazon"></span>   Amazon</a></li>
    <li><a href="#"><span class="zocial-bitbucket"></span>   Bitbucket</a></li>
    <li><a href="#"><span class="zocial-evernote"></span>   Evernote</a></li>
    <li><a href="#"><span class="zocial-meetup"></span>   Meetup</a></li>
    <li><a href="#"><i class="fa fa-windows"></i>   Windows Live</a></li>
    <li><a href="#"><i class="fa fa-weibo"></i>   Weibo</a></li>
    <li><a href="#"><i class="fa fa-foursquare"></i>   Foursquare</a></li>
    <li><a href="#"><i class="fa fa-stackexchange"></i>   Stack Exchange</a></li>
    <li><a href="#"><i class="fa fa-trello"></i>   Trello</a></li>
    <li><a href="#"><span class="zocial-wordpress"></span>   Wordpress</a></li>
  </ul>
</div>
<br><br>


            <small class="text-muted">Or sign in with <a>FeeCast</a></small>
            <br><br>

            <input id="ember360" class="ember-view ember-text-field form-control login-input" placeholder="Email Address" type="text">
            <input id="ember361" class="ember-view ember-text-field form-control login-input-pass" placeholder="Password" type="password">

            <script id="metamorph-22-start" type="text/x-placeholder"></script><script id="metamorph-22-end" type="text/x-placeholder"></script>

            <button class="btn btn-lg btn-primary btn-block btn-center" type="submit" data-bindattr-3="3">Sign in</button>
            <br>
            <small class="create-account text-muted"><p>Dont have a <a>FeeCast</a> or social network account? </p><a href="<?php echo Yii::app()->createUrl('site/signup') ?>" id="ember363" class="ember-view btn btn-sm btn-default"> Sign Up </a> </small>
        </form>