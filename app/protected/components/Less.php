<?php
class Less extends CApplicationComponent {
    public $files;
    public $createMapFiles;
    public $source;
    public $destination;

    public function compile() {
        foreach ($this->files as $file) {
            $this->__deleteCompiled($file);
            $cmd = $this->__buildBashCommand($file)."\n\n\n";
            exec($cmd);
        }
    }

    private function __deleteCompiled($file) {
        $root = Yii::getPathOfAlias('root') . DS;
        $dest = $this->destination . DS;

        // in case of subfolders, the destination filename is the last part of the path
        $destFile = explode(DS,$file);
        $destFile = $destFile[count($destFile)-1];

        FileSystem::delete("$root$dest$destFile.css");
        FileSystem::delete("$root$dest$destFile.css.map");
    }

    private function __buildBashCommand($file) {
        $root = Yii::getPathOfAlias('root') . DS;
        $src = $this->source . DS;
        $dest = $this->destination . DS;

        // in case of subfolders, the destination filename is the last part of the path
        $destFile = explode(DS,$file);
        $destFile = $destFile[count($destFile)-1];

        $cmd = "lessc $root$src$file.less > $root$dest$destFile.css";

        if ($this->createMapFiles === true) {
            $cmd .= " --source-map=$root$dest$destFile.css.map --source-map-basepath=$root$dest";
        }

        return $cmd;
    }
}

// Example of shell command, compiling less and building map files (use for reference)
// lessc less\bootstrap\bootstrap.less > css\bootstrap.css --source-map=css\bootstrap.css.map --source-map-basepath=css
?>