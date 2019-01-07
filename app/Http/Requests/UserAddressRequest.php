<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserAddressRequest extends FormRequest
{

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            //
            'nationality'   => 'required',
            'city'          => 'required',
            'district'      => 'required',
            'address'       => 'required',
            'zip'           => 'required',
            'contact_name'  => 'required',
            'contact_phone' => 'required',
        ];
    }

    public function attributes()
    {
        return [
            'nationality'   => '國籍',
            'city'          => '市',
            'district'      => '區',
            'address'       => '詳細地址',
            'zip'           => '郵遞區號',
            'contact_name'  => '姓名',
            'contact_phone' => '電話',
        ];
    }
}
