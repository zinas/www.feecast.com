<?php
class _ {
    public static function parseCpt($string) {
        preg_match("/\((.*?)\)/", $string, $matches);
        return $matches[1];
    }

    public  static function currency($val) {
        return Yii::app()->numberFormatter->formatCurrency($val, 'USD');
    }
}