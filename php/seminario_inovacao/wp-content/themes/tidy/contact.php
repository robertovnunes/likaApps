<?php
/**
 * The template for contact pages.
 * Template Name: Contact
 *
 * @package Tidy
 */
$tidy_layout = tidy_of_get_option( 'cont_l', 'cont_c1' );
get_header(); ?>

	<div id="primary" class="content-area <?php echo esc_attr( $tidy_layout ); ?>">
		<?php do_action( 'tidy_before_primary' ); ?>
		
		<main id="main" class="site-main" role="main">

			<?php while ( have_posts() ) : the_post(); ?>

				<?php get_template_part( 'content', 'page' ); ?>

				<?php if ( tidy_of_get_option( 'cont_b_text' ) ) : ?>
					<div class="contact-area cont_b_text">
					<?php if ( tidy_of_get_option( 'cont_b_title' ) ) : ?>
						<h2><?php echo esc_html( tidy_of_get_option( 'cont_b_title' ) ); ?></h2>
					<?php endif; ?>
					<?php echo apply_filters( 'the_content', tidy_of_get_option( 'cont_b_text' )); ?>
					</div>
				<?php endif; ?>
				<?php if ( tidy_of_get_option( 'cont_c_text' ) ) : ?>
					<div class="contact-area cont_c_text">
					<?php if ( tidy_of_get_option( 'cont_c_title' ) ) : ?>
						<h2><?php echo esc_html( tidy_of_get_option( 'cont_c_title' ) ); ?></h2>
					<?php endif; ?>
					<?php echo apply_filters( 'the_content', tidy_of_get_option( 'cont_c_text' )); ?>
					</div>
				<?php endif; ?>

				<?php
					// If comments are open or we have at least one comment, load up the comment template
					if ( comments_open() || '0' != get_comments_number() ) :
						comments_template();
					endif;
				?>

			<?php endwhile; // end of the loop. ?>

			
		</main><!-- #main -->
		<?php do_action( 'tidy_after_primary' ); ?>
	</div><!-- #primary -->

<?php
	if ( $tidy_layout == 'cont_s1' or $tidy_layout == 'cont_s2' ) {
		$tidy_side = ( $tidy_layout == 'cont_s1' ) ? 'left' : 'right';
		get_sidebar();
	}
?>
<?php get_footer(); ?>
