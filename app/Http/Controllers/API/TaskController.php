<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\Task\TaskCollection;
use App\Http\Resources\Task\TaskResource;
use App\Models\Task;
use Illuminate\Http\Request;

class TaskController extends Controller
{
    public function index(): TaskCollection
    {
        $model = Task::all();

        return new TaskCollection($model);
    }

    public function get(int $id): TaskResource
    {
        $model = Task::findOrFail($id);

        return new TaskResource($model);
    }
    public function post(Request $request): TaskResource
    {
        $model = Task::create($request->all());

        return new TaskResource($model);
    }
    public function put(Request $request, int $id): TaskResource
    {
        $model = Task::update($request->all());

        return new TaskResource($model);
    }

    public function del(int $id)
    {
        Task::destroy($id);
    }
}
