<?php
namespace app\admin\controller;
use think\Controller;

class Index extends Base {
	// 后台首页
	public function index() {
		return $this->fetch();
	}
	//后台欢迎页
	public function welcome() {
		$info = array(
			'web_server' => $_SERVER['SERVER_SOFTWARE'],
			'onload' => ini_get('upload_max_filesize'),
			'php_os' => PHP_OS,
			// 'think_v' => THINK_VERSION,
			'phpversion' => phpversion(),
		);
		$this->assign('info', $info);
		// 模板输出
		return $this->fetch();
	}
}
