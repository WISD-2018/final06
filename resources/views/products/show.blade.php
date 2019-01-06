@extends('layouts.app')
@section('title', $product->title)

@section('content')
<div class="row">
<div class="col-lg-10 col-lg-offset-1">
<div class="panel panel-default">
  <div class="panel-body product-info">
    <div class="row">
      <div class="col-sm-5">
        <img class="cover" src="{{ $product->image_url }}" alt="">
      </div>
      <div class="col-sm-7">
        <div class="title">{{ $product->title }}</div>
        <div class="price"><label>價格</label><em> $ </em><span>{{ $product->price }}</span></div>
        <div class="sales_and_reviews">
          <div class="sold_count">累積銷售量 <span class="count">{{ $product->sold_count }}</span></div>
          <div class="review_count">累積評價 <span class="count">{{ $product->review_count }}</span></div>
          <div class="rating" title="评分 {{ $product->rating }}">評分 <span class="count">{{ str_repeat('★', floor($product->rating)) }}{{ str_repeat('☆', 5 - floor($product->rating)) }}</span></div>
        </div>
        <div class="skus">
          <label>選擇</label>
          <div class="btn-group" data-toggle="buttons">
          @foreach($product->skus as $sku)
            <label
                class="btn btn-default sku-btn"
                data-price="{{ $sku->price }}"
                data-stock="{{ $sku->stock }}"
                data-toggle="tooltip"
                title="{{ $sku->description }}"
                data-placement="bottom">
              <input type="radio" name="skus" autocomplete="off" value="{{ $sku->id }}"> {{ $sku->title }}
            </label>
          @endforeach
          </div>
        </div>
        <div class="cart_amount"><label>數量</label><input type="text" class="form-control input-sm" value="1"><span>件</span><span class="stock"></span></div>
        <div class="buttons">
          @if($favored)
            <button class="btn btn-danger btn-disfavor">取消收藏</button>
          @else
            <button class="btn btn-success btn-favor">❤ 收藏</button>
          @endif
          <button class="btn btn-primary btn-add-to-cart">加入購物車</button>
        </div>
      </div>
    </div>
    <div class="product-detail">
      <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#product-detail-tab" aria-controls="product-detail-tab" role="tab" data-toggle="tab">商品詳情</a></li>
        <li role="presentation"><a href="#product-reviews-tab" aria-controls="product-reviews-tab" role="tab" data-toggle="tab">使用者評價</a></li>
      </ul>
      <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="product-detail-tab">
          {!! $product->description !!}
        </div>
        <div role="tabpanel" class="tab-pane" id="product-reviews-tab">
        </div>
      </div>
    </div>
  </div>
</div>
</div>
</div>
@endsection

@section('scriptsAfterJs')
<script>

  $(document).ready(function () {
    $('[data-toggle="tooltip"]').tooltip({trigger: 'hover'});
    $('.sku-btn').click(function () {
      $('.product-info .price span').text($(this).data('price'));
      $('.product-info .stock').text('庫存' + $(this).data('stock') + '件');
    });
    
    $('.btn-favor').click(function () {
      axios.post('{{ route('products.favor', ['product' => $product->id]) }}')
        .then(function () {
          alert ('收藏成功', '', 'success');
          location.reload();
        }, function(error) {
          if (error.response && error.response.status === 401) {
            alert ('請先登入', '', 'error');
          } else if (error.response && error.response.data.msg) {
            alert(error.response.data.msg, '', 'error');
          } else {
            alert ('系統錯誤', '', 'error');
          }
        });
    });
    $('.btn-disfavor').click(function () {
      axios.delete('{{ route('products.disfavor', ['product' => $product->id]) }}')
        .then(function () {
          alert('已解除收藏', '', 'success');
          location.reload();
        });
    });

    $('.btn-add-to-cart').click(function () {
      axios.post('{{ route('cart.add') }}', {
        sku_id: $('label.active input[name=skus]').val(),
        amount: $('.cart_amount input').val(),
      })
        .then(function () { 
          alert('成功加入購物車', '', 'success')
            .then(function() {
              location.href = '{{ route('cart.index') }}';
            });
        }, function (error) {
          if (error.response.status === 401) {
            alert('請先登入', '', 'error');
          } else if (error.response.status === 422) {
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
        })
    });
  });
</script>
@endsection 