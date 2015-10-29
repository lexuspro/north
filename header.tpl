<!doctype html>
<!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="ru"> <![endif]-->
<!--[if IE 7]>    <html class="no-js ie7 oldie" lang="ru"> <![endif]-->
<!--[if IE 8]>    <html class="no-js ie8 oldie" lang="ru"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="ru"> <!--<![endif]-->

<head>
	{hook run='html_head_begin'}

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>{$sHtmlTitle}</title>

	<meta name="description" content="{$sHtmlDescription}">
	<meta name="keywords" content="{$sHtmlKeywords}">

	{if $oTopic}
		<meta property="og:title" content="{$oTopic->getTitle()|escape:'html'}"/>
		<meta property="og:url" content="{$oTopic->getUrl()}"/>
		{if $oTopic->getPreviewImageWebPath()}
			<meta property="og:image" content="{$oTopic->getPreviewImageWebPath({cfg name='meta.thumbnail.img_size'})}"/>
		{/if}
		<meta property="og:description" content="{$sHtmlDescription}"/>
		<meta property="og:site_name" content="{cfg name='view.name'}"/>
		<meta property="og:type" content="article"/>
		<meta name="twitter:card" content="{cfg name='meta.twitter.card_type'}">
		<meta name="twitter:domain" content="{cfg name="path.root.web"}">
	{/if}

	{$aHtmlHeadFiles.css}

	<link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700&subset=latin,cyrillic' rel='stylesheet' type='text/css'>

	<link href="{cfg name='path.static.skin'}/images/favicon.ico?v1" rel="shortcut icon" />
	<link rel="search" type="application/opensearchdescription+xml" href="{router page='search'}opensearch/" title="{cfg name='view.name'}" />

	{if $aHtmlRssAlternate}
		<link rel="alternate" type="application/rss+xml" href="{$aHtmlRssAlternate.url}" title="{$aHtmlRssAlternate.title}">
	{/if}

	{if $sHtmlCanonical}
		<link rel="canonical" href="{$sHtmlCanonical}" />
	{/if}

	{if $bRefreshToHome}
		<meta  HTTP-EQUIV="Refresh" CONTENT="3; URL={cfg name='path.root.web'}/">
	{/if}

	<script type="text/javascript">
		var DIR_WEB_ROOT 			= '{cfg name="path.root.web"}';
		var DIR_STATIC_SKIN 		= '{cfg name="path.static.skin"}';
		var DIR_ROOT_ENGINE_LIB 	= '{cfg name="path.root.engine_lib"}';
		var LIVESTREET_SECURITY_KEY = '{$LIVESTREET_SECURITY_KEY}';
		var SESSION_ID				= '{$_sPhpSessionId}';
		var BLOG_USE_TINYMCE		= '{cfg name="view.tinymce"}';

		var TINYMCE_LANG = 'en';
		{if $oConfig->GetValue('lang.current') == 'russian'}
			TINYMCE_LANG = 'ru';
		{/if}

		var aRouter = new Array();
		{foreach from=$aRouter key=sPage item=sPath}
			aRouter['{$sPage}'] = '{$sPath}';
		{/foreach}
	</script>

	{$aHtmlHeadFiles.js}

	<script type="text/javascript">
		var tinyMCE = false;
		ls.lang.load({json var = $aLangJs});
		ls.registry.set('comment_max_tree',{json var=$oConfig->Get('module.comment.max_tree')});
		ls.registry.set('block_stream_show_tip',{json var=$oConfig->Get('block.stream.show_tip')});
	</script>

	{hook run='html_head_end'}

	<!--[if lt IE 9]>
		<script src="{cfg name="path.static.skin"}/js/html5shiv.js"></script>
		<script src="{cfg name="path.static.skin"}/js/respond.min.js"></script>
	<![endif]-->

	<!--[if IE 7]>
		<link rel="stylesheet" href="{cfg name="path.static.skin"}/themes/default/icons/css/fontello-ie7.css">
	<![endif]-->

	<script>
		function toggleCodes(on) {
			var obj = document.getElementById('icons');
			if (on) {
				obj.className += ' codesOn';
			} else {
				obj.className = obj.className.replace(' codesOn', '');
			}
		}
	</script>
</head>


{if $oUserCurrent}
	{assign var=body_classes value=$body_classes|cat:' ls-user-role-user'}

	{if $oUserCurrent->isAdministrator()}
		{assign var=body_classes value=$body_classes|cat:' ls-user-role-admin'}
	{/if}
{else}
	{assign var=body_classes value=$body_classes|cat:' ls-user-role-guest'}
{/if}

{if !$oUserCurrent or ($oUserCurrent and !$oUserCurrent->isAdministrator())}
	{assign var=body_classes value=$body_classes|cat:' ls-user-role-not-admin'}
{/if}

{add_block group='toolbar' name='toolbar_admin.tpl' priority=100}
{add_block group='toolbar' name='toolbar_scrollup.tpl' priority=-100}


<body class="{$body_classes}">
	{hook run='body_begin'}

	{if $oUserCurrent}
		{include file='window_write.tpl'}
		{include file='window_favourite_form_tags.tpl'}
	{else}
		{include file='window_login.tpl'}
	{/if}

	<div id="page-wrapper">
		{include file='header_top.tpl'}

		{hook run='content_top'}

		<section id="wrapper" class="{hook run='wrapper_class'}">
			<div id="container" class="container {hook run='container_class'}">
				<div class="row">
					{if !$noSidebar && $sidebarPosition == 'left'}
						{include file='sidebar.tpl'}
					{/if}

					<div id="content-wrapper" role="main"
						class="{if $noSidebar}col-md-12{else}col-md-8{/if} content{if $sidebarPosition == 'left'} content-right{/if}"
						{if $sMenuItemSelect=='profile'}itemscope itemtype="http://data-vocabulary.org/Person"{/if}>

						{include file='nav_content.tpl'}
						{include file='system_message.tpl'}

						{hook run='content_begin'}
