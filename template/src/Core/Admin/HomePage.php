<?php

namespace %PSR4_NAMESPACE%\Admin;

use %PSR4_NAMESPACE%\Enum;
use %PSR4_NAMESPACE%\Utils;

class HomePage
{
    public function __construct()
    {
    }

    public function registerMenu()
    {
        add_menu_page(
            'Home',
            'Home',
            Enum::ADMIN_PAGE_CAPABILITY,
            Enum::ADMIN_PAGE_PARENT_SLUG,
            [self::class, 'render_page_elements'],
            'dashicons-editor-removeformatting',
            21
        );
    }

    public static function render_page_elements()
    {
        global $title;
        $error_msg = '';

        if (!current_user_can('manage_options')) {
            return;
        }


        //todo: handle any POST

        //todo: params to inject to the template
        $args = [
            'title' => $title,
            'error_msg' => $error_msg,
        ];
        load_template(%PHP_CONSTANT_PREFIX%_PLUGIN_TEMPLATES . 'admin/home-tpl.php', true, $args);
    }
}
