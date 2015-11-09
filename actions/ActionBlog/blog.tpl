{include file='header.tpl'}
{assign var="oUserOwner" value=$oBlog->getOwner()}
{assign var="oVote" value=$oBlog->getVote()}


{if $oUserCurrent and $oUserCurrent->isAdministrator()}
	<div class="modal fade in modal-login" id="blog_delete_form">
		<div class="modal-dialog">
			<div class="modal-content">

				<header class="modal-header">
					<button type="button" class="close jqmClose" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">{$aLang.blog_admin_delete_title}</h4>
				</header>

				<div class="modal-body">
					<form action="{router page='blog'}delete/{$oBlog->getId()}/" method="POST">
						<div class="form-group">
							<label for="topic_move_to">{$aLang.blog_admin_delete_move}</label>
							<select name="topic_move_to" id="topic_move_to" class="form-control">
								<option value="-1">{$aLang.blog_delete_clear}</option>
								{if $aBlogs}
									<optgroup label="{$aLang.blogs}">
										{foreach from=$aBlogs item=oBlogDelete}
											<option value="{$oBlogDelete->getId()}">{$oBlogDelete->getTitle()|escape:'html'}</option>
										{/foreach}
									</optgroup>
								{/if}
							</select>
						</div>

						<input type="hidden" value="{$LIVESTREET_SECURITY_KEY}" name="security_ls_key" />
						<button type="submit" class="btn btn-success">{$aLang.blog_delete}</button>
					</form>
				</div>

			</div>
		</div>
	</div>
{/if}


{hook run='blog_info' oBlog=$oBlog}


<ul class="nav nav-pills nav-filter-wrapper">
	<li {if $sMenuSubItemSelect=='good'}class="active"{/if}><a href="{$sMenuSubBlogUrl}">{$aLang.blog_menu_collective_good}</a></li>
	<li {if $sMenuSubItemSelect=='new'}class="active"{/if}>
		{if $iCountTopicsBlogNew>0}
			<a href="{$sMenuSubBlogUrl}new/">{$aLang.blog_menu_collective_new} +{$iCountTopicsBlogNew}</a>
		{else}
			<a href="{$sMenuSubBlogUrl}newall/">{$aLang.blog_menu_collective_new}</a>
		{/if}
	</li>
	<li {if $sMenuSubItemSelect=='discussed'}class="active"{/if}><a href="{$sMenuSubBlogUrl}discussed/">{$aLang.blog_menu_collective_discussed}</a></li>
	<li {if $sMenuSubItemSelect=='top'}class="active"{/if}><a href="{$sMenuSubBlogUrl}top/">{$aLang.blog_menu_collective_top}</a></li>
	{hook run='menu_blog_blog_item'}

	{if $sPeriodSelectCurrent}
		<li class="pull-right active dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				{if $sPeriodSelectCurrent=='1'}
					{$aLang.blog_menu_top_period_24h}
				{elseif $sPeriodSelectCurrent=='7'}
					{$aLang.blog_menu_top_period_7d}
				{elseif $sPeriodSelectCurrent=='30'}
					{$aLang.blog_menu_top_period_30d}
				{elseif $sPeriodSelectCurrent=='all'}
					{$aLang.blog_menu_top_period_all}
				{/if}

				<b class="caret"></b>
			</a>
			<ul class="dropdown-menu">
				<li {if $sPeriodSelectCurrent=='1'}class="active"{/if}><a href="{$sPeriodSelectRoot}?period=1">{$aLang.blog_menu_top_period_24h}</a></li>
				<li {if $sPeriodSelectCurrent=='7'}class="active"{/if}><a href="{$sPeriodSelectRoot}?period=7">{$aLang.blog_menu_top_period_7d}</a></li>
				<li {if $sPeriodSelectCurrent=='30'}class="active"{/if}><a href="{$sPeriodSelectRoot}?period=30">{$aLang.blog_menu_top_period_30d}</a></li>
				<li {if $sPeriodSelectCurrent=='all'}class="active"{/if}><a href="{$sPeriodSelectRoot}?period=all">{$aLang.blog_menu_top_period_all}</a></li>
			</ul>
		</li>
	{/if}
</ul>


{if $bCloseBlog}
	<div class="alert alert-danger">
		{$aLang.blog_close_show}
	</div>
{else}
	{include file='topic_list.tpl'}
{/if}


{include file='footer.tpl'}
