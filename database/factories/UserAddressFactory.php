<?php

use Faker\Generator as Faker;

$factory->define(App\Models\UserAddress::class, function (Faker $faker) {
    $addresses = [
        ["台北市", "基隆市", "新北市"],
        ["連江縣", "宜蘭縣", "新竹市"],
        ["新竹縣", "桃園市", "苗栗縣"],
        ["台中市", "彰化縣", "南投縣"],
        ["嘉義市", "嘉義縣", "雲林縣"],
        ["台南市", "高雄市", "澎湖縣"],
        ["金門縣", "屏東縣", "台東縣"],
        ["花蓮縣"],
    ];
    $address   = $faker->randomElement($addresses);
    return [
        'nationality'   => $address[0],
        'city'          => $address[1],
        'district'      => $address[2],
        'address'       => sprintf('%d巷%d號', $faker->randomNumber(2), $faker->randomNumber(3)),
        'zip'           => $faker->postcode,
        'contact_name'  => $faker->name,
        'contact_phone' => $faker->phoneNumber,
    ];
});