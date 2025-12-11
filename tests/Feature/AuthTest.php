<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\User;

class AuthTest extends TestCase
{
    use RefreshDatabase;

    public function test_user_can_register()
    {
        $response = $this->postJson('/api/register', [
            'name' => 'Test User',
            'phone' => '0123456789',
            'email' => 'test@example.com', // Adding email just in case validation changes back or DB requires it
            'password' => 'password',
        ]);

        $response->assertStatus(200)
            ->assertJsonStructure([
                'user',
                'token',
            ]);

        $this->assertDatabaseHas('users', [
            'phone' => '0123456789',
        ]);
    }

    public function test_user_can_login()
    {
        $user = User::factory()->create([
            'phone' => '0123456789',
            'password' => 'password', // Factory usually hashes this
        ]);

        $response = $this->postJson('/api/login', [
            'phone' => '0123456789',
            'password' => 'password',
        ]);

        $response->assertStatus(200)
            ->assertJsonStructure([
                'user',
                'token',
            ]);
    }

    public function test_login_fails_with_invalid_credentials()
    {
        $user = User::factory()->create([
            'phone' => '0123456789',
            'password' => 'password',
        ]);

        $response = $this->postJson('/api/login', [
            'phone' => '0123456789',
            'password' => 'wrong-password',
        ]);

        $response->assertStatus(401)
            ->assertJson([
                'message' => 'Invalid credentials',
            ]);
    }
}
