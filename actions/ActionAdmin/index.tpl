{include file='header.tpl'}

<div class="page-header">
	<h1>{$aLang.admin_header}</h1>
</div>

<ul class="list-unstyled">
    <li><a href="{router page="admin"}plugins/">{$aLang.admin_list_plugins}</a></li>
    <li><a href="{router page="admin"}userfields/">{$aLang.admin_list_userfields}</a></li>
    <li><a href="{router page="admin"}restorecomment/?security_ls_key={$LIVESTREET_SECURITY_KEY}">{$aLang.admin_list_restorecomment}</a></li>
    <li><a href="{router page="admin"}recalcfavourite/?security_ls_key={$LIVESTREET_SECURITY_KEY}">{$aLang.admin_list_recalcfavourite}</a></li>
    <li><a href="{router page="admin"}recalcvote/?security_ls_key={$LIVESTREET_SECURITY_KEY}">{$aLang.admin_list_recalcvote}</a></li>
    <li><a href="{router page="admin"}recalctopic/?security_ls_key={$LIVESTREET_SECURITY_KEY}">{$aLang.admin_list_recalctopic}</a></li>
    {hook run='admin_action_item'}
</ul>

{hook run='admin_action'}

{include file='footer.tpl'}
