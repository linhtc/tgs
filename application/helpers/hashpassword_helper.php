<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of hashpassword_helper
 *
 * @author CPU10890-local
 */
class hashpassword {

    /**
     * 
     * @param type $password
     * @return type
     */
    public function hash($password) {
        $hash_string = "Mobistar-CMS";
        // $hash_string = "P3N9u!nFW";
        //return md5($password);
        return md5(md5($password) . md5($hash_string));
    }

    /**
     * 
     * @param type $password
     * @param type $password_type
     * @return boolean
     */
    public function checkPassword($password, $password_type = null) {
        if (!$password_type) {
            return FALSE;
        }

        $password_hash = $this->hash($password_type);
//        echo $this->hash('conglinh'); exit;
//        echo $password_hash; echo '<br >'; echo $password; exit;
        if ($password_hash == $password) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

}
