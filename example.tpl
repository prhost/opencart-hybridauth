<!-- Paste this code in to your template -->

<!-- Simpled Example -->
<?php if ($this->config->get('hybrid_auth_status')) { ?>
  <?php foreach ($this->config->get('hybrid_auth') as $config) { ?>
      <a href="<?php echo $this->url->link('hybrid/auth', 'provider=' . $config['provider']); ?>"><img src="<?php echo HTTPS_IMAGE . 'themezee_social_icons/' . strtolower($config['provider']); ?>.png" alt="<?php echo $config['provider']; ?>" title="<?php echo $config['provider']; ?>"/></a>
  <?php } ?>
<?php } ?>

<!-- Redirect Example -->
<?php if ($this->config->get('hybrid_auth_status')) { ?>
  <?php foreach ($this->config->get('hybrid_auth') as $config) { ?>
      <a onclick="window.open('<?php echo HTTPS_SERVER . 'index.php?route=hybrid/auth&source=product-review&provider=' . $config['provider']; ?>&redirect=<?php echo base64_encode($this->url->link('information/contact')); ?>', 'newwindow', 'width=700, height=450,top=200, left=600'); return false;" href="<?php echo HTTPS_SERVER . 'index.php?route=hybrid/auth&provider=' . $config['provider']; ?>&redirect=<?php echo base64_encode($this->url->link('information/contact')); ?>"><img src="<?php echo HTTPS_IMAGE . 'themezee_social_icons/' . strtolower($config['provider']); ?>.png" alt="<?php echo $config['provider']; ?>" title="<?php echo $config['provider']; ?>"/></a>
  <?php } ?>
<?php } ?>

<!-- Popup Example -->
<?php if ($this->config->get('hybrid_auth_status')) { ?>
  <?php foreach ($this->config->get('hybrid_auth') as $config) { ?>
      <a onclick="window.open('<?php echo HTTPS_SERVER . 'index.php?route=hybrid/auth&source=product-review&provider=' . $config['provider']; ?>&redirect=<?php echo base64_encode($this->url->link('hybrid/auth/success')); ?>', 'newwindow', 'width=700, height=450,top=200, left=600'); return false;" href="<?php echo HTTPS_SERVER . 'index.php?route=hybrid/auth&provider=' . $config['provider']; ?>&redirect=<?php echo base64_encode($this->url->link('hybrid/auth/success')); ?>"><img src="<?php echo HTTPS_IMAGE . 'themezee_social_icons/' . strtolower($config['provider']); ?>.png" alt="<?php echo $config['provider']; ?>" title="<?php echo $config['provider']; ?>"/></a>
  <?php } ?>
<?php } ?>
