<?php

namespace App\Http\Requests;

use Illuminate\Validation\Rule;
use App\Models\ProductSku;

class OrderRequest extends Request
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'address_id'     => ['required', Rule::exists('user_addresses', 'id')->where('user_id', $this->user()->id)],
            'items'          => ['required', 'array'],
            'items.*.sku_id' => [ 
            'required',
                function ($attribute, $value, $fail) {
                    if (!$sku = ProductSku::find($value)) {
                        $fail('商品不存在');
                    }
                    if (!$sku->product->on_sale) {
                        $fail('商品未上架');
                    }
                    if ($sku->stock === 0) {
                        $fail('商品已售完');
                    }
                    preg_match('/items\.(\d+)\.sku_id/', $attribute, $m);
                    $index  = $m[1];
                    $amount = $this->input('items')[$index]['amount'];
                    if (is_int($amount) && $amount > $sku->stock) {
                        $fail('商品庫存不足');
                    }
                },
            ],
            'items.*.amount' => ['required', 'integer', 'min:1'],
        ];
    }
}
