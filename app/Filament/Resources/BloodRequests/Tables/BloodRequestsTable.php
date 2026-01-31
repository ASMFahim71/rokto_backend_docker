<?php

namespace App\Filament\Resources\BloodRequests\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Support\Enums\FontWeight;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Model;

class BloodRequestsTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('requester.name')
                    ->label('Requester')
                    ->icon('heroicon-o-user')
                    ->searchable()
                    ->sortable()
                    ->weight(FontWeight::Bold),
                TextColumn::make('bloodGroup.blood_group_name')
                    ->label('Blood Group')
                    ->badge()
                    ->color('danger')
                    ->sortable(),
                TextColumn::make('hospital_name')
                    ->label('Hospital')
                    ->icon('heroicon-m-building-office-2')
                    ->searchable(),
                TextColumn::make('date')
                    ->label('Date & Time')
                    ->date()
                    ->description(fn(Model $record) => $record->time)
                    ->sortable()
                    ->icon('heroicon-m-calendar'),
                TextColumn::make('division.name')
                    ->label('Location')
                    ->description(fn(Model $record) => "{$record->district?->name}, {$record->upazila?->name}"),
                TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
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
