<?php

namespace Database\Seeders;

use Spatie\Permission\Models\Permission;

class PermissionSeeder
{
    public function run()
    {
        $permissions = [
            'Manage Invoice',
            'Create Invoice',
            'Edit Invoice',
            'Delete Invoice',
            'Show Invoice',
        ];

        foreach ($permissions as $permission) {
            Permission::create(['name' => $permission]);
        }
    }
}
