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

class ControllerModuleHybridAuth extends Controller {

    // Presets
    private $error = array();

    public function index() {

        // Load Dependencies
        $this->load->language('module/hybrid_auth');
        $this->load->model('setting/setting');

        // Save Incoming Data
        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            
            // todo: add sort_order support
            $this->model_setting_setting->editSetting('hybrid_auth', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }

        // Language Init
        $this->data['heading_title'] = strip_tags($this->language->get('heading_title'));

        $this->data['text_enabled'] = $this->language->get('text_enabled');
        $this->data['text_disabled'] = $this->language->get('text_disabled');
        $this->data['text_copyright'] = sprintf($this->language->get('text_copyright'), date('Y'));

        $this->data['entry_status'] = $this->language->get('entry_status');
        $this->data['entry_debug'] = $this->language->get('entry_debug');

        $this->data['entry_provider'] = $this->language->get('entry_provider');
        $this->data['entry_key'] = $this->language->get('entry_key');
        $this->data['entry_secret'] = $this->language->get('entry_secret');
        $this->data['entry_scope'] = $this->language->get('entry_scope');
        $this->data['entry_sort_order'] = $this->language->get('entry_sort_order');

        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_cancel'] = $this->language->get('button_cancel');
        $this->data['button_add_row'] = $this->language->get('button_add_row');
        $this->data['button_remove'] = $this->language->get('button_remove');

        // Process Errors
         if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        // Generate Breadcrumbs
        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_module'),
            'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['breadcrumbs'][] = array(
            'text'      => str_replace('Beta', '', $this->language->get('heading_title')),
            'href'      => $this->url->link('module/hybrid_auth', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        // Set Page Title
        $this->document->setTitle(str_replace('Beta', '', strip_tags($this->language->get('heading_title'))));

        // Load Providers
        $this->data['providers'] = array();

        if (is_dir(DIR_SYSTEM . '/library/Hybrid/Providers')) {
            $providers = scandir(DIR_SYSTEM . '/library/Hybrid/Providers');

            if (count($providers)) {
                foreach ($providers as $provider) {
                    if ($provider != '.' && $provider != '..') {
                        $this->data['providers'][] = str_replace('.php', '', $provider);
                    }
                }
            }
        }

        // Basic Variables
        $this->data['action'] = $this->url->link('module/hybrid_auth', 'token=' . $this->session->data['token'], 'SSL');
        $this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        // Process Variables
        if (isset($this->request->post['hybrid_auth'])) {
            $this->data['hybrid_auth_items'] = $this->request->post['hybrid_auth'];
        } elseif ($this->config->get('hybrid_auth')) {
            $this->data['hybrid_auth_items'] = $this->config->get('hybrid_auth');
        } else {
            $this->data['hybrid_auth_items'] = array();
        }

        if (isset($this->request->post['hybrid_auth_debug'])) {
            $this->data['hybrid_auth_debug'] = $this->request->post['hybrid_auth_debug'];
        } elseif ($this->config->get('hybrid_auth_debug')) {
            $this->data['hybrid_auth_debug'] = $this->config->get('hybrid_auth_debug');
        } else {
            $this->data['hybrid_auth_debug'] = 0;
        }

        if (isset($this->request->post['hybrid_auth_status'])) {
            $this->data['hybrid_auth_status'] = $this->request->post['hybrid_auth_status'];
        } elseif ($this->config->get('hybrid_auth_status')) {
            $this->data['hybrid_auth_status'] = $this->config->get('hybrid_auth_status');
        } else {
            $this->data['hybrid_auth_status'] = 0;
        }

        // Load Template
        $this->template = 'module/hybrid_auth.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        // Rendering
        $this->response->setOutput($this->render());
    }

    private function validate() {

        // Check Permissions
        if (!$this->user->hasPermission('modify', 'module/account')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }
}
