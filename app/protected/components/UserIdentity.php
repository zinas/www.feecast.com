<?php

/**
 * UserIdentity represents the data needed to identity a user.
 * It contains the authentication method that checks if the provided
 * data can identity the user.
 */
class UserIdentity extends CUserIdentity
{
	private $patID;
    public function authenticate()
    {
        $record=Patient::model()->findByAttributes(array('patLogin'=>$this->username));

        if($record===null)
            $this->errorCode=self::ERROR_USERNAME_INVALID;
        else if($record->patPwd!==$this->password)
            $this->errorCode=self::ERROR_PASSWORD_INVALID;
        else
        {
            $this->patID=$record->patID;
            $this->setState('fullname', $record->fullname);
            $this->setState('email', $record->patEmail);
            $this->setState('username', $record->patLogin);
            $this->setState('firstName', $record->patName);
            $this->setState('lastName', $record->patFamName);
            $this->setState('patient', $record);
            $this->errorCode=self::ERROR_NONE;
        }
        return !$this->errorCode;
    }

    public function getId()
    {
        return $this->patID;
    }
}