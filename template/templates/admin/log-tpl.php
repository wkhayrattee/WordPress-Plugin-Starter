<?php

use %PSR4_NAMESPACE%\Enum;

$injected_args = $args;
$title = $error_msg = $txtlog_value = '';

if (isset($injected_args['title'])) {
    $title = sanitize_text_field($injected_args['title']);
}
if (isset($injected_args['error_msg'])) {
    $error_msg = sanitize_text_field($injected_args['error_msg']);
}
$txtlog_value = get_query_var('txtlog_value');
?>
<div class="wrap">
    <h1><?php echo $title; ?></h1>
    <h3>Use the Log below to spot any error during using this plugin</h3>
    <form name="log_page_form" action="" method="post">
        <?php settings_errors(Enum::ADMIN_PAGE_LOG_SLUG); ?>
        <table class="form-table">
            <tr>
                <td>(Only the latest 100 entries will be displayed - pay attention to the DATE)</td>
            </tr>
            <tr>
                <td width="100%">
                    <textarea name="txtlog" class="large-text code" style="height:450px;white-space: pre-wrap;" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false"><?php echo htmlentities($txtlog_value); ?>
                    </textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" class="button-primary" value="Clear Error Log" name="clearlog_btn" />
                </td>
            </tr>
        </table>
    </form>
</div>
