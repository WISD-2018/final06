@extends('layouts.app')
@section('title', '驗證信箱提醒')

@section('content')
<div class="panel panel-default">
    <div class="panel-heading">驗證信箱提醒</div>
    <div class="panel-body text-center">
        <h1>請先驗證電子信箱</h1>
        <a class="btn btn-primary" href="{{ route('email_verification.send') }}">重新發送驗證信</a>
    </div>
</div>
@endsection