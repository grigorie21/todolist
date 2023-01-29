<?php

namespace App\Http\Resources\Task;

use App\Http\Resources\Task\TaskResource;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;

class TaskCollection extends ResourceCollection
{
    public $collects = TaskResource::class;

    /**
     * @param Request $request
     */
    public function toArray($request): array
    {
        return [
            'success' => true,
            'data' => $this->collection,
        ];
    }

    public function withResponse($request, $response): void
    {
        $response->setStatusCode(200);
    }
}
