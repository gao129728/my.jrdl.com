<?php

namespace app\home\validate;
use think\Validate;

class FormValidate extends Validate
{

    protected $rule = [
        'name|姓名'  => ['require'],
        'email|邮箱'  => ['email'],
        'phone|电话'  => ['require', 'regex'=>'/^0?(13|14|15|17|18)[0-9]{9}$/'],
        'province|所在省份'  => ['require'],
        'city|所在城市'  => ['require'],
        'code|验证码'  => ['require'],
        'content|投诉建议'  => ['require'],
    ];

    protected $message  =   [
        'phone.regex' => '请输入正确的手机号',
    ];

    protected $scene = [
        'message' =>  ['name','phone','content'],
        'job' =>  ['name','phone','sex','age','college','graduate_time','email','resumes','appraise','annex'],
    ];
}