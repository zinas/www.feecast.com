<?php
/**
 * Runs the less compiler.
 *
 * Example call: yiic.bat compileLess
 */
class CompileLessCommand extends ConsoleCommand {
    public function run($args) {
        Yii::app()->less->compile();
    }
}
?>