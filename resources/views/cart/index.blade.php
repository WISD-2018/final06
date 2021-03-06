@extends('layouts.app')
@section('title', '購物車')

@section('content')
<div class="row">
<div class="col-lg-10 col-lg-offset-1">
<div class="panel panel-default">
  <div class="panel-heading">我的購物車</div>
  <div class="panel-body">
    <table class="table table-striped">
      <thead>
      <tr>
        <th><input type="checkbox" id="select-all"></th>
        <th>商品消息</th>
        <th>價格</th>
        <th>數量</th>
        <th>動作</th>
      </tr>
      </thead>
      <tbody class="product_list">
      @foreach($cartItems as $item)
        <tr data-id="{{ $item->productSku->id }}">
          <td>
            <input type="checkbox" name="select" value="{{ $item->productSku->id }}" {{ $item->productSku->product->on_sale ? 'checked' : 'disabled' }}>
          </td>
          <td class="product_info">
            <div class="preview">
              <a target="_blank" href="{{ route('products.show', [$item->productSku->product_id]) }}">
                <img src="{{ $item->productSku->product->image_url }}">
              </a>
            </div>
            <div @if(!$item->productSku->product->on_sale) class="not_on_sale" @endif>
              <span class="product_title">
                <a target="_blank" href="{{ route('products.show', [$item->productSku->product_id]) }}">{{ $item->productSku->product->title }}</a>
              </span>
              <span class="sku_title">{{ $item->productSku->title }}</span>
              @if(!$item->productSku->product->on_sale)
                <span class="warning">該商品已下架</span>
              @endif
            </div>
          </td>
          <td><span class="price"> $ {{ $item->productSku->price }}</span></td>
          <td>
            <input type="text" class="form-control input-sm amount" @if(!$item->productSku->product->on_sale) disabled @endif name="amount" value="{{ $item->amount }}">
          </td>
          <td>
            <button class="btn btn-xs btn-danger btn-remove">刪除</button>
          </td>
        </tr>
      @endforeach
      </tbody>
    </table>
    <div>
      <form class="form-horizontal" role="form" id="order-form">
        <div class="form-group">
          <label class="control-label col-sm-3">選擇收貨地址</label>
          <div class="col-sm-9 col-md-7">
            <select class="form-control" name="address">
              @foreach($addresses as $address)
                <option value="{{ $address->id }}">{{ $address->full_address }} {{ $address->contact_name }} {{ $address->contact_phone }}</option>
              @endforeach
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">備註欄</label>
          <div class="col-sm-9 col-md-7">
            <textarea name="remark" class="form-control" rows="3"></textarea>
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-3 col-sm-3">
            <button type="button" class="btn btn-primary btn-create-order">送出訂單</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
</div>
</div>
@endsection

@section('scriptsAfterJs')
<script>
  $(document).ready(function () {
    $('.btn-remove').click(function () {
      var id = $(this).closest('tr').data('id');
      if (confirm('確定要從購物車刪除此商品 ! !')) {
        axios.delete('/cart/' + id)
          .then(function () {
            location.reload();
        });
      } else return;
    });

    $('#select-all').change(function() {
      var checked = $(this).prop('checked');
      $('input[name=select][type=checkbox]:not([disabled])').each(function() {
        $(this).prop('checked', checked);
      });
    });


    $('.btn-create-order').click(function () {
    var req = {
      address_id: $('#order-form').find('select[name=address]').val(),
      items: [],
      remark: $('#order-form').find('textarea[name=remark]').val(),
    };

    $('table tr[data-id]').each(function () {
      var $checkbox = $(this).find('input[name=select][type=checkbox]');
      if ($checkbox.prop('disabled') || !$checkbox.prop('checked')) {
        return;
      }
      var $input = $(this).find('input[name=amount]');
      if ($input.val() == 0 || isNaN($input.val())) {
        return;
      }
      req.items.push({
        sku_id: $(this).data('id'),
        amount: $input.val(),
      })
    });
    axios.post('{{ route('orders.store') }}', req)
      .then(function (response) {
        alert('訂單送出成功', '', 'success');
        location.href = '/orders/' + response.data.id;
      }, function (error) {
        if (error.response.status === 422) {
          var html = '<div>';
          _.each(error.response.data.errors, function (errors) {
            _.each(errors, function (error) {
              html += error+'<br>';
            })
          });
          html += '</div>';
          alert({content: $(html)[0], icon: 'error'})
        } else {
          alert('系統錯誤', '', 'error');
        }
      });
  });
});
</script>
@endsection 