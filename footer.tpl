						{hook run='content_end'}
					</div> <!-- /content -->

					{if !$noSidebar && $sidebarPosition != 'left'}
						{include file='sidebar.tpl'}
					{/if}
				</div> <!-- /row -->
			</div> <!-- /container -->
		</section> <!-- /wrapper -->

		<footer id="footer">
			{include file='blocks.tpl' group='footer-top'}

			<div class="footer-center">
				<div class="container">
					<div class="row">
						<div class="col-md-12 col-lg-10 col-lg-offset-1 text-center project-info">
							{$aLang.footer_menu_project_info}
						</div>
					</div>

					<div class="row">
						<div class="col-md-12 col-lg-10 col-lg-offset-1 text-center project-links">
							<ul class="list-unstyled list-inline footer-list">
								<li><a href="#">{$aLang.footer_menu_project_about}</a></li>
								<li><a href="#">{$aLang.footer_menu_project_rules}</a></li>
								<li><a href="#">{$aLang.footer_menu_project_advert}</a></li>
								<li><a href="#">{$aLang.footer_menu_project_help}</a></li>
								{hook run='footer_menu_project_item'}
							</ul>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12 col-lg-10 col-lg-offset-1 text-center social-icons">
							<ul class="list-unstyled list-inline">
								<li><a href="#" rel="nofollow"><span class="icon-facebook"></span></a></li>
								<li><a href="#" rel="nofollow"><span class="icon-gplus"></span></a></li>
								<li><a href="#" rel="nofollow"><span class="icon-twitter"></span></a></li>
								<li><a href="#" rel="nofollow"><span class="icon-vkontakte"></span></a></li>
								<!-- <li><a href="#" rel="nofollow"><span class="icon-youtube-play"></span></a></li> -->
								<!-- <li><a href="#" rel="nofollow"><span class="icon-yandex"></span></a></li> -->
								<li><a href="#" rel="nofollow"><span class="icon-odnoklassniki"></span></a></li>
							</ul>
						</div>
					</div>

					{hook run='footer_end'}
				</div>
			</div>

			<div class="footer-bottom">
				<div class="container">
					{hook run='copyright'}.
					Design by <a href="http://kulesh-vladimir.by/">вOFFка</a>.
				</div>
			</div>
		</footer>

		{include file='toolbar.tpl'}

		{hook run='body_end'}
	</div> <!-- /page-wrapper -->
</body>
</html>
