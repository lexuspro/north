{include file='header.tpl'}
{include file='menu.talk.tpl'}


<section class="panel panel-default block block-type-blacklist">
	<div class="panel-body">
	
		<div class="block-content">
			<form onsubmit="return ls.talk.addToBlackList();">
				<div class="form-group">
					<label for="talk_blacklist_add">{$aLang.talk_blacklist_title}</label>
					<input type="text" id="talk_blacklist_add" name="add" class="form-control autocomplete-users-sep" />
				</div>
			</form>

			<div id="black_list_block">
				{if $aUsersBlacklist}
					<ul class="list-unstyled" id="black_list">
						{foreach from=$aUsersBlacklist item=oUser}
							<li id="blacklist_item_{$oUser->getId()}_area"><a href="{$oUser->getUserWebPath()}" class="user">{$oUser->getLogin()}</a> - <a href="#" id="blacklist_item_{$oUser->getId()}" class="delete">{$aLang.blog_delete}</a></li>
						{/foreach}
					</ul>
				{/if}
			</div>
		</div>
	
	</div>
</section>


{include file='footer.tpl'}
