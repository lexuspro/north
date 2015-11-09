<?php
$config = array();



/*---------- THEME ----------*/
$config['view']['theme'] = 'default'; // Выбор темы оформления.



/*---------- SITE NAME ----------*/
$config['view']['config_sitename'] = true; // Использовать имя сайта прописанное в конфиге сайта?
/* Если выставлено "false", ниже можно задать свое имя. */
$config['view']['own_sitename'] = 'Site Name'; // Свое имя сайта (удобно при необходимости вывода краткого имени).



/*---------- META ----------*/
$config['meta']['thumbnail']['img_size'] = '750crop'; // Размер превью для соцсетей (при использовании изображений без кропа пишем просто 750).
/* Если на сайте используется плагин «Main Preview», при расшаривании топиков в соцсети шаблон в качестве
 * изображения для соцсети забирает превью созданную плагином.
 * В данной настройке необходимо указать ширину превью указанную в настройках плагина «Main Preview».
 */
$config['meta']['twitter']['card_type'] = 'summary'; // Тип карточки Twitter.
/* Основные типы:
 * summary - простая карточка;
 * summary_large_image - карточка с большим изображением.
 * Все типы можно посмотреть на странице: https://dev.twitter.com/cards/types
 */



$config['module']['blog']['avatar_size'] = array(400,100,64,48,24,0); // Список размеров аватаров у блога. 0 - исходный размер

/**
 * Настройки вывода блоков
 */
$config['block']['rule_blog_description'] = array(
	'action'  => array(
			'blog' => array('{blog}')
		),
	'blocks'  => array(
			'right' => array('blocks/block.blogDescription.tpl'=>array('priority'=>300))
		),
	'clear' => false,
);



/*-------------------------------------------------------------------------------------------------------------------*/
$config['head']['default']['js'] = Config::Get('head.default.js');
$config['head']['default']['js'][] = '___path.static.skin___/js/template.js';
/* Bootstrap */
$config['head']['default']['js'][] = '___path.static.skin___/themes/___view.theme___/bootstrap/js/bootstrap.min.js';

$config['head']['default']['css'] = array(
	/* Bootstrap */
	"___path.static.skin___/themes/___view.theme___/bootstrap/css/bootstrap.min.css",
	/* Structure */
	"___path.static.skin___/css/base.css",
	"___path.root.engine_lib___/external/jquery/markitup/skins/synio/style.css",
	"___path.root.engine_lib___/external/jquery/markitup/sets/synio/style.css",
	"___path.root.engine_lib___/external/jquery/jcrop/jquery.Jcrop.css",
	"___path.root.engine_lib___/external/prettify/prettify.css",
	"___path.static.skin___/css/smoothness/jquery-ui.css",
	"___path.static.skin___/css/responsive.css",
	/* Theme */
	"___path.static.skin___/themes/___view.theme___/style.css",
	/* Theme Icons */
	"___path.static.skin___/themes/___view.theme___/icons/css/fontello.css",
);

return $config;
?>
