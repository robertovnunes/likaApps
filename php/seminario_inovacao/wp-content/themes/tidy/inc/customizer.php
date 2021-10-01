<?php
/**
 * Tidy Theme Customizer
 *
 * @package Tidy
 */

/**
 * tidy_sns_array
 * @param   none
 * @return  Array
 */
function tidy_sns_array() {
	$tidy_sns_array = array(
		'Facebook'       => array( 'facebook', '' ),
		'Twitter'        => array( 'twitter', '' ),
		'Pinterest'      => array( 'pinterest', '' ),
		'Flickr'         => array( 'flickr', '' ),
		'Linkedin'       => array( 'linkedin', '' ),
		'Google+'        => array( 'google-plus', '' ),
		'Tumblr'         => array( 'tumblr', '' ),
		'Instagram'      => array( 'instagram', '' ),
		'YouTube'        => array( 'youtube', '' ),
		'Vimeo'          => array( 'vimeo', '' ),
		'Lanyrd'         => array( 'lanyrd', '' ),
		'Picasa'         => array( 'picasa', '' ),
		'Dribbble'       => array( 'dribbble', '' ),
		'Forrst'         => array( 'forrst', ''),
		'deviantART'     => array( 'deviantart', ''),
		'Steam'          => array( 'steam', ''),
		'GitHub'         => array( 'github', ''),
		'WordPress'      => array( 'wordpress', ''),
		'SoundCloud'     => array( 'soundcloud', ''),
		'Skype'          => array( 'skype', ''),
		'reddit'         => array( 'reddit', ''),
		'Last.fm'        => array( 'lastfm', ''),
		'Delicious'      => array( 'delicious', ''),
		'StumbleUpon'    => array( 'stumbleupon', ''),
		'Stack Overflow' => array( 'stackoverflow', ''),
		'Flattr'         => array( 'flattr', ''),
		'Yelp'           => array( 'yelp', ''),
		'Foursquare'     => array( 'foursquare', '')
	);
	return $tidy_sns_array;
}

/**
 * tidy_default_array
 * @param   none
 * @return  Array
 */
function tidy_default_array() {
	$tidy_default = array(
		'logo_image' => '',
		'header_text' => '',
		'copyright' => '',
		
		'header_bg_color'     => '#E3E6EA',
		'header_text_color'   => '#1C1C1C',
		'header_anchor_color' => '#0058AE',
		'header_border_color' => '#CDD0D4',

		'header_widget_bg_color'     => '#CDD0D4',
		'header_widget_text_color'   => '#1C1C1C',
		'header_widget_anchor_color' => '#0058AE',

		'background_color'    => '#FFFFFF',
		'main_bg_color'       => '#FFFFFF',
		'main_text_color'     => '#1C1C1C',
		'main_anchor_color'   => '#0058AE',
		'main_border_color'   => '#CDD0D4',
		'image_hover_color'   => '#000000',
		'image_hover_opacity' => '0.6',

		'widget_bg_color'     => '#FFFFFF',
		'widget_title_color'  => '#1C1C1C',
		'widget_text_color'   => '#1C1C1C',
		'widget_anchor_color' => '#0058AE',
		'widget_border_color' => '#CDD0D4',

		'footer_bg_color'     => '#0058AE',
		'footer_title_color'  => '#FFFFFF',
		'footer_text_color'   => '#FFFFFF',
		'footer_anchor_color' => '#FFFFFF',
		'footer_border_color' => '#FFFFFF',

		'footer_category_bg_color'     => '#E3E6EA',
		'footer_category_title_color'  => '#1C1C1C',
		'footer_category_text_color'   => '#1C1C1C',
		'footer_category_anchor_color' => '#0058AE',
		'footer_category_border_color' => '#CDD0D4',

		'copyright_bg_color'     => '#CDD0D4',
		'copyright_text_color'   => '#0058AE',
		'copyright_anchor_color' => '#0058AE',
	);
	return $tidy_default;
}

/**
 * Add postMessage support for site title and description for the Theme Customizer.
 *
 * @param WP_Customize_Manager $wp_customize Theme Customizer object.
 */
function tidy_customize_register( $wp_customize ) {
	$wp_customize->get_setting( 'blogname' )->transport        = 'postMessage';
	$wp_customize->get_setting( 'blogdescription' )->transport = 'postMessage';
/*
	$wp_customize->get_setting( 'logo_toggle' )->transport     = 'postMessage';
	$wp_customize->get_setting( 'logo_image' )->transport      = 'postMessage';
	$wp_customize->get_setting( 'copyright' )->transport       = 'postMessage';
	$wp_customize->get_setting( 'header_text_toggle' )->transport     = 'postMessage';
	$wp_customize->get_setting( 'header_text' )->transport     = 'postMessage';
*/

}
add_action( 'customize_register', 'tidy_customize_register' );

/**
 * Binds JS handlers to make Theme Customizer preview reload changes asynchronously.
 */
function tidy_customize_preview_js() {
	wp_enqueue_script( 'tidy_customizer', get_template_directory_uri() . '/js/customizer.js', array( 'customize-preview' ), '20130508', true );
}
add_action( 'customize_preview_init', 'tidy_customize_preview_js' );

/**
 * get_tidy_option_name
 * @param   String  Key
 * @return  String  propaty name
 */

function get_tidy_option_name( $key = null ) {
	if ( !empty( $key ) ) {
		return 'theme_mods_'.get_stylesheet().'['.$key.']';
	} else {
		return 'theme_mods_'.get_stylesheet();
	}
}

function tidy_customize_setup( $wp_customize ) {

	$tidy_default = tidy_default_array();

	/**
	 * section for title_tagline.
	 */

	// = header toggle.
	$wp_customize->add_setting( get_tidy_option_name( 'header_text_toggle' ), array(
		'default'    => '0',
		'type'       => 'option',
		'capability' => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Control( $wp_customize, get_tidy_option_name( 'header_text_toggle' ), array(
		'label'      => __( 'Show Header Text', 'tidy' ),
		'section'    => 'title_tagline',
		'priority'   => 11,
		'settings'   => get_tidy_option_name( 'header_text_toggle' ),
		'type'       => 'radio',
		'choices'    => array(
			'1' => __( 'On', 'tidy' ),
			'0' => __( 'Off', 'tidy' )
		),
	) ) );

	// = Text Input for Header Text
	$wp_customize->add_setting( get_tidy_option_name( 'header_text' ), array(
		'default'    => $tidy_default['header_text'],
		'type'       => 'option',
		'capability' => 'edit_theme_options',
	));
	$wp_customize->add_control( get_tidy_option_name( 'header_text' ), array(
		'label'      => __( 'Header Text', 'tidy' ),
		'section'    => 'title_tagline',
		'priority'   => 12,
		'settings'   => get_tidy_option_name( 'header_text' ),
	));

	// = Text Input for Copyright
	$wp_customize->add_setting( get_tidy_option_name( 'copyright' ), array(
		'default'    => $tidy_default['copyright'],
		'type'       => 'option',
		'capability' => 'edit_theme_options',
	));
	$wp_customize->add_control( get_tidy_option_name( 'copyright' ), array(
		'label'      => __( 'Copyright', 'tidy' ),
		'section'    => 'title_tagline',
		'priority'   => 13,
		'settings'   => get_tidy_option_name( 'copyright' ),
	));

	/**
	 * section for logo Settings.
	 */
	$wp_customize->add_section( 'tidy_logo_settings', array(
		'title'      => __( 'Logo settings', 'tidy' ),
		'priority'   => 35,
	));

	// = header toggle.
	$wp_customize->add_setting( get_tidy_option_name( 'logo_toggle' ), array(
		'default'    => '0',
		'type'       => 'option',
		'capability' => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Control( $wp_customize, get_tidy_option_name( 'logo_toggle' ), array(
		'label'      => __( 'Show Header Logo', 'tidy' ),
		'section'    => 'tidy_logo_settings',
		'priority'   => 11,
		'settings'   => get_tidy_option_name( 'logo_toggle' ),
		'type'       => 'radio',
		'choices'    => array(
			'1' => __( 'On', 'tidy' ),
			'0' => __( 'Off', 'tidy' )
		),
	) ) );
	
	// = header logo.
	$wp_customize->add_setting( get_tidy_option_name( 'logo_image' ), array(
		'default'    => $tidy_default['logo_image'],
		'type'       => 'option',
		'capability' => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Image_Control( $wp_customize, get_tidy_option_name( 'logo_image' ), array(
		'label'      => __( 'Header Logo Image', 'tidy' ),
		'section'    => 'tidy_logo_settings',
		'priority'   => 12,
		'settings'   => get_tidy_option_name( 'logo_image' ),
	)));

	// = favicon.
	$wp_customize->add_setting( get_tidy_option_name( 'favicon' ), array(
		'type'       => 'option',
		'capability' => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Upload_Control( $wp_customize, get_tidy_option_name( 'favicon' ), array(
		'label'      => __( 'Favicon', 'tidy' ),
		'section'    => 'tidy_logo_settings',
		'priority'   => 13,
		'settings'   => get_tidy_option_name( 'favicon' ),
	)));

	/**
	 * section for Header Color Settings.
	 */
	$wp_customize->add_section( 'tidy_color_settings_header', array(
		'title'      => __( 'Header Color Settings', 'tidy' ),
		'priority'   => 200,
	));

	// = Color Picker for Header Background Color.
	$wp_customize->add_setting( get_tidy_option_name( 'header_bg_color' ), array(
		'default'           => $tidy_default['header_bg_color'],
		'sanitize_callback' => 'sanitize_hex_color',
		'type'              => 'option',
		'capability'        => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, get_tidy_option_name( 'header_bg_color' ), array(
		'label'      => __( 'Header Background Color', 'tidy' ),
		'section'    => 'tidy_color_settings_header',
		'priority'   => 10,
		'settings'   => get_tidy_option_name( 'header_bg_color' ),
	)));

	// = Color Picker for header Text Color.
	$wp_customize->add_setting( get_tidy_option_name( 'header_text_color' ), array(
		'default'           => $tidy_default['header_text_color'],
		'sanitize_callback' => 'sanitize_hex_color',
		'type'              => 'option',
		'capability'        => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, get_tidy_option_name( 'header_text_color' ), array(
		'label'      => __( 'Header Text Color', 'tidy' ),
		'section'    => 'tidy_color_settings_header',
		'priority'   => 11,
		'settings'   => get_tidy_option_name( 'header_text_color' ),
	)));

	// = Color Picker for header Anchor Color.
	$wp_customize->add_setting( get_tidy_option_name( 'header_anchor_color' ), array(
		'default'           => $tidy_default['header_anchor_color'],
		'sanitize_callback' => 'sanitize_hex_color',
		'type'              => 'option',
		'capability'        => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, get_tidy_option_name( 'header_anchor_color' ), array(
		'label'      => __( 'Header Anchor Color', 'tidy' ),
		'section'    => 'tidy_color_settings_header',
		'priority'   => 12,
		'settings'   => get_tidy_option_name( 'header_anchor_color' ),
	)));

	// = Color Picker for header Border Color.
	$wp_customize->add_setting( get_tidy_option_name( 'header_border_color' ), array(
		'default'           => $tidy_default['header_border_color'],
		'sanitize_callback' => 'sanitize_hex_color',
		'type'              => 'option',
		'capability'        => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, get_tidy_option_name( 'header_border_color' ), array(
		'label'      => __( 'Header Border Color', 'tidy' ),
		'section'    => 'tidy_color_settings_header',
		'priority'   => 13,
		'settings'   => get_tidy_option_name( 'header_border_color' ),
	)));

	// = Color Picker for header widget Background Color.
	$wp_customize->add_setting( get_tidy_option_name( 'header_widget_bg_color' ), array(
		'default'           => $tidy_default['header_widget_bg_color'],
		'sanitize_callback' => 'sanitize_hex_color',
		'type'              => 'option',
		'capability'        => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, get_tidy_option_name( 'header_widget_bg_color' ), array(
		'label'      => __( 'Header Widget Background Color', 'tidy' ),
		'section'    => 'tidy_color_settings_header',
		'priority'   => 14,
		'settings'   => get_tidy_option_name( 'header_widget_bg_color' ),
	)));

	// = Color Picker for header widget Text Color.
	$wp_customize->add_setting( get_tidy_option_name( 'header_widget_text_color' ), array(
		'default'           => $tidy_default['header_widget_text_color'],
		'sanitize_callback' => 'sanitize_hex_color',
		'type'              => 'option',
		'capability'        => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, get_tidy_option_name( 'header_widget_text_color' ), array(
		'label'      => __( 'Header Widget Text Color', 'tidy' ),
		'section'    => 'tidy_color_settings_header',
		'priority'   => 15,
		'settings'   => get_tidy_option_name( 'header_widget_text_color' ),
	)));

	// = Color Picker for header widget Anchor Color.
	$wp_customize->add_setting( get_tidy_option_name( 'header_widget_anchor_color' ), array(
		'default'           => $tidy_default['header_widget_anchor_color'],
		'sanitize_callback' => 'sanitize_hex_color',
		'type'              => 'option',
		'capability'        => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, get_tidy_option_name( 'header_widget_anchor_color' ), array(
		'label'      => __( 'Header Widget Anchor Color', 'tidy' ),
		'section'    => 'tidy_color_settings_header',
		'priority'   => 16,
		'settings'   => get_tidy_option_name( 'header_widget_anchor_color' ),
	)));

	/**
	 * section for Main color Settings.
	 */
	$wp_customize->add_section( 'tidy_color_settings_main', array(
		'title'      => __( 'Main Color Settings', 'tidy' ),
		'priority'   => 300,
	));

	// = Color Picker for main Background Color.
	$wp_customize->add_setting( get_tidy_option_name( 'main_bg_color' ), array(
		'default'           => $tidy_default['main_bg_color'],
		'sanitize_callback' => 'sanitize_hex_color',
		'type'              => 'option',
		'capability'        => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, get_tidy_option_name( 'main_bg_color' ), array(
		'label'      => __( 'Main Background Color', 'tidy' ),
		'section'    => 'tidy_color_settings_main',
		'priority'   => 11,
		'settings'   => get_tidy_option_name( 'main_bg_color' ),
	)));

	// = Color Picker for main Text Color.
	$wp_customize->add_setting( get_tidy_option_name( 'main_text_color' ), array(
		'default'           => $tidy_default['main_text_color'],
		'sanitize_callback' => 'sanitize_hex_color',
		'type'              => 'option',
		'capability'        => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, get_tidy_option_name( 'main_text_color' ), array(
		'label'      => __( 'Main Text Color', 'tidy' ),
		'section'    => 'tidy_color_settings_main',
		'priority'   => 12,
		'settings'   => get_tidy_option_name( 'main_text_color' ),
	)));

	// = Color Picker for main Anchor Color.
	$wp_customize->add_setting( get_tidy_option_name( 'main_anchor_color' ), array(
		'default'           => $tidy_default['main_anchor_color'],
		'sanitize_callback' => 'sanitize_hex_color',
		'type'              => 'option',
		'capability'        => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, get_tidy_option_name( 'main_anchor_color' ), array(
		'label'      => __( 'Main Anchor Color', 'tidy' ),
		'section'    => 'tidy_color_settings_main',
		'priority'   => 13,
		'settings'   => get_tidy_option_name( 'main_anchor_color' ),
	)));

	// = Color Picker for main Border Color.
	$wp_customize->add_setting( get_tidy_option_name( 'main_border_color' ), array(
		'default'           => $tidy_default['main_border_color'],
		'sanitize_callback' => 'sanitize_hex_color',
		'type'              => 'option',
		'capability'        => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, get_tidy_option_name( 'main_border_color' ), array(
		'label'      => __( 'Main Border Color', 'tidy' ),
		'section'    => 'tidy_color_settings_main',
		'settings'   => get_tidy_option_name( 'main_border_color' ),
		'priority'   => 14,
	)));

	// = Color Picker for image hover color.
	$wp_customize->add_setting( get_tidy_option_name( 'image_hover_color' ), array(
		'default'           => $tidy_default['image_hover_color'],
		'sanitize_callback' => 'sanitize_hex_color',
		'type'              => 'option',
		'capability'        => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, get_tidy_option_name( 'image_hover_color' ), array(
		'label'      => __( 'Image Hover Color', 'tidy' ),
		'section'    => 'tidy_color_settings_main',
		'settings'   => get_tidy_option_name( 'image_hover_color' ),
		'priority'   => 21,
	)));

	// = Image Hover Opacity.
	$wp_customize->add_setting( get_tidy_option_name( 'image_hover_opacity' ), array(
		'default'    => $tidy_default['image_hover_opacity'],
		'type'       => 'option',
		'capability' => 'edit_theme_options',
	));
	$wp_customize->add_control( get_tidy_option_name( 'image_hover_opacity' ), array(
		'label'      => __( 'Image Hover Opacity', 'tidy' ),
		'section'    => 'tidy_color_settings_main',
		'priority'   => 22,
		'settings'   => get_tidy_option_name( 'image_hover_opacity' ),
	));

	// = Color Picker for image hover text.
/*
	$wp_customize->add_setting( get_tidy_option_name( 'image_hover_text' ), array(
		'default'           => $tidy_default['image_hover_text'],
		'sanitize_callback' => 'sanitize_hex_color',
		'type'              => 'option',
		'capability'        => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, get_tidy_option_name( 'image_hover_text' ), array(
		'label'      => __( 'Image hover Text Color', 'tidy' ),
		'section'    => 'tidy_color_settings_main',
		'settings'   => get_tidy_option_name( 'image_hover_text' ),
		'priority'   => 23,
	)));
*/

	/**
	 * section for Widget color Settings.
	 */
	$wp_customize->add_section( 'tidy_color_settings_widget', array(
		'title'      => __( 'Widget Color Settings', 'tidy' ),
		'priority'   => 400,
	));

	// = Color Picker for widget Background Color.
	$wp_customize->add_setting( get_tidy_option_name( 'widget_bg_color' ), array(
		'default'           => $tidy_default['widget_bg_color'],
		'sanitize_callback' => 'sanitize_hex_color',
		'type'              => 'option',
		'capability'        => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, get_tidy_option_name( 'widget_bg_color' ), array(
		'label'      => __( 'Widget Background Color', 'tidy' ),
		'section'    => 'tidy_color_settings_widget',
		'priority'   => 11,
		'settings'   => get_tidy_option_name( 'widget_bg_color' ),
	)));

	// = Color Picker for widget Title Color.
	$wp_customize->add_setting( get_tidy_option_name( 'widget_title_color' ), array(
		'default'           => $tidy_default['widget_title_color'],
		'sanitize_callback' => 'sanitize_hex_color',
		'type'              => 'option',
		'capability'        => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, get_tidy_option_name( 'widget_title_color' ), array(
		'label'      => __( 'Widget Title Color', 'tidy' ),
		'section'    => 'tidy_color_settings_widget',
		'priority'   => 12,
		'settings'   => get_tidy_option_name( 'widget_title_color' ),
	)));

	// = Color Picker for widget Text Color.
	$wp_customize->add_setting( get_tidy_option_name( 'widget_text_color' ), array(
		'default'           => $tidy_default['widget_text_color'],
		'sanitize_callback' => 'sanitize_hex_color',
		'type'              => 'option',
		'capability'        => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, get_tidy_option_name( 'widget_text_color' ), array(
		'label'      => __( 'Widget Text Color', 'tidy' ),
		'section'    => 'tidy_color_settings_widget',
		'priority'   => 13,
		'settings'   => get_tidy_option_name( 'widget_text_color' ),
	)));

	// = Color Picker for widget Anchor Color.
	$wp_customize->add_setting( get_tidy_option_name( 'widget_anchor_color' ), array(
		'default'           => $tidy_default['widget_anchor_color'],
		'sanitize_callback' => 'sanitize_hex_color',
		'type'              => 'option',
		'capability'        => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, get_tidy_option_name( 'widget_anchor_color' ), array(
		'label'      => __( 'Widget Anchor Color', 'tidy' ),
		'section'    => 'tidy_color_settings_widget',
		'priority'   => 14,
		'settings'   => get_tidy_option_name( 'widget_anchor_color' ),
	)));

	// = Color Picker for widget Border Color.
	$wp_customize->add_setting( get_tidy_option_name( 'widget_border_color' ), array(
		'default'           => $tidy_default['widget_border_color'],
		'sanitize_callback' => 'sanitize_hex_color',
		'type'              => 'option',
		'capability'        => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, get_tidy_option_name( 'widget_border_color' ), array(
		'label'      => __( 'Widget Border Color', 'tidy' ),
		'section'    => 'tidy_color_settings_widget',
		'priority'   => 15,
		'settings'   => get_tidy_option_name( 'widget_border_color' ),
	)));

	/**
	 * section for Footer color Settings.
	 */
	$wp_customize->add_section( 'tidy_color_settings_footer', array(
		'title'      => __( 'Footer Color Settings', 'tidy' ),
		'priority'   => 500,
	));

	// = Color Picker for footer Background Color.
	$wp_customize->add_setting( get_tidy_option_name( 'footer_bg_color' ), array(
		'default'           => $tidy_default['footer_bg_color'],
		'sanitize_callback' => 'sanitize_hex_color',
		'type'              => 'option',
		'capability'        => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, get_tidy_option_name( 'footer_bg_color' ), array(
		'label'      => __( 'Footer Background Color', 'tidy' ),
		'section'    => 'tidy_color_settings_footer',
		'priority'   => 11,
		'settings'   => get_tidy_option_name( 'footer_bg_color' ),
	)));

	// = Color Picker for footer Title Color.
	$wp_customize->add_setting( get_tidy_option_name( 'footer_title_color' ) , array(
		'default'           => $tidy_default['footer_title_color'],
		'sanitize_callback' => 'sanitize_hex_color',
		'type'              => 'option',
		'capability'        => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, get_tidy_option_name( 'footer_title_color' ), array(
		'label'      => __( 'Footer Title Color', 'tidy' ),
		'section'    => 'tidy_color_settings_footer',
		'priority'   => 12,
		'settings'   => get_tidy_option_name( 'footer_title_color' )	,
	)));

	// = Color Picker for footer Text Color.
	$wp_customize->add_setting( get_tidy_option_name( 'footer_text_color' ) , array(
		'default'           => $tidy_default['footer_text_color'],
		'sanitize_callback' => 'sanitize_hex_color',
		'type'              => 'option',
		'capability'        => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, get_tidy_option_name( 'footer_text_color' ), array(
		'label'      => __( 'Footer Text Color', 'tidy' ),
		'section'    => 'tidy_color_settings_footer',
		'priority'   => 13,
		'settings'   => get_tidy_option_name( 'footer_text_color' )	,
	)));

	// = Color Picker for footer Anchor Color.
	$wp_customize->add_setting( get_tidy_option_name( 'footer_anchor_color' ) , array(
		'default'           => $tidy_default['footer_anchor_color'],
		'sanitize_callback' => 'sanitize_hex_color',
		'type'              => 'option',
		'capability'        => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, get_tidy_option_name( 'footer_anchor_color' ), array(
		'label'      => __( 'Footer Anchor Color', 'tidy' ),
		'section'    => 'tidy_color_settings_footer',
		'priority'   => 14,
		'settings'   => get_tidy_option_name( 'footer_anchor_color' )	,
	)));

	// = Color Picker for footer Border Color.
	$wp_customize->add_setting( get_tidy_option_name( 'footer_border_color' ), array(
		'default'           => $tidy_default['footer_border_color'],
		'sanitize_callback' => 'sanitize_hex_color',
		'type'              => 'option',
		'capability'        => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, get_tidy_option_name( 'footer_border_color' ), array(
		'label'      => __( 'Footer Border Color', 'tidy' ),
		'section'    => 'tidy_color_settings_footer',
		'priority'   => 15,
		'settings'   => get_tidy_option_name( 'footer_border_color' ),
	)));

	// = Color Picker for footer All Categories Background Color.
	$wp_customize->add_setting( get_tidy_option_name( 'footer_category_bg_color' ), array(
		'default'           => $tidy_default['footer_category_bg_color'],
		'sanitize_callback' => 'sanitize_hex_color',
		'type'              => 'option',
		'capability'        => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, get_tidy_option_name( 'footer_category_bg_color' ), array(
		'label'      => __( 'All Categories Background Color', 'tidy' ),
		'section'    => 'tidy_color_settings_footer',
		'priority'   => 21,
		'settings'   => get_tidy_option_name( 'footer_category_bg_color' ),
	)));

	// = Color Picker for footer All Categories Title Color.
	$wp_customize->add_setting( get_tidy_option_name( 'footer_category_title_color' ) , array(
		'default'           => $tidy_default['footer_category_title_color'],
		'sanitize_callback' => 'sanitize_hex_color',
		'type'              => 'option',
		'capability'        => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, get_tidy_option_name( 'footer_category_title_color' ), array(
		'label'      => __( 'All Categories Title Color', 'tidy' ),
		'section'    => 'tidy_color_settings_footer',
		'priority'   => 22,
		'settings'   => get_tidy_option_name( 'footer_category_title_color' )	,
	)));

	// = Color Picker for footer All Categories Anchor Color.
	$wp_customize->add_setting( get_tidy_option_name( 'footer_category_anchor_color' ) , array(
		'default'           => $tidy_default['footer_category_anchor_color'],
		'sanitize_callback' => 'sanitize_hex_color',
		'type'              => 'option',
		'capability'        => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, get_tidy_option_name( 'footer_category_anchor_color' ), array(
		'label'      => __( 'All Categories Anchor Color', 'tidy' ),
		'section'    => 'tidy_color_settings_footer',
		'priority'   => 24,
		'settings'   => get_tidy_option_name( 'footer_category_anchor_color' )	,
	)));

	// = Color Picker for footer All Categories Border Color.
	$wp_customize->add_setting( get_tidy_option_name( 'footer_category_border_color' ), array(
		'default'           => $tidy_default['footer_category_border_color'],
		'sanitize_callback' => 'sanitize_hex_color',
		'type'              => 'option',
		'capability'        => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, get_tidy_option_name( 'footer_category_border_color' ), array(
		'label'      => __( 'All Categories Border Color', 'tidy' ),
		'section'    => 'tidy_color_settings_footer',
		'priority'   => 25,
		'settings'   => get_tidy_option_name( 'footer_category_border_color' ),
	)));

	// = Color Picker for copyright Background Color.
	$wp_customize->add_setting( get_tidy_option_name( 'copyright_bg_color' ), array(
		'default'           => $tidy_default['copyright_bg_color'],
		'sanitize_callback' => 'sanitize_hex_color',
		'type'              => 'option',
		'capability'        => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, get_tidy_option_name( 'copyright_bg_color' ), array(
		'label'      => __( 'Copyright Background Color', 'tidy' ),
		'section'    => 'tidy_color_settings_footer',
		'priority'   => 31,
		'settings'   => get_tidy_option_name( 'copyright_bg_color' ),
	)));

	// = Color Picker for copyright Text Color.
	$wp_customize->add_setting( get_tidy_option_name( 'copyright_text_color' ) , array(
		'default'           => $tidy_default['copyright_text_color'],
		'sanitize_callback' => 'sanitize_hex_color',
		'type'              => 'option',
		'capability'        => 'edit_theme_options',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, get_tidy_option_name( 'copyright_text_color' ), array(
		'label'      => __( 'Copyright Text Color', 'tidy' ),
		'section'    => 'tidy_color_settings_footer',
		'priority'   => 33,
		'settings'   => get_tidy_option_name( 'copyright_text_color' )	,
	)));

}
add_action( 'customize_register', 'tidy_customize_setup' );

/**
 * Preview Style
 */
add_action( 'wp_head', 'tidy_customize_style' );
function tidy_customize_style() {
	$tidy_options = get_theme_mods();
	?>
	<style type="text/css" id="tidy_customize_style">
		<?php if ( !empty( $tidy_options['background_color'] ) ) : ?>
		body.custom-background {
			background-color: <?php echo esc_attr( $tidy_options['background_color'] ); ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['main_bg_color'] ) ) : ?>
		.site-content, .blog-section-content .hentry .ellipsis, .blog-section-content .hentry .more-link {
			background-color: <?php echo esc_attr( $tidy_options['main_bg_color'] ); ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['main_anchor_color'] ) ) : ?>
		.site-content a, .entry-meta, .post-navigation .genericon, .search-form .search-submit, .entry-title a:hover {
			color: <?php echo esc_attr( $tidy_options['main_anchor_color'] ); ?>;
		}
		.search-form input[type="search"], .gmo-shares a {
			border-color: <?php echo esc_attr( $tidy_options['main_anchor_color'] ); ?>;
		}
		ul.page-numbers li a:hover, ul.page-numbers li a:focus, ul.page-numbers li a:active {
			background-color: <?php echo esc_attr( $tidy_options['main_anchor_color'] ); ?>;
			color: <?php echo esc_attr( $tidy_options['main_bg_color'] ); ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['main_text_color'] ) ) : ?>
		.site-content, .entry-title a, .archive-title a, .section-title a {
			color: <?php echo esc_attr( $tidy_options['main_text_color'] ); ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['main_border_color'] ) ) : ?>
		.archive-title, .section-title, body.single .entry-title, body.page .entry-title, .site-main [class*="navigation"], .comment-list, li.depth-1, .widget-title, .widgettitle {
			border-color: <?php echo esc_attr( $tidy_options['main_border_color'] ); ?>;
		}
		hr {
			background-color: <?php echo esc_attr( $tidy_options['main_border_color'] ); ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['header_bg_color'] ) ) : ?>
		.site-header {
			background-color: <?php echo esc_attr( $tidy_options['header_bg_color'] ); ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['header_text_color'] ) ) : ?>
		.site-header-main {
			color: <?php echo esc_attr( $tidy_options['header_text_color'] ); ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['header_anchor_color'] ) ) : ?>
		.site-header-main a,
		.main-navigation .current_page_item a,
		.main-navigation .current-menu-item a,
		.main-navigation li:hover > a,
		.search-toggle {
			color: <?php echo esc_attr( $tidy_options['header_anchor_color'] ); ?>;
		}
		.menu-toggle {
			background-color: <?php echo esc_attr( $tidy_options['header_anchor_color'] ); ?>;
		}
		.search-container .search-form input[type="search"] {
			border-color: <?php echo esc_attr( $tidy_options['header_anchor_color'] ); ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['header_border_color'] ) ) : ?>
		.site-header-social-area .inner {
			border-color: <?php echo esc_attr( $tidy_options['header_border_color'] ); ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['header_widget_bg_color'] ) ) : ?>
		.site-header-widget-area,
		.header-widget-toggle-btn {
			background-color: <?php echo esc_attr( $tidy_options['header_widget_bg_color'] ); ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['header_widget_text_color'] ) ) : ?>
		.site-header-widget-area,
		.header-widget-toggle-btn {
			color: <?php echo esc_attr( $tidy_options['header_widget_text_color'] ); ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['header_widget_anchor_color'] ) ) : ?>
		.site-header-widget-area a {
			color: <?php echo esc_attr( $tidy_options['header_widget_anchor_color'] ); ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['image_hover_color'] ) ) :
		
		$red = substr($tidy_options['image_hover_color'], 1, 2);
		$green = substr($tidy_options['image_hover_color'], 3, 2);
		$blue = substr($tidy_options['image_hover_color'], 5, 2);
		$red = hexdec($red);
		$green = hexdec($green);
		$blue = hexdec($blue);
		$op = ( !empty( $tidy_options['image_hover_opacity'] ) ) ? 1-$tidy_options['image_hover_opacity'] : 0.6;
		$tidy_gallerybg = "rgba($red, $green, $blue, $op)";
		?>
		.tidy_post_thumbnail .thumbnail_img {
			background-color: <?php echo esc_attr( $tidy_options['image_hover_color'] ); ?>;
		}
		.gallery-section-content .entry-conteiner-child {
			background-color: <?php echo $tidy_gallerybg; ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['image_hover_opacity'] ) ) : ?>
		.tidy_post_thumbnail a:hover img {
			opacity: <?php echo esc_attr( $tidy_options['image_hover_opacity'] ); ?>;
		}
		<?php endif; ?>
		<?php /* if ( !empty( $tidy_options['image_hover_text'] ) ) : ?>
			.tidy_post_thumbnail a {
				color: <?php echo esc_attr( $tidy_options['image_hover_text'] ); ?>;
			}
		<?php endif; */ ?>

		<?php if ( !empty( $tidy_options['widget_bg_color'] ) ) : ?>
		#secondary .widget {
			background-color: <?php echo esc_attr( $tidy_options['widget_bg_color'] ); ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['widget_text_color'] ) ) : ?>
		#secondary .widget {
			color: <?php echo esc_attr( $tidy_options['widget_text_color'] ); ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['widget_title_color'] ) ) : ?>
		#secondary .widget-title, #secondary .widgettitle {
			color: <?php echo esc_attr( $tidy_options['widget_title_color'] ); ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['widget_anchor_color'] ) ) : ?>
		#secondary .widget a,
		#secondary .search-form .search-submit {
			color: <?php echo esc_attr( $tidy_options['widget_anchor_color'] ); ?>;
		}
		#secondary .search-form input[type="search"] {
			border-color: <?php echo esc_attr( $tidy_options['widget_anchor_color'] ); ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['widget_border_color'] ) ) : ?>
		#secondary .widget-title, #secondary .widgettitle {
			border-color: <?php echo esc_attr( $tidy_options['widget_border_color'] ); ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['footer_bg_color'] ) ) : ?>
		.site-footer-widget-area {
			background-color: <?php echo esc_attr( $tidy_options['footer_bg_color'] ); ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['footer_text_color'] ) ) : ?>
		.site-footer-widget-area {
			color: <?php echo esc_attr( $tidy_options['footer_text_color'] ); ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['footer_title_color'] ) ) : ?>
		.site-footer-widget-area .widget-title, .site-footer-widget-area .widgettitle {
			color: <?php echo esc_attr( $tidy_options['footer_title_color'] ); ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['footer_anchor_color'] ) ) : ?>
		.site-footer-widget-area a {
			color: <?php echo esc_attr( $tidy_options['footer_anchor_color'] ); ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['footer_border_color'] ) ) : ?>
		.site-footer-widget-area .widget-title, .site-footer-widget-area .widgettitle {
			border-color: <?php echo esc_attr( $tidy_options['footer_border_color'] ); ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['copyright_bg_color'] ) ) : ?>
		.site-info {
			background-color: <?php echo esc_attr( $tidy_options['copyright_bg_color'] ); ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['copyright_text_color'] ) ) : ?>
		.site-info {
			color: <?php echo esc_attr( $tidy_options['copyright_text_color'] ); ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['copyright_anchor_color'] ) ) : ?>
		.site-info a {
			color: <?php echo esc_attr( $tidy_options['copyright_anchor_color'] ); ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['footer_category_bg_color'] ) ) : ?>
		.footer-category-list {
			background-color: <?php echo esc_attr( $tidy_options['footer_category_bg_color'] ); ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['footer_category_text_color'] ) ) : ?>
		.footer-category-list {
			color: <?php echo esc_attr( $tidy_options['footer_category_text_color'] ); ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['footer_category_title_color'] ) ) : ?>
		.footer-category-list .widget-title {
			color: <?php echo esc_attr( $tidy_options['footer_category_title_color'] ); ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['footer_category_anchor_color'] ) ) : ?>
		.footer-category-list a {
			color: <?php echo esc_attr( $tidy_options['footer_category_anchor_color'] ); ?>;
		}
		<?php endif; ?>
		<?php if ( !empty( $tidy_options['footer_category_border_color'] ) ) : ?>
		.footer-category-list .widget-title {
			border-color: <?php echo esc_attr( $tidy_options['footer_category_border_color'] ); ?>;
		}
		<?php endif; ?>
	</style>
<?php
}

