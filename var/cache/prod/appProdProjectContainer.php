<?php

// This file has been auto-generated by the Symfony Dependency Injection Component for internal use.

if (\class_exists(\Container9eixn54\appProdProjectContainer::class, false)) {
    // no-op
} elseif (!include __DIR__.'/Container9eixn54/appProdProjectContainer.php') {
    touch(__DIR__.'/Container9eixn54.legacy');

    return;
}

if (!\class_exists(appProdProjectContainer::class, false)) {
    \class_alias(\Container9eixn54\appProdProjectContainer::class, appProdProjectContainer::class, false);
}

return new \Container9eixn54\appProdProjectContainer([
    'container.build_hash' => '9eixn54',
    'container.build_id' => '4a0871f5',
    'container.build_time' => 1658741013,
], __DIR__.\DIRECTORY_SEPARATOR.'Container9eixn54');
