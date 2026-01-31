<?php

namespace App\Filament\Resources\Upazilas;

use App\Filament\Clusters\Locations;
use App\Filament\Resources\Upazilas\Pages\CreateUpazila;
use App\Filament\Resources\Upazilas\Pages\EditUpazila;
use App\Filament\Resources\Upazilas\Pages\ListUpazilas;
use App\Filament\Resources\Upazilas\Schemas\UpazilaForm;
use App\Filament\Resources\Upazilas\Tables\UpazilasTable;
use App\Models\Upazila;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Tables\Table;

class UpazilaResource extends Resource
{
    protected static ?string $model = Upazila::class;

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-map-pin';

    protected static ?string $cluster = Locations::class;

    public static function form(Schema $schema): Schema
    {
        return UpazilaForm::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return UpazilasTable::configure($table);
    }

    public static function getPages(): array
    {
        return [
            'index' => ListUpazilas::route('/'),
            'create' => CreateUpazila::route('/create'),
            'edit' => EditUpazila::route('/{record}/edit'),
        ];
    }
}
