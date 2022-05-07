<?php

namespace app\mobile\validate;

use think\Validate;

class MemberValidate extends Validate
{
    protected $rule = [
        'account|会员账号'  => ['require', 'min'=>2, 'unique'=>'member'],
        'username|会员账号'  => ['require'],
        'email|邮箱'  => ['require', 'email','unique'=>'member'],
        'password|密码'  => ['require', 'min'=>6],
        'repassword|确认密码' =>['require','confirm'=>'password'],
        'code|验证码'  => ['require'],
    ];

    protected $message  =   [
        'account.min'     => '会员账号不能少于2位',
        'account.unique'     => '会员账号已存在',
        'email.regex' => '请输入正确的邮箱',
        'email.unique' => '邮箱已存在',
        'password.min'     => '密码不能少于6位',
        'repassword.confirm'     => '两次输入密码不一致'
    ];

    protected $scene = [
        'login' =>  ['username','password','code'],
        'register' =>  ['account','email','password','repassword'],
    ];
}