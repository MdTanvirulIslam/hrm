<?php

namespace App\Providers;

use Google\Client;
use Google\Service\Drive;
use Illuminate\Filesystem\FilesystemAdapter;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\ServiceProvider;
use League\Flysystem\Filesystem;
use Masbug\Flysystem\GoogleDriveAdapter;

class GoogleDriveServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        Storage::extend('google', function ($app, $config) {

            $client = new Client();
            $client->setClientId($config['clientId']);
            $client->setClientSecret($config['clientSecret']);

            // Step 1: Set the refresh token on the client
            $client->setAccessType('offline');

            // Step 2: Fetch a new access token using the refresh token
            $token = $client->fetchAccessTokenWithRefreshToken($config['refreshToken']);

            // Step 3: Apply the retrieved access token back to the client
            if (isset($token['access_token'])) {
                $client->setAccessToken($token);
            } else {
                \Log::error('[GoogleDrive] Failed to get access token', $token);
                throw new \RuntimeException(
                    'Google Drive: Could not obtain access token. Error: ' .
                    ($token['error'] ?? 'unknown') . ' — ' .
                    ($token['error_description'] ?? '')
                );
            }

            $service  = new Drive($client);
            $folderId = !empty($config['folder']) ? $config['folder'] : 'root';

            $adapter    = new GoogleDriveAdapter($service, $folderId);
            $filesystem = new Filesystem($adapter);

            return new FilesystemAdapter($filesystem, $adapter, $config);
        });
    }

    public function register(): void {}
}
