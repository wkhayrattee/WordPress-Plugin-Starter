<?php

namespace %PSR4_NAMESPACE%;

use %PSR4_NAMESPACE%\Admin\Dashboard;

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

        if (!current_user_can('manage_options')) {
            return;
        }

        new Dashboard();
    }
}
