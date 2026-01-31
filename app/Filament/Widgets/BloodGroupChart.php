<?php

namespace App\Filament\Widgets;

use App\Models\BloodGroup;
use Filament\Widgets\ChartWidget;

class BloodGroupChart extends ChartWidget
{
    protected ?string $heading = 'Users by Blood Group';

    protected static ?int $sort = 2;

    protected function getData(): array
    {
        $data = BloodGroup::withCount('users')->get();

        return [
            'datasets' => [
                [
                    'label' => 'Users',
                    'data' => $data->pluck('users_count'),
                    'backgroundColor' => '#EF4444', // Red-500
                ],
            ],
            'labels' => $data->pluck('blood_group_name'),
        ];
    }

    protected function getType(): string
    {
        return 'bar';
    }
}
