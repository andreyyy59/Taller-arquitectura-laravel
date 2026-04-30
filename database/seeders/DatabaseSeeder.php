<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder {
    public function run() {
        $year = date('Y');

        // User
        $user = \App\Models\User::firstOrCreate(
            ['email' => 'daniel@pixely.me'],
            [
                'name' => 'Daan',
                'password' => '$2y$12$eQ4s9CL8xg7Y6PoGNY4xuehr.d2u0e0VJ5CywkwqtQoyy/ntoP.pO' // hoi
            ]
        );

        // Space
        $space = \App\Models\Space::firstOrCreate(
            ['name' => 'Daan\'s Space'],
            ['currency_id' => 1]
        );

        if (!$user->spaces()->where('space_id', $space->id)->exists()) {
            $user->spaces()->attach($space);
        }

        // Widgets
        if ($user->widgets()->count() === 0) {
            (new \App\Actions\CreateDefaultWidgetsAction())->execute($user->id);
        }

        // Tags
        $tagBills = \App\Models\Tag::updateOrCreate(['space_id' => $space->id, 'name' => 'Bills'], ['color' => 'FF5733']);
        $tagFood = \App\Models\Tag::updateOrCreate(['space_id' => $space->id, 'name' => 'Food'], ['color' => '33FF57']);
        $tagTransport = \App\Models\Tag::updateOrCreate(['space_id' => $space->id, 'name' => 'Transport'], ['color' => '3357FF']);

        for ($i = 1; $i < 12; $i ++) {
            // Income
            \App\Models\Earning::create([
                'space_id' => $space->id,
                'happened_on' => $year . '-' . $i . '-24',
                'description' => 'Wage',
                'amount' => 25000
            ]);

            // Bills
            \App\Models\Spending::create([
                'space_id' => $space->id,
                'tag_id' => $tagBills->id,
                'happened_on' => $year . '-' . $i . '-01',
                'description' => 'Phone Subscription',
                'amount' => 2500
            ]);

            \App\Models\Spending::create([
                'space_id' => $space->id,
                'tag_id' => $tagBills->id,
                'happened_on' => $year . '-' . $i . '-01',
                'description' => 'Car Insurance',
                'amount' => 4500
            ]);

            // Food
            for ($j = 0; $j < rand(1, 10); $j ++) {
                \App\Models\Spending::create([
                    'space_id' => $space->id,
                    'tag_id' => $tagFood->id,
                    'happened_on' => $year . '-' . $i . '-' . rand(1, 28),
                    'description' => '-',
                    'amount' => 250 * rand(1, 5)
                ]);
            }

            // Transport
            for ($j = 0; $j < rand(1, 3); $j ++) {
                \App\Models\Spending::create([
                    'space_id' => $space->id,
                    'tag_id' => $tagTransport->id,
                    'happened_on' => $year . '-' . $i . '-' . rand(1, 28),
                    'description' => '-',
                    'amount' => 1000 * rand(1, 5)
                ]);
            }
        }
    }
}
