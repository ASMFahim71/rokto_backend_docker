<?php

namespace App\Filament\Resources\Users\Schemas;

use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Get;
use Filament\Forms\Set;
use Filament\Schemas\Components\Grid;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Schema;
use Illuminate\Database\Eloquent\Builder;

class UserForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                Section::make('Basic Information')
                    ->icon('heroicon-m-user')
                    ->schema([
                        Grid::make(2)
                            ->schema([
                                TextInput::make('name')
                                    ->required()
                                    ->maxLength(255)
                                    ->prefixIcon('heroicon-m-user'),
                                TextInput::make('email')
                                    ->email()
                                    ->required()
                                    ->unique(ignoreRecord: true)
                                    ->prefixIcon('heroicon-m-envelope'),
                                TextInput::make('phone')
                                    ->tel()
                                    ->required()
                                    ->unique(ignoreRecord: true)
                                    ->prefixIcon('heroicon-m-phone'),
                                TextInput::make('password')
                                    ->password()
                                    ->minLength(8)
                                    ->required(fn($record) => $record === null)
                                    ->dehydrated(fn($state) => filled($state))
                                    ->prefixIcon('heroicon-m-lock-closed'),
                            ]),
                    ]),
                Section::make('Location & Details')
                    ->icon('heroicon-m-map-pin')
                    ->schema([
                        Grid::make(2)
                            ->schema([
                                Select::make('blood_group_id')
                                    ->label('Blood Group')
                                    ->relationship('bloodGroup', 'blood_group_name')
                                    ->searchable()
                                    ->preload()
                                    ->prefixIcon('heroicon-m-heart'),
                                Select::make('division_id')
                                    ->label('Division')
                                    ->relationship('division', 'name')
                                    ->searchable()
                                    ->preload()
                                    ->live()
                                    ->afterStateUpdated(fn($set) => $set('district_id', null))
                                    ->prefixIcon('heroicon-m-map'),
                                Select::make('district_id')
                                    ->label('District')
                                    ->relationship('district', 'name', modifyQueryUsing: fn(Builder $query, $get) => $query->where('division_id', $get('division_id')))
                                    ->searchable()
                                    ->preload()
                                    ->live()
                                    ->afterStateUpdated(fn($set) => $set('upazila_id', null))
                                    ->prefixIcon('heroicon-m-map'),
                                Select::make('upazila_id')
                                    ->label('Upazila')
                                    ->relationship('upazila', 'name', modifyQueryUsing: fn(Builder $query, $get) => $query->where('district_id', $get('district_id')))
                                    ->searchable()
                                    ->preload()
                                    ->prefixIcon('heroicon-m-map'),
                            ]),
                    ]),
            ]);
    }
}
