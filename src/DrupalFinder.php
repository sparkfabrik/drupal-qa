<?php

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Input\InputArgument;

class DrupalFinder extends Command {

  protected static $defaultName = 'finddrupal';

  /**
   * {@inheritdoc}
   */
  protected function configure() {
    $this->addArgument(
        'paths',
        InputArgument::REQUIRED | InputArgument::IS_ARRAY,
        'Folder to look into. (separate multiple paths with a space)'
      );
  }

  /**
   * {@inheritdoc}
   */
  protected function execute(InputInterface $input, OutputInterface $output) {
    $paths = $input->getArgument('paths');
    $drupalFinder = new \DrupalFinder\DrupalFinder();
    $drupalRoot = NULL;
    foreach ($paths as $path_to_look_into) {
      if ($drupalFinder->locateRoot($path_to_look_into)) {
        $drupalRoot = $drupalFinder->getDrupalRoot();
        break;
      }
    }
    if (!$drupalRoot) {
     return Command::FAILURE;
    }
    $output->write($drupalRoot);
    return Command::SUCCESS;
  }
}
