@extends('layouts.app')
@section('title', '訂單列表')

@section('content')
<div class="row">
<div class="col-lg-10 col-lg-offset-1">
<div class="panel panel-default">
  <div class="panel-heading">訂單列表</div>
  <div class="panel-body">
    <ul class="list-group">
      @foreach($orders as $order)
      <li class="list-group-item">
        <div class="panel panel-default">
          <div class="panel-heading">
            訂單編號：{{ $order->no }}
            <span class="pull-right">{{ $order->created_at->format('Y-m-d H:i:s') }}</span>
          </div>
          <div class="panel-body">
            <table class="table">
              <thead>
                <tr>
                  <th>商品消息</th>
                  <th class="text-center">價格</th>
                  <th class="text-center">數量</th>
                  <th class="text-center">訂單總金額</th>
                  <th class="text-center">訂單狀態</th>
                  <th class="text-center">Action</th>
                </tr>
              </thead>
              @foreach($order->items as $index => $item)
              <tr>
                <td class="product-info">
                  <div class="preview">
                    <a target="_blank" href="{{ route('products.show', [$item->product_id]) }}">
                      <img src="{{ $item->product->image_url }}">
                    </a>
                  </div>
                  <div>
                    <span class="product-title">
                       <a target="_blank" href="{{ route('products.show', [$item->product_id]) }}">{{ $item->product->title }}</a>
                     </span>
                    <span class="sku-title">{{ $item->productSku->title }}</span>
                  </div>
                </td>
                <td class="sku-price text-center"> $ {{ $item->price }}</td>
                <td class="sku-amount text-center">{{ $item->amount }}</td>
                @if($index === 0)
                <td rowspan="{{ count($order->items) }}" class="text-center total-amount"> $ {{ $order->total_amount }}</td>
                <td rowspan="{{ count($order->items) }}" class="text-center">
                  @if($order->paid_at)
                    @if($order->refund_status === \App\Models\Order::REFUND_STATUS_PENDING)
                      已付款
                    @else
                      {{ \App\Models\Order::$refundStatusMap[$order->refund_status] }}
                    @endif
                  @elseif($order->closed)
                    已關閉訂單
                  @else
                    未支付<br>
                    請於 {{ $order->created_at->addSeconds(config('app.order_ttl'))->format('H:i') }} 前完成付款<br>
                    否則訂單將自動關閉
                  @endif
                </td>
                <td rowspan="{{ count($order->items) }}" class="text-center"><a class="btn btn-primary btn-xs" href="">查看訂單</a></td>
                @endif
              </tr>
              @endforeach
            </table>
          </div>
        </div>
      </li>
      @endforeach
    </ul>
    <div class="pull-right">{{ $orders->render() }}</div>
  </div>
</div>
</div>
</div>
@endsection 