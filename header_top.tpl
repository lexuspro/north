<header id="header" role="banner">
	{hook run='header_banner_begin'}

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".header-navbar-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>

				<a class="navbar-brand" href="{cfg name='path.root.web'}">{if {cfg name='view.config_sitename'} == true}{cfg name='view.name'}{else}{cfg name='view.own_sitename'}{/if}</a>
			</div>

			{hook run='userbar_nav'}

			<div class="collapse navbar-collapse header-navbar-collapse">
				<ul class="nav navbar-nav">
					<li {if $sMenuHeadItemSelect=='blog'}class="active"{/if}><a href="{cfg name='path.root.web'}">{$aLang.topic_title}</a></li>
					<li {if $sMenuHeadItemSelect=='blogs'}class="active"{/if}><a href="{router page='blogs'}">{$aLang.blogs}</a></li>
					<li {if $sMenuHeadItemSelect=='people'}class="active"{/if}><a href="{router page='people'}">{$aLang.people}</a></li>
					<li {if $sMenuHeadItemSelect=='stream'}class="active"{/if}><a href="{router page='stream'}">{$aLang.stream_menu}</a></li>
					{hook run='main_menu_item'}
				</ul>

				{hook run='main_menu'}

				<ul class="nav navbar-nav navbar-right">
					{if $oUserCurrent}
						<li><a href="{router page='topic'}add/" class="btn-write" id="modal_write_show" title="{$aLang.block_create}"><span class="glyphicon glyphicon-pencil"></span></a></li>
						{if $iUserCurrentCountTalkNew}
							<li>
								<a href="{router page='talk'}" class="new-messages" title="{if $iUserCurrentCountTalkNew}{$aLang.user_privat_messages_new}{/if}">
									{$iUserCurrentCountTalkNew} <span class="glyphicon glyphicon-envelope"></span>
								</a>
							</li>
						{/if}
						<li class="dropdown nav-userbar-username">
							<a data-toggle="dropdown" data-target="#" href="{$oUserCurrent->getUserWebPath()}" class="dropdown-toggle username">
								<img src="{$oUserCurrent->getProfileAvatarPath(24)}" alt="{$oUserCurrent->getLogin()}" class="avatar" />
								{$oUserCurrent->getLogin()}
								<b class="caret"></b>
							</a>
							<ul class="dropdown-menu">
								<li><a href="{$oUserCurrent->getUserWebPath()}">{$aLang.user_menu_profile}</a></li>
								<li><a href="{router page='talk'}" id="new_messages" title="{if $iUserCurrentCountTalkNew}{$aLang.user_privat_messages_new}{/if}">{$aLang.user_privat_messages}{if $iUserCurrentCountTalkNew} <span class="messages-count">+{$iUserCurrentCountTalkNew}</span>{/if}</a></li>
								<li><a href="{$oUserCurrent->getUserWebPath()}wall/">{$aLang.user_menu_profile_wall}</a></li>
								<li><a href="{$oUserCurrent->getUserWebPath()}created/topics/">{$aLang.user_menu_publication}</a></li>
								<li><a href="{$oUserCurrent->getUserWebPath()}favourites/topics/">{$aLang.user_menu_profile_favourites}</a></li>
								<li><a href="{router page='settings'}profile/">{$aLang.user_settings}</a></li>
								{hook run='userbar_item'}
								<li><a href="{router page='login'}exit/?security_ls_key={$LIVESTREET_SECURITY_KEY}">{$aLang.exit}</a></li>
							</ul>
						</li>
					{else}
						{hook run='userbar_item'}
						<li><a href="{router page='login'}" class="js-login-form-show" rel="nofollow">{$aLang.user_login_submit}</a></li>
						<li class="hidden-sm"><a href="{router page='registration'}" class="js-registration-form-show" rel="nofollow">{$aLang.registration_submit}</a></li>
					{/if}
				</ul>
			</div>
		</div>
	</nav>

	{if $jumbotron}
		{include file="jumbotron.$jumbotron.tpl"}
	{/if}

	{hook run='header_banner_end'}
</header>
