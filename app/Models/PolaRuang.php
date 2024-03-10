<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PolaRuang extends Model
{
    use HasFactory;

    protected $table = 'polaruang_rtrwbanyuasin';

    protected $primaryKey = 'gid';

    protected $hidden = [
        'geom'
    ];

    protected $fillable = [
        'orde1',
        'orde2',
        'orde3',
        'orde4',
        'jnsspr',
        'wadmkk',
        'wadmkc',
        'kkop',
        'krb',
        'kp2b',
        'luas',
        'namobj',
        'ketobj',
        'geom'
    ];

    public $timestamps = false;

}
