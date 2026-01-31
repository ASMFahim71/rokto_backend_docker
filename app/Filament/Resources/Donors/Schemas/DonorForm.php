<?php

namespace App\Filament\Resources\Donors\Schemas;

use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Schemas\Components\Grid;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Schema;

class DonorForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                Section::make('Donor Information')
                    ->icon('heroicon-m-user-circle')
                    ->schema([
                        Grid::make(2)
                            ->schema([
                                Select::make('user_id')
                                    ->label('User')
                                    ->relationship('user', 'name')
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
                                DatePicker::make('last_donation_date')
                                    ->label('Last Donation Date')
                                    ->maxDate(now())
                                    ->prefixIcon('heroicon-m-calendar'),
                                TextInput::make('donation_count')
                                    ->label('Total Donations')
                                    ->numeric()
                                    ->default(0)
                                    ->minValue(0)
                                    ->prefixIcon('heroicon-m-hashtag'),
                                Toggle::make('is_available')
                                    ->label('Available to Donate')
                                    ->default(true)
                                    ->inline(false)
                                    ->onColor('success')
                                    ->offColor('danger'),
                            ]),
                    ]),
            ]);
    }
}
