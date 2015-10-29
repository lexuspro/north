{include file='header.tpl'}

<div class="page-header">
	<h1>{$aLang.blog_user_readers_all} ({$iCountBlogUsers}): <a href="{$oBlog->getUrlFull()}">{$oBlog->getTitle()|escape:'html'}</a></h1>
</div>
	
{if $aBlogUsers}
	{assign var="aUsersList" value=[]}
	{foreach from=$aBlogUsers item=oBlogUser}
		{$aUsersList[]=$oBlogUser->getUser()}
	{/foreach}
	{include file='user_list.tpl' aUsersList=$aUsersList bUsersUseOrder=true sUsersRootPage=$sUsersRootPage}
{else}
	{$aLang.blog_user_readers_empty}
{/if}


{include file='footer.tpl'}
