<?php
class FileSystem extends CFileHelper {
    public static function delete($path) {
        if (is_file($path))
            return unlink($path);

        return false;
    }
}
?>