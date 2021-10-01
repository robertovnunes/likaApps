<?php
/**
 * The Header for our theme.
 *
 * Displays all of the <head> section and everything up till <div id="content">
 *
 * @package Tidy
 */
?><!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
<meta charset="<?php bloginfo( 'charset' ); ?>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php wp_title( '|', true, 'right' ); ?></title>
<link rel="profile" href="http://gmpg.org/xfn/11">
<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">

<?php wp_head(); ?>
</head>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-55649904-1', 'auto');
  ga('send', 'pageview');

</script>
<body <?php body_class(); ?>>
<?php do_action( 'tidy_before_body' ); ?>
<div id="page" class="hfeed site">

	<header id="masthead" class="site-header" role="banner">

		<?php do_action( 'tidy_before_header' ); ?>

		<?php
		$tidy_header_text = get_theme_mod( 'header_text', '' );

		$tidy_site_header_widget_toggle = get_theme_mod( 'header_text_toggle', 0 );

		if ( $tidy_site_header_widget_toggle > 0 ) :
		?>
		<div class="site-header-widget-toggle">
			<div id="site-header-widget" class="site-header-widget-area"><div class="inner">
				<div class="site-header-widget-area-content"><?php echo wpautop( $tidy_header_text ); ?></div>
			</div></div>
			<div class="header-widget-toggle"><div class="inner"><span class="header-widget-toggle-btn"><span class="genericon"></span></span></div></div>
		</div>
		<?php endif; ?>

		<?php $tidy_view_sns_header = tidy_of_get_option('sns-location-header', 1); ?>
		<?php if ( $tidy_view_sns_header > 0 ) : ?>
		<div id="site-header-social" class="site-header-social-area"><div class="inner">
			<h1 class="sns-toggle"><?php _e( 'Social', 'tidy' ); ?><span class="genericon genericon-downarrow"></span></h1>
			<?php tidy_sns_lists(); ?>
		</div></div>
		<?php endif; ?>

		<div class="site-header-main"><div class="inner">
	
			<div class="site-branding">
				<?php
					$tidy_view_header_logo = get_theme_mod( 'logo_toggle', 0 );
					$tidy_header_logo_img  = ( $tidy_view_header_logo > 0 ) ? get_theme_mod( 'logo_image', '' ) : '' ;
					$tidy_logo_image = ( !empty( $tidy_header_logo_img ) ) ? '<img src="' . esc_url( $tidy_header_logo_img ) . '" alt="' . esc_attr( get_bloginfo( 'name', 'display' ) ) . '">' : esc_html( get_bloginfo( 'name', 'display' ) );
				?>
				<h1 class="site-title"><a href="<?php echo esc_url( home_url( '/' ) ); ?>" rel="home"><?php echo $tidy_logo_image ?></a></h1>
				<h2 class="site-description"><?php bloginfo( 'description' ); ?></h2>
			</div>
	
			<nav id="site-navigation" class="main-navigation" role="navigation">
				<h1 class="menu-toggle"><span class="screen-reader-text"><?php _e( 'Menu', 'tidy' ); ?></span><span class="genericon genericon-menu"></span></h1>
				<a class="skip-link screen-reader-text" href="#content"><?php _e( 'Skip to content', 'tidy' ); ?></a>
				<div class="main-navigation-box">
					<?php wp_nav_menu( array( 'theme_location' => 'primary' ) ); ?>
				</div>
			</nav><!-- #site-navigation -->
	
			<div id="search-container" class="search-container">
				<h1 class="search-toggle"><span class="screen-reader-text"><?php _e( 'Search', 'tidy' ); ?></span><span class="icon-search"></span></h1>
	
				<div class="search-box"><?php get_search_form(); ?></div>
			</div>

		</div></div>

		<?php do_action( 'tidy_after_header' ); ?>
	</header><!-- #masthead -->

	<?php do_action( 'tidy_before_content' ); ?>

	<div id="content" class="site-content">
