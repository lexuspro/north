{if !$noShowSystemMessage}
	{if $aMsgError}
		<div class="alert alert-danger">
			<ul class="list-unstyled">
				{foreach from=$aMsgError item=aMsg}
					<li>
						{if $aMsg.title!=''}
							<strong>{$aMsg.title}</strong>:
						{/if}
						{$aMsg.msg}
					</li>
				{/foreach}
			</ul>
		</div>
	{/if}


	{if $aMsgNotice}
		<div class="alert alert-success">
			<ul class="list-unstyled">
				{foreach from=$aMsgNotice item=aMsg}
					<li>
						{if $aMsg.title!=''}
							<strong>{$aMsg.title}</strong>:
						{/if}
						{$aMsg.msg}
					</li>
				{/foreach}
			</ul>
		</div>
	{/if}
{/if}
