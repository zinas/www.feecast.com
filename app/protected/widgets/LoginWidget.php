<?php

class LoginWidget extends CWidget
{
    public function init()
    {


    }

    public function run()
    {
        // this method is called by CController::endWidget()
        $this->render('login-widget');
    }
}