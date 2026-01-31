<?php

namespace App\Filament\Resources\Upazilas\Schemas;

use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;
use Illuminate\Database\Eloquent\Builder;

class UpazilaForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                Select::make('division_id')
                    ->label('Division')
                    ->relationship('district.division', 'name')
                    ->afterStateUpdated(fn($set) => $set('district_id', null))
                    ->live()
                    ->dehydrated(false)
                    ->selectablePlaceholder(false),
                Select::make('district_id')
                    ->label('District')
                    ->relationship('district', 'name', modifyQueryUsing: fn(Builder $query, $get) => $query->where('division_id', $get('division_id')))
                    ->searchable()
                    ->preload()
                    ->required(),
                TextInput::make('name')
                    ->required()
                    ->maxLength(255),
                TextInput::make('bn_name')
                    ->label('Bangla Name')
                    ->maxLength(255),
            ]);
    }
}
