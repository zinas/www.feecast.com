<?php
class SearchState extends CApplicationComponent {
    private $_terms = array();
    private $_termKeys = array('search-need', 'search-provider', 'search-location');

    public function init() {
        $this->_terms = isset(Yii::app()->session['terms'])?Yii::app()->session['terms']:array();
        if (Yii::app()->request->getPost('search-need')) {
            Yii::app()->session['terms'] = $this->_buildTermsFromPost();
            $this->_terms = Yii::app()->session['terms'];

        }

        parent::init();
    }

    public function getTerm($key) {
        return isset($this->_terms[$key])?$this->_terms[$key]:null;
    }

    public function getTerms() {
        return $this->_terms;
    }

    private function _buildTermsFromPost($overwrite = true) {
        $terms = $this->_terms;
        foreach ($this->_termKeys as $key) {
            if ($overwrite || !isset($terms[$key])) {
                $terms[$key] = Yii::app()->request->getPost($key);
            }
        }

        return $terms;
    }
}