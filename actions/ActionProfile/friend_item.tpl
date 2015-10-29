{if $oUserFriend and ($oUserFriend->getFriendStatus()==$USER_FRIEND_ACCEPT+$USER_FRIEND_OFFER or $oUserFriend->getFriendStatus()==$USER_FRIEND_ACCEPT+$USER_FRIEND_ACCEPT)}
	<li id="delete_friend_item"><a href="#"  title="{$aLang.user_friend_del}" onclick="return ls.user.removeFriend(this,{$oUserProfile->getId()},'del');">{$aLang.user_friend_del}</a></li>
{elseif $oUserFriend and $oUserFriend->getStatusTo()==$USER_FRIEND_REJECT and $oUserFriend->getStatusFrom()==$USER_FRIEND_OFFER and $oUserFriend->getUserTo()==$oUserCurrent->getId()}
	<li id="add_friend_item"><a href="#"  title="{$aLang.user_friend_add}" onclick="return ls.user.addFriend(this,{$oUserProfile->getId()},'accept');">{$aLang.user_friend_add}</a></li>
{elseif $oUserFriend and $oUserFriend->getFriendStatus()==$USER_FRIEND_OFFER+$USER_FRIEND_REJECT and $oUserFriend->getUserTo()!=$oUserCurrent->getId()}
	<li>{$aLang.user_friend_offer_reject}</li>							
{elseif $oUserFriend and $oUserFriend->getFriendStatus()==$USER_FRIEND_OFFER+$USER_FRIEND_NULL and $oUserFriend->getUserFrom()==$oUserCurrent->getId()}
	<li>{$aLang.user_friend_offer_send}</li>						
{elseif $oUserFriend and $oUserFriend->getFriendStatus()==$USER_FRIEND_OFFER+$USER_FRIEND_NULL and $oUserFriend->getUserTo()==$oUserCurrent->getId()}
	<li id="add_friend_item"><a href="#"  title="{$aLang.user_friend_add}" onclick="return ls.user.addFriend(this,{$oUserProfile->getId()},'accept');">{$aLang.user_friend_add}</a></li>
{elseif !$oUserFriend}

	<div class="modal fade in modal-login" id="add_friend_form">
		<div class="modal-dialog">
			<div class="modal-content">
			
				<header class="modal-header">
					<button type="button" class="close jqmClose" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">{$aLang.profile_add_friend}</h4>
				</header>

				<div class="modal-body">
					<form onsubmit="return ls.user.addFriend(this,{$oUserProfile->getId()},'add');">
						<div class="form-group">
							<label for="add_friend_text">{$aLang.user_friend_add_text_label}</label>
							<textarea id="add_friend_text" rows="3" class="form-control"></textarea>
						</div>

						<button type="submit" class="btn btn-success">{$aLang.user_friend_add_submit}</button>
					</form>
				</div>
			
			</div>
		</div>
	</div>
	
	<li id="add_friend_item"><a href="#" title="{$aLang.user_friend_add}" id="add_friend_show">{$aLang.user_friend_add}</a></li>
{else}
	<li id="add_friend_item"><a href="#" title="{$aLang.user_friend_add}" onclick="return ls.user.addFriend(this,{$oUserProfile->getId()},'link');">{$aLang.user_friend_add}</a></li>
{/if}
