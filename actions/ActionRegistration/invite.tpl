{assign var="noSidebar" value=true}
{include file='header_light.tpl'}

<div class="text-center page-header">
	<h3>{$aLang.registration_invite}</h3>
</div>

{include file='system_message.tpl'}

<form action="{router page='registration'}invite/" method="POST">
	<div class="form-group">
		<label>{$aLang.registration_invite_code}</label>
		<input type="text" name="invite_code" class="form-control" />
	</div>
	
	<input type="submit" name="submit_invite" value="{$aLang.registration_invite_check}" class="btn btn-success" />
</form>

{include file='footer_light.tpl'}
