<?php

/**
 * OpenCart Ukrainian Community
 *
 * LICENSE
 *
 * This source file is subject to the GNU General Public License, Version 3
 * It is also available through the world-wide-web at this URL:
 * http://www.gnu.org/copyleft/gpl.html
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email

 *
 * @category   OpenCart
 * @package    OCU HybridAuth
 * @copyright  Copyright (c) 2011 Eugene Lifescale by OpenCart Ukrainian Community (http://opencart-ukraine.tumblr.com)
 * @license    http://www.gnu.org/copyleft/gpl.html     GNU General Public License, Version 3
 */



/**
 * @category   OpenCart
 * @package    OCU HybridAuth
 * @copyright  Copyright (c) 2011 Eugene Lifescale by OpenCart Ukrainian Community (http://opencart-ukraine.tumblr.com)
 */

 ?>

<?php echo $header; ?>

<div id="content">
<div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
</div>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="heading">
    <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <table class="form">
        <tr>
          <td><?php echo $entry_status; ?></td>
          <td>
            <select name="hybrid_auth_status">
                <?php if ($hybrid_auth_status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
            </select>
          </td>
        </tr>
        <tr>
          <td><?php echo $entry_debug; ?></td>
          <td>
            <select name="hybrid_auth_debug">
                <?php if ($hybrid_auth_debug) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
            </select>
          </td>
        </tr>
      </table>

      <table id="module" class="list">
        <thead>
          <tr>
            <td class="left"><?php echo $entry_provider; ?></td>
            <td class="left"><?php echo $entry_status; ?></td>
            <td class="left"><?php echo $entry_key; ?></td>
            <td class="left"><?php echo $entry_secret; ?></td>
            <td class="left"><?php echo $entry_scope; ?></td>
            <td class="right"><?php echo $entry_sort_order; ?></td>
            <td></td>
          </tr>
        </thead>
        <?php $row = 0; ?>
        <?php foreach ($hybrid_auth_items as $hybrid_auth) { ?>
        <tbody id="row<?php echo $row; ?>">
          <tr>
            <td class="left">
              <select name="hybrid_auth[<?php echo $row; ?>][provider]">
                <?php foreach ($providers as $provider) { ?>
                  <?php if ($provider == $hybrid_auth['provider']) { ?>
                    <option value="<?php echo $provider; ?>" selected="selected"><?php echo $provider; ?></option>
                  <?php } else { ?>
                    <option value="<?php echo $provider; ?>"><?php echo $provider; ?></option>
                  <?php } ?>
                <?php } ?>
              </select>
            </td>
            <td class="left">
              <select name="hybrid_auth[<?php echo $row; ?>][enabled]">
                <?php if ($hybrid_auth['enabled']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </td>
            <td class="left"><input type="text" name="hybrid_auth[<?php echo $row; ?>][key]" value="<?php echo $hybrid_auth['key']; ?>" size="50" /></td>
            <td class="left"><input type="text" name="hybrid_auth[<?php echo $row; ?>][secret]" value="<?php echo $hybrid_auth['secret']; ?>" size="50" /></td>
            <td class="left"><input type="text" name="hybrid_auth[<?php echo $row; ?>][scope]" value="<?php echo $hybrid_auth['scope']; ?>" size="50" /></td>
            <td class="right"><input type="text" name="hybrid_auth[<?php echo $row; ?>][sort_order]" value="<?php echo $hybrid_auth['sort_order']; ?>" size="3" /></td>
            <td class="left"><a onclick="$('#row<?php echo $row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
          </tr>
        </tbody>
        <?php $row++; ?>
        <?php } ?>
        <tfoot>
          <tr>
            <td colspan="6"></td>
            <td class="left"><a onclick="addRow();" class="button"><?php echo $button_add_row; ?></a></td>
          </tr>
        </tfoot>
      </table>
    </form>
  </div>
  <div style="text-align:center;margin:20px">
    <?php echo $text_copyright; ?>
  </div>
</div>
<script type="text/javascript"><!--
var row = <?php echo $row; ?>;

function addRow() {
	html  = '<tbody id="row' + row + '">';
	html += '  <tr>';
	html += '    <td class="left">';
  html += '      <select name="hybrid_auth[' + row + '][provider]">';
                 <?php foreach ($providers as $provider) { ?>
  html += '        <option value="<?php echo $provider; ?>"><?php echo $provider; ?></option>';
                 <?php } ?>
  html += '      </select>';
  html += '    </td>';
	html += '    <td class="left">';
  html += '      <select name="hybrid_auth[' + row + '][enabled]">';
  html += '        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
  html += '        <option value="0"><?php echo $text_disabled; ?></option>';
  html += '      </select>';
  html += '    </td>';
	html += '    <td class="left"><input type="text" name="hybrid_auth[' + row + '][keys]" value="" size="50" /></td>';
	html += '    <td class="left"><input type="text" name="hybrid_auth[' + row + '][secret]" value="" size="50" /></td>';
	html += '    <td class="left"><input type="text" name="hybrid_auth[' + row + '][scope]" value="" size="50" /></td>';
	html += '    <td class="right"><input type="text" name="hybrid_auth[' + row + '][sort_order]" value="' + row + '" size="3" /></td>';
	html += '    <td class="left"><a onclick="$(\'#row' + row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';

	$('#module tfoot').before(html);

	row++;
}
//--></script>

<?php echo $footer; ?>
