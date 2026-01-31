<?php

namespace App\Filament\Widgets;

use App\Models\Donor;
use App\Models\Order;
use App\Models\User;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class StatsOverview extends BaseWidget
{
    protected static ?int $sort = 1;

    protected function getStats(): array
    {
        $userTrend = $this->getTrendData(User::class);
        $requestTrend = $this->getTrendData(Order::class, 'date'); // Assuming Order uses 'date' column or created_at

        // For Available Donors, we can't easily show a history trend of "Availability", 
        // so we'll show the trend of NEW donors as a proxy for activity.
        $donorTrend = $this->getTrendData(Donor::class);

        return [
            Stat::make('Total Users', User::count())
                ->description('All registered users')
                ->descriptionIcon('heroicon-m-users')
                ->chart($userTrend)
                ->color('success'),
            Stat::make('Total Donors', Donor::count())
                ->description('All registered donors')
                ->descriptionIcon('heroicon-m-heart')
                ->chart($donorTrend)
                ->color('primary'),
            Stat::make('Available Donors', Donor::where('is_available', true)->count())
                ->description('Ready to donate')
                ->descriptionIcon('heroicon-m-hand-thumb-up')
                ->color('success'),
            Stat::make('Active Requests', Order::active()->count())
                ->description('Pending and upcoming')
                ->descriptionIcon('heroicon-m-clock')
                ->chart($requestTrend)
                ->color('warning'),
            Stat::make('Managed Requests', Order::managed()->count())
                ->description('Successfully managed')
                ->descriptionIcon('heroicon-m-check-circle')
                ->color('success'),
            Stat::make('Expired Requests', Order::expired()->count())
                ->description('Time passed unmanaged')
                ->descriptionIcon('heroicon-m-x-circle')
                ->color('danger'),
        ];
    }

    protected function getTrendData(string $model, string $dateColumn = 'created_at'): array
    {
        $data = $model::query()
            ->selectRaw("DATE($dateColumn) as date, COUNT(*) as count")
            ->where($dateColumn, '>=', now()->subDays(7)->toDateString())
            ->groupBy('date')
            ->orderBy('date')
            ->pluck('count', 'date')
            ->toArray();

        // Fill in missing days with 0
        $trend = [];
        for ($i = 6; $i >= 0; $i--) {
            $date = now()->subDays($i)->toDateString();
            $trend[] = $data[$date] ?? 0;
        }

        return $trend;
    }
}
