{assign var="noSidebar" value=true}
{include file='header_light.tpl'}

<script type="text/javascript">
	jQuery(document).ready(function($){
		$('#login-form').bind('submit',function(){
			ls.user.login('login-form');
			return false;
		});
		$('#login-form-submit').attr('disabled',false);
	});
</script>


<div class="text-center page-header">
	<h3>{$aLang.user_authorization}</h3>
</div>

{hook run='login_begin'}

<form action="{router page='login'}" method="POST" id="login-form">
	{hook run='form_login_begin'}
	
	<div class="form-group">
		<label for="login">{$aLang.user_login}</label>
		<input type="text" id="login" name="login" class="form-control" />
	</div>
	
	<div class="form-group">
		<label for="password">{$aLang.user_password}</label>
		<input type="password" id="password" name="password" class="form-control" />
		<p class="help-block"><small class="text-danger validate-error-hide validate-error-login"></small></p>
	</div>
	
	<div class="checkbox">
		<label><input type="checkbox" name="remember" checked class="input-checkbox" />{$aLang.user_login_remember}</label>
	</div>
			
	{hook run='form_login_end'}
			
	<button type="submit" name="submit_login" class="btn btn-success" id="login-form-submit" disabled="disabled">{$aLang.user_login_submit}</button>
	
	<br />
	<br />
	<a href="{router page='registration'}">{$aLang.user_registration}</a><br />
	<a href="{router page='login'}reminder/">{$aLang.user_password_reminder}</a>
</form>


{if $oConfig->GetValue('general.reg.invite')}
	<br />
	<form action="{router page='registration'}invite/" method="POST">
		<div class="text-center page-header">
			<h3>{$aLang.registration_invite}</h3>
		</div>
	
		<div class="form-group">
			<label>{$aLang.registration_invite_code}</label>
			<input type="text" name="invite_code" class="form-control" />
		</div>
	
		<input type="submit" name="submit_invite" value="{$aLang.registration_invite_check}" class="btn btn-success" />
	</form>
{/if}

{hook run='login_end'}


{include file='footer_light.tpl'}
