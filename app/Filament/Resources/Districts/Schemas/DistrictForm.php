<?php

namespace App\Filament\Resources\Districts\Schemas;

use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class DistrictForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                Select::make('division_id')
                    ->label('Division')
                    ->relationship('division', 'name')
                    ->searchable()
                    ->preload()
                    ->required(),
                TextInput::make('name')
                    ->required()
                    ->maxLength(255),
                TextInput::make('bn_name')
                    ->label('Bangla Name')
                    ->maxLength(255),
                TextInput::make('lat')
                    ->label('Latitude')
                    ->numeric(),
                TextInput::make('lon')
                    ->label('Longitude')
                    ->numeric(),
            ]);
    }
}
