<?php
/**
 * %PROJECT_NAME%
 *
 * @author %AUTHOR_NAME%
 * @copyright 2022 %AUTHOR_NAME%
 * @license %LICENCE%
 *
 * @wordpress-plugin
 * Plugin Name: %PROJECT_NAME%
 * Plugin URI: TODO
 * Description: TODO
 * Version: 0.1.0
 * Requires at least: %WP_MINIMUM_VERSION%
 * Author: %AUTHOR_NAME%
 * Author URI: %AUTHOR_URI%
 * License: %LICENCE%
 * License URI: %LICENCE_URI%
 * Text Domain: %PROJECT_SLUG%
 * Domain Path: /languages
 *
 *
 * reference: https://developer.wordpress.org/plugins/plugin-basics/header-requirements/
 *
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version %LICENCE%.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see %LICENCE_URI%
 */

/**
 * Make sure we don't expose any info if called directly
 */
if (!function_exists('add_action')) {
    header('Status: 403 Forbidden');
    header('HTTP/1.1 403 Forbidden');
    exit;
}

/**
 * Some global constants for our use-case
 */
define('%PHP_CONSTANT_PREFIX%_PLUGIN_VERSION', '0.1.0');
define('%PHP_CONSTANT_PREFIX%_PLUGIN_MINIMUM_WP_VERSION', '%WP_MINIMUM_VERSION%');
define('%PHP_CONSTANT_PREFIX%_PLUGIN_DIR_URL', plugin_dir_url(__FILE__)); //has trailing slash at end
define('%PHP_CONSTANT_PREFIX%_PLUGIN_DIR', plugin_dir_path(__FILE__)); //has trailing slash at end
define('%PHP_CONSTANT_PREFIX%_PLUGIN_BASENAME', plugin_basename(%PHP_CONSTANT_PREFIX%_PLUGIN_DIR));
define('%PHP_CONSTANT_PREFIX%_PLUGIN_VIEWS', %PHP_CONSTANT_PREFIX%_PLUGIN_DIR . 'views' . DIRECTORY_SEPARATOR);

/**
 * load our main file now with composer autoloading
 */
require_once %PHP_CONSTANT_PREFIX%_PLUGIN_DIR . DIRECTORY_SEPARATOR . 'includes/vendor/autoload.php';

/**
 * Register main Hooks
 */
register_activation_hook(__FILE__, ['%PSR4_NAMESPACE%\\PluginManager', 'plugin_activation']);
register_deactivation_hook(__FILE__, ['%PSR4_NAMESPACE%\\PluginManager', 'plugin_deactivation']);

/**
 * Load the admin page interface
 */
if (is_admin()) {
    add_action('init', ['%PSR4_NAMESPACE%\\PluginManager', 'adminInit']);
}
