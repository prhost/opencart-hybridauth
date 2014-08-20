<!-- Paste this code in to your template -->

<?php if ($this->config->get('hybrid_auth_status')) { ?>
  <?php foreach ($this->config->get('hybrid_auth') as $config) { ?>
      <a href="<?php echo $this->url->link('hybrid/auth', 'provider=' . $config['provider']); ?>"><img src="<?php echo HTTPS_IMAGE . 'themezee_social_icons/' . strtolower($config['provider']); ?>.png" alt="<?php echo $config['provider']; ?>" title="<?php echo $config['provider']; ?>"/></a>
  <?php } ?>
<?php } ?>
