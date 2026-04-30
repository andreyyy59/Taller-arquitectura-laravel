<?php
require __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

use App\Models\Tag;

Tag::where('name', 'Bills')->where('color', '')->update(['color' => 'FF5733']);
Tag::where('name', 'Food')->where('color', '')->update(['color' => '33FF57']);
Tag::where('name', 'Transport')->where('color', '')->update(['color' => '3357FF']);

echo "Tags updated.\n";
