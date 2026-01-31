<?php

namespace App\Filament\Resources\BloodRequests;

use App\Filament\Resources\BloodRequests\Pages\CreateBloodRequest;
use App\Filament\Resources\BloodRequests\Pages\EditBloodRequest;
use App\Filament\Resources\BloodRequests\Pages\ListBloodRequests;
use App\Filament\Resources\BloodRequests\Schemas\BloodRequestForm;
use App\Filament\Resources\BloodRequests\Tables\BloodRequestsTable;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class BloodRequestResource extends Resource
{
    protected static ?string $model = \App\Models\Order::class;

    protected static ?string $navigationLabel = 'Blood Requests';

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    protected static ?string $recordTitleAttribute = 'hospital_name';

    public static function form(Schema $schema): Schema
    {
        return BloodRequestForm::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return BloodRequestsTable::configure($table);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => ListBloodRequests::route('/'),
            'create' => CreateBloodRequest::route('/create'),
            'edit' => EditBloodRequest::route('/{record}/edit'),
        ];
    }
}
