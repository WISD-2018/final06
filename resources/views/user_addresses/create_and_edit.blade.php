@extends('layouts.app')
@section('title', ($address->id ? '修改': '新增') . '收货地址')

@section('content')
<div class="row">
<div class="col-lg-10 col-lg-offset-1">
<div class="panel panel-default">
  <div class="panel-heading">
    {{ $address->id ? '修改': '新增' }}收货地址
  </div>
  <div class="panel-body">
    @if (count($errors) > 0)
      <div class="alert alert-danger">
        <h4>錯誤</h4>
        <ul>
          @foreach ($errors->all() as $error)
            <li><i class="glyphicon glyphicon-remove"></i> {{ $error }}</li>
          @endforeach
        </ul>
      </div>
    @endif

    @if($address->id)
        <form class="form-horizontal" role="form" action="{{ route('user_addresses.update', ['user_address' => $address->id]) }}" method="post">
          {{ method_field('PUT') }}
    @else
    <form class="form-horizontal" role="form" action="{{ route('user_addresses.store') }}" method="post">
    @endif
      {{ csrf_field() }}
    
    <div class="form-group">
      <label class="control-label col-sm-2">國籍</label>
      <div class="col-sm-9">
        <input type="text" class="form-" name="nationality" value="{{ old('nationality', $address->nationality) }}">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2">市</label>
      <div class="col-sm-9">
        <input type="text" class="form-control" name="city" value="{{ old('city', $address->city) }}">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2">區</label>
      <div class="col-sm-9">
        <input type="text" class="form-control" name="district" value="{{ old('district', $address->district) }}">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2">詳細地址</label>
      <div class="col-sm-9">
        <input type="text" class="form-control" name="address" value="{{ old('address', $address->address) }}">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2">郵遞區號</label>
      <div class="col-sm-9">
        <input type="text" class="form-control" name="zip" value="{{ old('zip', $address->zip) }}">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2">姓名</label>
      <div class="col-sm-9">
        <input type="text" class="form-control" name="contact_name" value="{{ old('contact_name', $address->contact_name) }}">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2">電話</label>
      <div class="col-sm-9">
        <input type="text" class="form-control" name="contact_phone" value="{{ old('contact_phone', $address->contact_phone) }}">
      </div>
    </div>
    <div class="form-group text-center">
      <button type="submit" class="btn btn-primary">送出</button>
    </div>
  </form>
    
  </div>
</div>
</div>
</div>
@endsection 