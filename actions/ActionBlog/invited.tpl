<section class="panel panel-default block">
	<div class="panel-body">
		
		<header class="block-header">
			<h3>{$aLang.blog_admin_user_add_header}</h3>
		</header>
		
		<div class="block-content">
			<form onsubmit="return ls.blog.addInvite({$oBlogEdit->getId()});">
				<div class="form-group">
					<label for="blog_admin_user_add">{$aLang.blog_admin_user_add_label}</label>
					<input type="text" id="blog_admin_user_add" name="add" class="form-control autocomplete-users-sep" />
				</div>
			</form>
			
			<h5>{$aLang.blog_admin_user_invited}:</h5>
			
			<div id="invited_list_block">
				{if $aBlogUsersInvited}
					<ul id="invited_list" class="list-unstyled text-muted">
						{foreach from=$aBlogUsersInvited item=oBlogUser}
							{assign var='oUser' value=$oBlogUser->getUser()}
							
							<li id="blog-invite-remove-item-{$oBlogEdit->getId()}-{$oUser->getId()}">
								<a href="{$oUser->getUserWebPath()}" class="user">{$oUser->getLogin()}</a> - 
								<a href="#" onclick="return ls.blog.repeatInvite({$oUser->getId()}, {$oBlogEdit->getId()});" class="actions-edit">{$aLang.blog_user_invite_readd}</a> | 
								<a href="#" onclick="return ls.blog.removeInvite({$oUser->getId()}, {$oBlogEdit->getId()});" class="actions-delete">{$aLang.blog_user_invite_remove}</a>
							</li>						
						{/foreach}
					</ul>
				{/if}
				
				<span id="blog-invite-empty" class="small text-muted" {if $aBlogUsersInvited}style="display: none"{/if}>{$aLang.blog_admin_user_add_empty}</span>
			</div>
		</div>
		
	</div>
</section>
