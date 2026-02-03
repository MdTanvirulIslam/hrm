<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class EmailTemplate extends Model
{
    protected $fillable = [
        'name',
        'from',
        'slug',
        'created_by',
    ];

    /*public function template()
    {
        return $this->hasOne('App\Models\UserEmailTemplate', 'template_id', 'id')->where('user_id', '=', \Auth::user()->id);
    }*/

    public function userTemplate($userId = null)
    {
        $userId = $userId ?: (\Auth::check() ? \Auth::user()->id : null);

        return $this->hasOne('App\Models\UserEmailTemplate', 'template_id', 'id')
            ->where('user_id', $userId);
    }

// Or keep the original but fix the eager loading issue
    public function template()
    {
        // Don't use \Auth::user() in the relationship definition
        // Instead, constrain it when querying
        return $this->hasOne('App\Models\UserEmailTemplate', 'template_id', 'id');
    }
}
