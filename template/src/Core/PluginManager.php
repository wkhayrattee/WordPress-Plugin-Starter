<?php

namespace %PSR4_NAMESPACE%;

class PluginManager
{
    /**
     * Attached to activate_{ plugin_basename( __FILES__ ) } by register_activation_hook()
     *
     * @static
     */
    public static function plugin_activation()
    {
        //plant a seed to help us detect the state "on activation"
        add_option(Enum::PLUGIN_KEY, true);
    }

    /**
     * Should remove any scheduled events
     * NOTE: The database data cleaning is handled by uninstall.php
     *
     * @static
     */
    public static function plugin_deactivation()
    {

    }

    /**
     * triggered when a user has deactivated the plugin
     */
    public static function plugin_uninstall()
    {
        //cleanup portion
        //clear any database fields initially created by this plugin
    }

    /**
     * To call any logic that needs to run on the frontend or in background
     */
    public static function run()
    {

    }

    /**
     * Render the admin pages
     */
    public static function adminInit()
    {
        //if on plugin activation
        if (get_option(Enum::PLUGIN_KEY)) {
            //do anything during activation

            //then delete the seed
            delete_option(Enum::PLUGIN_KEY);
        }

        //register hooks
        add_action('admin_init', [self::class, 'admin_init_callback']);
        add_action('admin_menu', [self::class, 'admin_menu_callback']);
        add_action('admin_enqueue_scripts', [self::class, 'load_resources_callback']);
    }

    /**
     * Fires as an admin screen or script is being initialized.
     * Is triggered before any other hook when a user accesses the admin area
     *
     * Runs BOTH on user-facing admin screens and on admin-ajax.php & admin-post.php as well
     * Roughly analogous to the more general ‘init’ hook, which fires earlier.
     *
     * ref: https://developer.wordpress.org/reference/hooks/admin_init/
     */
    public static function admin_init_callback()
    {

    }

    /**
     * To add the plugin's submenus & menu options to the admin panel’s menu structure
     *
     * Fires before the administration menu loads in the admin.
     * Runs after the basic admin panel menu structure is in place.
     *
     * Note:
     * Must not be placed in an admin_init action function because the admin_init action is called after admin_menu.
     *
     * ref: https://developer.wordpress.org/reference/hooks/admin_menu/
     */
    public static function admin_menu_callback()
    {

    }

    /**
     * To load assets files (e.g: css & js) for Admins creen
     */
    public static function load_resources_callback()
    {
        $screen = get_current_screen();

        // load the asset only when the admin page is on the slug of our plugin
        if ('%PROJECT_SLUG%' === $screen->base) {
            wp_enqueue_style('%PROJECT_SLUG%-css', %PHP_CONSTANT_PREFIX%_PLUGIN_DIR_URL . 'assets/css/%PROJECT_SLUG%.css', %PHP_CONSTANT_PREFIX%_PLUGIN_VERSION);
            wp_enqueue_script('%PROJECT_SLUG%-js', %PHP_CONSTANT_PREFIX%_PLUGIN_DIR_URL . 'assets/js/%PROJECT_SLUG%.js', ['jquery'], %PHP_CONSTANT_PREFIX%_PLUGIN_VERSION);
        }
    }
}
