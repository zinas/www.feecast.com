<?php
class Enviroment {
    const DEV = 0;
    const STAGING = 1;
    const LIVE = 2;

    // SET YOUR ENVIROMENT HERE
    const CURRENT = 0;

    public static function yiiDebug() {
        if (Enviroment::CURRENT === Enviroment::DEV)
            return true;
        else
            return false;
    }

    public static function yiiTraceLevel() {
        switch (Enviroment::CURRENT) {
            case Enviroment::DEV:
                return 3;
            case Enviroment::STAGING:
                return 3;
            case Enviroment::LIVE:
                return 0;

            default:
                return 0;
        }
    }

    public static function isDev() {
        return Enviroment::CURRENT === Enviroment::DEV;
    }
}
?>