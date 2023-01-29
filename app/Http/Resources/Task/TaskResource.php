<?php

namespace App\Http\Resources\Task;

use Illuminate\Http\Resources\Json\JsonResource;

class TaskResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        $v = (object) $this->resource;

        $result = [
            'id' => $v->id ?? null,
            'title' => $v->title ?? null,
            'description' => $v->description ?? null,
            'created_at' => $v->created_at ?? null,
            'updated_at' => $v->updated_at ?? null,
        ];

        return $result;
    }
}
