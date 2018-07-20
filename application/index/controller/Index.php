<?php
namespace app\index\controller;
use think\cache\driver\Redis;

class Index {
	public function index() {
		return '7878878';
	}
	public function phpinfo() {
		return phpinfo();
	}
	public function hello($name = 'ThinkPHP5') {
		return 'hello,' . $name;
	}
	public function redis_test() {
		// 使用Redis缓存
		$redis = new Redis();
		// $redis->set('test', 'hello redis');
		echo $redis->get('test');
		// Cache::store('redis')->set('name', 'value', 3600);
		// return Cache::get('name');
	}

}
