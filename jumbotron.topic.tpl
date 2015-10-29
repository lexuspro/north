{assign var="oBlog" value=$oTopic->getBlog()}

<div class="jumbotron jumbotron-topic" style="background-image: url({$oTopic->getPreviewImageWebPath({cfg name='topic.preview.img_size'})})">
	<div class="container">
		<div class="jumbotron-inner">
			<div class="row">
				<div class="col-md-8">
					<header class="topic-header">
						<ul class="list-unstyled list-inline topic-info">
							<li>
								<a href="{$oBlog->getUrlFull()}" class="topic-blog">{$oBlog->getTitle()|escape:'html'}</a>
							</li>
							<li>
								<time datetime="{date_format date=$oTopic->getDateAdd() format='c'}" title="{date_format date=$oTopic->getDateAdd() format='j F Y, H:i'}">
									{date_format date=$oTopic->getDateAdd() hours_back="12" minutes_back="60" now="60" day="day H:i" format="j F Y, H:i"}
								</time>
							</li>
							{if $oUserCurrent and ($oUserCurrent->getId()==$oTopic->getUserId() or $oUserCurrent->isAdministrator() or $oBlog->getUserIsAdministrator() or $oBlog->getUserIsModerator() or $oBlog->getOwnerId()==$oUserCurrent->getId())}
								<li><a href="{cfg name='path.root.web'}/{$oTopic->getType()}/edit/{$oTopic->getId()}/" title="{$aLang.topic_edit}" class="actions-edit">{$aLang.topic_edit}</a></li>
								{if $oUserCurrent->isAdministrator() or $oBlog->getUserIsAdministrator() or $oBlog->getOwnerId()==$oUserCurrent->getId()}
									<li><a href="{router page='topic'}delete/{$oTopic->getId()}/?security_ls_key={$LIVESTREET_SECURITY_KEY}" title="{$aLang.topic_delete}" onclick="return confirm('{$aLang.topic_delete_confirm}');" class="actions-delete">{$aLang.topic_delete}</a></li>
								{/if}
							{/if}
						</ul>

						<h1 class="topic-title">
							{$oTopic->getTitle()|escape:'html'}
							{if $oTopic->getPublish() == 0}
								<span class="glyphicon glyphicon-file text-muted" title="{$aLang.topic_unpublish}"></span>
							{/if}
						</h1>
					</header>
				</div>
			</div>
		</div>
	</div>
</div>
