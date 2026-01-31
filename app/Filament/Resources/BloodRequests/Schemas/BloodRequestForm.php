<?php

namespace App\Filament\Resources\BloodRequests\Schemas;

use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\TimePicker;
use Filament\Forms\Get;
use Filament\Forms\Set;
use Filament\Schemas\Components\Grid;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Schema;
use Illuminate\Database\Eloquent\Builder;

class BloodRequestForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                Section::make('Request Details')
                    ->icon('heroicon-m-document-text')
                    ->schema([
                        Grid::make(2)
                            ->schema([
                                Select::make('requester_id')
                                    ->label('Requester')
                                    ->relationship('requester', 'name')
                                    ->searchable()
                                    ->preload()
                                    ->required()
                                    ->prefixIcon('heroicon-m-user'),
                                Select::make('blood_group_id')
                                    ->label('Blood Group')
                                    ->relationship('bloodGroup', 'blood_group_name')
                                    ->searchable()
                                    ->preload()
                                    ->required()
                                    ->prefixIcon('heroicon-m-heart'),
                            ]),
                        Grid::make(3)
                            ->schema([
                                Select::make('gender')
                                    ->options([
                                        'Male' => 'Male',
                                        'Female' => 'Female',
                                        'Other' => 'Other',
                                    ])
                                    ->prefixIcon('heroicon-m-user-group'),
                                TextInput::make('hospital_name')
                                    ->maxLength(255)
                                    ->prefixIcon('heroicon-m-building-office-2'),
                                TextInput::make('contact_number')
                                    ->tel()
                                    ->maxLength(255)
                                    ->prefixIcon('heroicon-m-phone'),
                            ]),
                        Grid::make(2)
                            ->schema([
                                DatePicker::make('date')
                                    ->required()
                                    ->prefixIcon('heroicon-m-calendar'),
                                TimePicker::make('time')
                                    ->required()
                                    ->prefixIcon('heroicon-m-clock'),
                            ]),
                        Grid::make(1)
                            ->schema([
                                Textarea::make('cause')
                                    ->required()
                                    ->columnSpanFull(),
                                Textarea::make('place')
                                    ->required()
                                    ->columnSpanFull(),
                            ]),
                        Grid::make(1)
                            ->schema([
                                \Filament\Forms\Components\Toggle::make('is_managed')
                                    ->required()
                                    ->label('Is Managed'),
                            ]),
                    ]),
                Section::make('Location')
                    ->icon('heroicon-m-map-pin')
                    ->schema([
                        Grid::make(1)
                            ->schema([
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
