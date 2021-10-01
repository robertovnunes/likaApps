<?php
/**
 * The Sidebar containing the main widget areas.
 *
 * @package Tidy
 */
 
global $tidy_side;
?>
	<div id="secondary" class="widget-area <?php echo esc_attr( $tidy_side ); ?>" role="complementary">
		<?php do_action( 'tidy_before_secondary' ); ?>
		<?php if ( ! dynamic_sidebar( 'sidebar-1' ) ) : ?>

			<aside id="search" class="widget widget_search">
				<?php get_search_form(); ?>
			</aside>

			<aside id="archives" class="widget">
				<h1 class="widget-title"><?php _e( 'Category', 'tidy' ); ?></h1>
				<ul>
					<?php wp_list_categories( 'title_li=' ); ?>
				</ul>
			</aside>

			<aside id="archives" class="widget">
				<?php the_widget( 'Tidy_Widget_Recent_Posts' ); ?>
			</aside>

			<aside id="meta" class="widget">
				<h1 class="widget-title"><?php _e( 'Meta', 'tidy' ); ?></h1>
				<ul>
					<?php wp_register(); ?>
					<li><?php wp_loginout(); ?></li>
					<?php wp_meta(); ?>
				</ul>
			</aside>

		<?php endif; // end sidebar widget area ?>
		<?php do_action( 'tidy_after_secondary' ); ?>
	</div><!-- #secondary -->
