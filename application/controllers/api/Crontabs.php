<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**
 *
 * @package Admin
 *
 *
 * @author Leon Tran <leon@agikigi.com>
 * @copyright (c) 2016, 500BITS
 * @link http://agikigi.com
 * @license MIT
 * @version beta.0.1
 */
class Crontabs extends MY_Controller {

    private $langModel;

    function __construct() {
        parent::__construct();
        $this->langModel = 'sys_languages';
    }

    /**
     * Cron job to update news
     * @request: {}
     * @response: {}
     **/
    public function languages($key = null){
        if($key != 'hello'){
            echo 'Hi there'; exit;
        }
        $response = new stdClass();
        $response->vi = 0;
        $response->en = 0;
        $list = $this->db->select('lang, vi, en, jp, cn')->from($this->langModel)->where('deleted', 0)->get()->result();
        if($list){
            $fileVi = '';
            $fileEn = '';
            $fileJp = '';
            $fileCn = '';
            foreach($list as $item){
                $fileVi .= (empty($fileVi) ? '<?php ' : '').'$lang[\''.$item->lang.'\'] = \''.$item->vi.'\';';
                $fileEn .= (empty($fileEn) ? '<?php ' : '').'$lang[\''.$item->lang.'\'] = \''.$item->en.'\';';
                $fileJp .= (empty($fileJp) ? '<?php ' : '').'$lang[\''.$item->lang.'\'] = \''.$item->jp.'\';';
                $fileCn .= (empty($fileCn) ? '<?php ' : '').'$lang[\''.$item->lang.'\'] = \''.$item->cn.'\';';
            }
            if(!empty($fileVi)){
                $response->vi = file_put_contents(APPPATH."language/vietnamese/aio_lang.php", $fileVi);
            }
            if(!empty($fileEn)){
                $response->en = file_put_contents(APPPATH."language/english/aio_lang.php", $fileEn);
            }
            if(!empty($fileJp)){
                $response->jp = file_put_contents(APPPATH."language/japanese/aio_lang.php", $fileJp);
            }
            if(!empty($fileCn)){
                $response->cn = file_put_contents(APPPATH."language/chinese/aio_lang.php", $fileCn);
            }
        }
        echo json_encode($response); exit;
    }

    /**
     * Dump database with out mysql dump
     * @request: {}
     * @response: {}
     **/
    public function dump(){
        exit;
        echo "Starting... <br />";
//        shell_exec("/usr/bin/php ".APPPATH."../third_party/mysql/dump/tests/canvas.php");

        error_reporting(E_ALL);

        include_once(dirname(__FILE__) . "/../../third_party/mysql/dump/src/Ifsnop/Mysqldump/Mysqldump.php");

        $dumpSettings = array(
            'exclude-tables' => array('/^travis*/'),
            'compress' => Ifsnop\Mysqldump\Mysqldump::NONE,
            'no-data' => false,
            'add-drop-table' => true,
            'single-transaction' => true,
            'lock-tables' => true,
            'add-locks' => true,
            'extended-insert' => false,
            'disable-keys' => true,
            'skip-triggers' => false,
            'add-drop-trigger' => true,
            'routines' => true,
            'databases' => false,
            'add-drop-database' => false,
            'hex-blob' => true,
            'no-create-info' => false,
            'where' => ''
        );
        $dumpSettings['databases'] = true;

        $dump = new Ifsnop\Mysqldump\Mysqldump(
            "mysql:host=localhost;dbname=vas_canvas",
            "vas-canvas",
            "3S3AJ128kemlyaeSe538",
            $dumpSettings);
        $dump->start("vas_canvas.sql");
        exit;

        exit;
    }

}