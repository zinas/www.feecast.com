<div class="modal fade login-modal " id="login-form-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
<div id="login-page">
<form class="form-login" action="index.html">
  <h2 class="form-login-heading">sign in now</h2>
  <div class="login-wrap">
      <input type="text" class="form-control" placeholder="User ID" autofocus>
      <br>
      <input type="password" class="form-control" placeholder="Password">
      <label class="checkbox">
          <input type="checkbox" value="remember-me"> Remember me
          <span class="pull-right">
              <a data-toggle="modal" href="login.html#myModal"> Forgot Password?</a>

          </span>
      </label>
      <button class="btn btn-theme btn-block" href="index.html" type="submit"><i class="fa fa-lock"></i> SIGN IN</button>
      <hr>

      <div class="login-social-link centered">
      <p>or you can sign in via your social network</p>
          <button class="btn btn-facebook" type="submit"><i class="fa fa-facebook"></i> Facebook</button>
          <button class="btn btn-twitter" type="submit"><i class="fa fa-twitter"></i> Twitter</button>
      </div>
      <div class="registration">
          Don't have an account yet?<br/>
          <a class="" href="<?php echo Yii::app()->createUrl('site/signup') ?>">
              Create an account
          </a>
      </div>

  </div>

</form>
</div>


    </div>
  </div>
</div>