<?php

namespace App\Http\Services;

use App\Models\PolaRuang;
use DB;

class PolaRuangService
{
    public function getAll()
    {
        $polaRuang = PolaRuang::paginate(10);

        return $polaRuang;
    }

    public function search($request) {
        $polaRuang = PolaRuang::query();

        $polaRuang->when($request->nameObj, function ($query, $keyword) {
            return $query->where('namobj', $keyword);
        });
        $polaRuang->when($request->kecamatan, function ($query, $keyword) {
            return $query->where('wadmkc', $keyword);
        });
        $polaRuang->when($request->jenisSarana, function ($query, $keyword) {
            return $query->where('jnsspr', $keyword);
        });

        return $polaRuang->paginate(10);
    }

    public function getNameObj()
    {
        $polaRuang = DB::table('polaruang_rtrwbanyuasin')
            ->select('namobj')
            ->groupBy('namobj')
            ->get();

        return $polaRuang;
    }

    public function getKecamatan()
    {
        $polaRuang = DB::table('polaruang_rtrwbanyuasin')
            ->select('wadmkc')
            ->where('wadmkc', '!=', 'null')
            ->groupBy('wadmkc')
            ->get();

        return $polaRuang;
    }

    public function getJenisSarana()
    {
        $polaRuang = DB::table('polaruang_rtrwbanyuasin')
            ->select('jnsspr')
            ->where('jnsspr', '!=', 'null')
            ->groupBy('jnsspr')
            ->get();

        return $polaRuang;
    }
}
