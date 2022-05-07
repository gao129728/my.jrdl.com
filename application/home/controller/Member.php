<?php
namespace app\home\controller;
use app\home\model\MemberModel;
use think\Db;

class Member extends Base
{
    /*
     * [会员登录]
     */
    public function login()
    {
        if(request()->isAjax()){
            $param = input('post.','','trim');
            $result = $this->validate($param,'MemberValidate.login');
            if(true !== $result){
                return json(["code" => 0, "msg" => $result]);
            }else {
                if($param['code'] != cookieCrypt('imgcode')){
                    return json(['code' => 0, 'msg' => '验证码输入不正确']);
                }

                $param = filter_escape_string($param);
                $memberModel = new MemberModel();
                $map['a.account'] = $param['username'];
                $member = $memberModel->getOneMember($map);
                if($member){
                    if($member['password'] != md5(md5($param['password']) . config('auth_key'))){
                        return json(['code' =>0, 'msg' => '登录密码错误']);
                    }

                    if($member['status'] ==0 || $member['group_status'] == 0){
                        return json(['code' =>0, 'msg' => '您的账号已被禁用，无法登陆']);
                    }

                    $save_time = 3600*24*1;
                    cookieCrypt('web_userId', $member['id'], $save_time);
                    $data['id'] = $member['id'];
                    $data['login_num'] = $member['login_num'] + 1;
                    $memberModel->editMember($data);

                    return json(['code' =>1, 'msg' => '会员登录成功']);

                }else{
                    return json(['code' =>0, 'msg' => '会员账号不存在']);
                }

            }
        }
        if($this->isLogin()){
            $this->redirect('home/index/index');
        }

        $this->assign([
            'web_site_title'  => '会员登录'.' - '.$this->config['web_site_title'],
            'web_site_keyword' => $this->config['web_site_keyword'],
            'web_site_description' => $this->config['web_site_description']
        ]);
        return $this->fetch();

    }

    /*
     * [会员注册页]
     */
    public function register()
    {
        if(request()->isAjax()){
            $param = input('post.','','trim');
            $result = $this->validate($param,'MemberValidate.register');
            if(true !== $result){
                return json(["code" => 0, "msg" => $result]);
            }else {
//                if($param['code'] != cookieCrypt('imgcode')){
//                    return json(['code' => 0, 'msg' => '验证码输入不正确']);
//                }
                $param = filter_escape_string($param);

                $param['password'] = md5(md5($param['password']) . config('auth_key'));
                $param['group_id'] = config('web_member_group');
                $param['login_num'] = 0;
                $param['status'] = 1;

                $memberModel = new MemberModel();
                $flag = $memberModel->addMember($param);
                return json(['code' => $flag['code'], 'msg' => $flag['msg']]);
            }
        }
        if($this->isLogin()){
            $this->redirect('home/index/index');
        }
        $this->assign([
            'web_site_title'  => '会员注册'.' - '.$this->config['web_site_title'],
            'web_site_keyword' => $this->config['web_site_keyword'],
            'web_site_description' => $this->config['web_site_description']
        ]);
        return $this->fetch();
    }

    public function zhmm(){

        return $this->fetch();

    }

    /**
     * 退出登录
     */
    public function loginOut()
    {
        cookie('web_userId', null);
        $this->redirect('home/member/login');
    }
}
