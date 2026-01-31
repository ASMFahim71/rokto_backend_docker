<?php

namespace App\Filament\Resources\Divisions\Schemas;

use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class DivisionForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('name')
                    ->required()
                    ->maxLength(255)
                    ->unique(ignoreRecord: true),
                TextInput::make('bn_name')
                    ->label('Bangla Name')
                    ->maxLength(255),
            ]);
    }
}
