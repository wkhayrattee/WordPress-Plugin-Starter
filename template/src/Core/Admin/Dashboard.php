<?php

namespace %PSR4_NAMESPACE%\Admin;

use %PSR4_NAMESPACE%\Enum;

class Dashboard
{
    private $log_page;

    public function __construct()
    {
        $this->log_page = new LogPage();

        //register hooks
        add_action('admin_init', [$this, 'admin_init_callback']);
        add_action('admin_menu', [$this, 'admin_menu_callback']);
        add_action('admin_enqueue_scripts', [$this, 'load_resources_callback']);
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
    public function admin_init_callback()
    {
        // Register a new setting for our page.
        register_setting(Enum::ADMIN_PAGE_OPTION_GROUP, Enum::ADMIN_PAGE_OPTION_NAME);
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
    public function admin_menu_callback()
    {
        $this->log_page->registerMenu();
    }

    /**
     * To load assets files (e.g: css & js) for Admins creen
     */
    public function load_resources_callback()
    {
        $screen = get_current_screen();

        // load the asset only when the admin page is on the slug of our plugin
        if ('%PROJECT_SLUG%' === $screen->base) {
            wp_enqueue_style('%PROJECT_SLUG%-css', %PHP_CONSTANT_PREFIX%_PLUGIN_DIR_URL . 'assets/css/%PROJECT_SLUG%.css', %PHP_CONSTANT_PREFIX%_PLUGIN_VERSION);
            wp_enqueue_script('%PROJECT_SLUG%-js', %PHP_CONSTANT_PREFIX%_PLUGIN_DIR_URL . 'assets/js/%PROJECT_SLUG%.js', ['jquery'], %PHP_CONSTANT_PREFIX%_PLUGIN_VERSION);
        }
    }
}
