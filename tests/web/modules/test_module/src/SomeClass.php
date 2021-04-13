<?php

namespace Drupal\some_module;

use Drupal\Core\Form\FormBase;
use Drupal\Core\Form\FormStateInterface;

class SomeClass extends FormBase {

  /**
   * Calling deprecated method.
   */
  public function someMethod() {
    $this->getUrlGenerator();
  }

  /**
   * {@inheritdoc}
   */
  public function getFormId() {
    return 'something';
  }

  /**
   * {@inheritdoc}
   */
  public function buildForm(array $form, FormStateInterface $form_state) {
  }

  /**
   * {@inheritdoc}
   */
  public function submitForm(array &$form, FormStateInterface $form_state) {
  }

}
