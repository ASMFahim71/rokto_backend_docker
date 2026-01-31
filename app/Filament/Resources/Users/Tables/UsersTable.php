<?php

namespace App\Filament\Resources\Users\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Support\Enums\FontWeight;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Model;

class UsersTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('name')
                    ->label('Name')
                    ->icon('heroicon-o-user')
                    ->weight(FontWeight::Bold)
                    ->searchable()
                    ->sortable(),
                TextColumn::make('email')
                    ->label('Contact')
                    ->icon('heroicon-m-envelope')
                    ->description(fn(Model $record) => $record->phone)
                    ->searchable()
                    ->sortable(),
                TextColumn::make('bloodGroup.blood_group_name')
                    ->label('Blood Group')
                    ->badge()
                    ->color('danger')
                    ->sortable(),
                TextColumn::make('division.name')
                    ->label('Location')
                    ->description(fn(Model $record) => "{$record->district?->name}, {$record->upazila?->name}")
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true),
                TextColumn::make('created_at')
                    ->label('Joined')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                SelectFilter::make('blood_group_id')
                    ->label('Blood Group')
                    ->relationship('bloodGroup', 'blood_group_name')
                    ->searchable()
                    ->preload(),
                SelectFilter::make('division_id')
                    ->label('Division')
                    ->relationship('division', 'name')
                    ->searchable()
                    ->preload(),
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
