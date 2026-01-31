<?php

namespace App\Filament\Resources\Upazilas\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Table;

class UpazilasTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('name')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('bn_name')
                    ->label('Bangla Name')
                    ->searchable(),
                TextColumn::make('district.name')
                    ->label('District')
                    ->sortable(),
                TextColumn::make('district.division.name')
                    ->label('Division')
                    ->sortable(),
            ])
            ->filters([
                SelectFilter::make('district_id')
                    ->relationship('district', 'name')
                    ->label('District')
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
