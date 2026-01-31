<?php

namespace App\Filament\Resources\Donors\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Support\Enums\FontWeight;
use Filament\Tables\Columns\IconColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Filters\TernaryFilter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Model;

class DonorsTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('user.name')
                    ->label('Donor Name')
                    ->description(fn(Model $record) => $record->user->email ?? $record->user->phone)
                    ->searchable()
                    ->sortable()
                    ->weight(FontWeight::Bold)
                    ->icon('heroicon-o-user'),
                TextColumn::make('bloodGroup.blood_group_name')
                    ->label('Blood Group')
                    ->badge()
                    ->color('danger')
                    ->sortable(),
                TextColumn::make('user.division.name')
                    ->label('Location')
                    ->description(fn(Model $record) => "{$record->user->district->name}, {$record->user->upazila->name}")
                    ->icon('heroicon-m-map-pin')
                    ->toggleable(),
                TextColumn::make('last_donation_date')
                    ->label('Last Donation')
                    ->date()
                    ->sortable()
                    ->icon('heroicon-m-calendar-days'),
                TextColumn::make('donation_count')
                    ->label('Count')
                    ->alignCenter()
                    ->sortable(),
                IconColumn::make('is_available')
                    ->label('Available')
                    ->boolean()
                    ->trueIcon('heroicon-o-check-circle')
                    ->falseIcon('heroicon-o-x-circle')
                    ->trueColor('success')
                    ->falseColor('danger')
                    ->alignCenter(),
            ])
            ->filters([
                SelectFilter::make('blood_group_id')
                    ->label('Blood Group')
                    ->relationship('bloodGroup', 'blood_group_name'),
                TernaryFilter::make('is_available')
                    ->label('Availability'),
            ])
            ->recordActions([
                EditAction::make(),
                DeleteAction::make(),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }
}
