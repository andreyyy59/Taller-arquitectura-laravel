<?php
require __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

use App\Models\Tag;
use App\Models\Space;

$tags = Tag::all();
echo "Total tags: " . $tags->count() . "\n";
foreach ($tags as $tag) {
    echo "ID: {$tag->id}, Name: '{$tag->name}', Color: '{$tag->color}', Space ID: {$tag->space_id}\n";
}

$spaces = Space::all();
echo "Total spaces: " . $spaces->count() . "\n";
foreach ($spaces as $space) {
    echo "ID: {$space->id}, Name: '{$space->name}'\n";
}
