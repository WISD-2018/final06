@extends('layouts.app')
@section('title', '收貨地址列表')

@section('content')
<div class="row">
<div class="col-lg-10 col-lg-offset-1">
<div class="panel panel-default">
  <div class="panel-heading">
    收貨地址列表
    <a href="{{ route('user_addresses.create') }}" class="pull-right">新增收貨地址  </a>
  </div>
  <div class="panel-body">
    <table class="table table-bordered table-striped">
      <thead>
      <tr>
        <th>收貨人</th>
        <th>地址</th>
        <th>郵遞區號</th>
        <th>電話</th>
        <th>Action</th>
      </tr>
      </thead>
      <tbody>
      @foreach($addresses as $address)
      <tr>
        <td>{{ $address->contact_name }}</td>
        <td>{{ $address->full_address }}</td>
        <td>{{ $address->zip }}</td>
        <td>{{ $address->contact_phone }}</td>
        <td>
          <a href="{{ route('user_addresses.edit', ['user_address' => $address->id]) }}" class="btn btn-primary">修改</a>
          <button class="btn btn-danger btn-del-address" type="button" data-id="{{ $address->id }}">删除</button>
        </td>
      </tr>
      @endforeach
      </tbody>
    </table>
  </div>
</div>
</div>
</div>
@endsection
@section('scriptsAfterJs')
<script>
$(document).ready(function() {
  $('.btn-del-address').click(function() {
    var id = $(this).data('id');
    if (confirm('確定要刪除該地址 ! !')) {
        axios.delete('/user_addresses/' + id)
          .then(function () {
            location.reload();
        });
      } else return;
  });
});
</script>
@endsection