{include file='header.tpl' menu='blog'}


{include file='topic_list.tpl'}

{if count($aTopics)}
    {if !$bDisableGetMoreButton}
        <div id="userfeed_loaded_topics"></div>
        <input type="hidden" id="userfeed_last_id" value="{$iUserfeedLastId}" />
        <a class="btn btn-success btn-lg btn-block" id="userfeed_get_more" href="javascript:ls.userfeed.getMore()">{$aLang.userfeed_get_more} &darr;</a>
    {/if}
{/if}


{include file='footer.tpl'}
