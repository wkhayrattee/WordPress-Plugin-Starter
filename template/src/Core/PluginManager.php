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

        //Now do normal stuff
        add_action('admin_menu', [self::class, 'handleAdminUI']);
    }

    public static function handleAdminUI()
    {
        add_action('admin_enqueue_scripts', [self::class, 'add_javascript']);
    }

    public static function add_javascript()
    {
        $screen = get_current_screen();

        // load the asset only when the admin page is on the slug of our plugin
        if ('%PROJECT_SLUG%' === $screen->base) {
            wp_enqueue_script('%PROJECT_SLUG%-js', %PHP_CONSTANT_PREFIX%_PLUGIN_DIR_URL . 'assets/js/%PROJECT_SLUG%-script.js', ['jquery'], '%PHP_CONSTANT_PREFIX%_PLUGIN_VERSION');
        }
    }
}
