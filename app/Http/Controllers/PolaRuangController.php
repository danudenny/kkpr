<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Services\PolaRuangService;

class PolaRuangController extends Controller
{
    protected $polaRuangService;

    public function __construct(PolaRuangService $polaRuangService)
    {
        $this->polaRuangService = $polaRuangService;
    }

    public function index()
    {
        return $this->polaRuangService->getAll();
    }


    public function getNameObj()
    {
        return $this->polaRuangService->getNameObj();
    }

    public function getKecamatan()
    {
        return $this->polaRuangService->getKecamatan();
    }

    public function getJenisSarana()
    {
        return $this->polaRuangService->getJenisSarana();
    }

    public function search(Request $request)
    {
        return $this->polaRuangService->search($request);
    }
}
