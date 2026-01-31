<?php

namespace App\Filament\Clusters;

use BackedEnum;
use Filament\Clusters\Cluster;
use Filament\Support\Icons\Heroicon;

class Locations extends Cluster
{
    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-map';
}
