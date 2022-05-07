<?php

namespace app\home\controller;
use app\home\model\ArticleModel;
use app\home\model\BaseModel;
use  app\home\model\WeixinModel;
use  app\home\model\Weixin_payModel;
use think\Controller;
use think\Db;
use redis\RedisPackage;
class Base extends Controller
{
    protected static $redis;

    public function __construct()
    {
        parent::__construct();
    }
    public function _initialize()
    {
    	$model = new BaseModel();
        $article = new ArticleModel();
        $SystemConfig =  $model->getSystemConfig();
//        if($SystemConfig['web_site_state'] != 1){
//            $this->error('网站无法访问');
//        }

        $config = $model->getWebConfig();
        $this->config = $config;
        $map['status'] = 1;
        $map['parent_id'] = 0;
        $navCate = $model->getNavCate($map);
        foreach($navCate as $key => $val){
            $val['url'] = getCateUrl($val['id'], $val['website'], $val['catedir']);

                $map['parent_id'] = $val['id'];
                $val['sub'] = $model->getNavCate($map);
                if(count($val['sub'])>0){
                    foreach($val['sub'] as $k => $v){
                        $v['url'] = getCateUrl($v['id'], $v['website'], $v['catedir']);
                        $val['sub'][$k] = $v;
                    }
                }

            $navCate[$key] = $val;
        }
        $nav_width = substr(sprintf('%.3f', 1200/(count($navCate)+1)),0,-1);

        $this->assign('nav_width',$nav_width);
        $this->assign('nav_cate',$navCate);
        $this->assign('config',$config);

        //访问统计
        $web_user_counter = cookie('web_user_counter');
        if(empty($web_user_counter))
        {
            cookie('web_user_counter', 'value', 3600);
            if(isset($_SERVER['HTTP_REFERER']) && $_SERVER['HTTP_REFERER']!= '')
            {
                $data['source'] = $_SERVER['HTTP_REFERER']; //有来源
            }else{
                $data['source'] = ""; //直接输入网址访问
            }
            $data['id'] = Db::name('counter')->max('id') + 1;
            $data['ip']	 =	get_client_ip();
            $data['client'] ='电脑端';
            $data['create_time']  =	time();
            $data['state'] = 0;
            Db::name('counter')->insert($data);
        }

        //在线客服
        $online_config = $model->getOnlineConfig();
        $this->assign('online_config',$online_config);
        if($online_config['status'] == 1){
            $this->assign('online_list',$model->getOnlineList());
        }

        //广告列表
        $adverList = $model->getAdverLists(['status'=>1]);
        $this->assign('adverList',$adverList);

        //网站会员
        if($config['web_site_member'] == 1){
            $member_login = $this->isLogin();
            if($member_login){
                $isLogin = true;
                $this->assign('member',$member_login);
            }else{
                $isLogin = false;
            }
            $this->assign('isLogin',$isLogin);
        }


        if($SystemConfig['web_weixin_state'] == 1){
            $this->wxpz=$model->getWeixinConfig();
            $Weixin=new WeixinModel($this->wxpz['appscrect'],$this->wxpz['appid']);

            $code=(input('param.code'));

            if (!empty($code)) {

                $res=$Weixin->get_access_token($code);
                $userinfo=$Weixin->get_openid_userinfo($res['access_token'],$res['openid']);

                halt($userinfo);

            }

            $res=$Weixin->code_shouquan();
        }


        /****PCbanner***/
        $banner=$model->getAdverList(['ad_position_id'=>1]);
        $this->assign('banner',$banner);


        /*宣传片*/
        $one_video = $article->getOneArticle(['cate_id'=>37]);
        $this->assign('one_video',$one_video);

        /*视频列表*/
        $video_lists=$article->getArticleList(['cate_id'=>38]);
        $this->assign('video_lists',$video_lists);

        /*新闻动态右侧热文*/
        $hot_news = Db::name('article')->where(['cate_id'=>39,'status'=>1])->order('isTop desc,sortnum desc')->limit(10)->select();
        $this->assign('hot_news',$hot_news);

        /*党群活动右侧热文*/
        $dqhd_news = Db::name('article')->where(['cate_id'=>40,'status'=>1])->order('isTop desc,sortnum desc')->limit(10)->select();
        $this->assign('dqhd_news',$dqhd_news);



        /*办公环境*/
        $env = $article->getOneCate(['id'=>34]);
        /*福利待遇*/
        $fuli = $article->getOneCate(['id'=>35]);
        /*你问我答*/
        $qas = $article->getOneCate(['id'=>36]);
        $this->assign([
            'env' => $env,
            'fuli' => $fuli,
            'qas' => $qas,
        ]);

        /*项目区域*/
        $area_lists = Db::name('article')->where(['cate_id'=>44])->where(['status'=>1])->order('isTop desc, sortnum desc,id desc')->select();
        $this->assign('area_lists',$area_lists);

        /*项目类型*/
        $type_lists = Db::name('article_cate')->where(['parent_id'=>4])->order('parent_id asc,id asc')->select();
        $this->assign('type_lists',$type_lists);

        /*友情链接*/
        $link=DB::name('nature')->where(['nature_id'=>1])->order('sortnum desc')->select();
        $this->assign('link',$link);

        /*左侧外链*/
        $left_link=DB::name('nature')->where(['nature_id'=>2])->order('sortnum desc')->select();
        $this->assign('left_link',$left_link);

        $empty='<div style="text-align:center;padding:20px 0px;vertical-align:middle;color: #c3c7c5">未查询到相关信息..</div>';
        $this->assign('empty',$empty);
    }

    /*
   * [获取banner配置]
   */
    public function getBannerConfig($id)
    {
        return Db::name('banner_cate')->where('id',$id)->find();
    }

    /*
     * [判断用户是否登录]
     */
    public function isLogin()
    {
        if(cookieCrypt('web_userId')){
            $userId    = (int)cookieCrypt('web_userId');
            $baseModel = new BaseModel();
            $member  = $baseModel->getMemberInfo($userId);
            if($member){
                if($member['status'] == 0|| $member['group_status'] == 0){
                    cookie('web_userId', null);
                    return false;
                }
                return $member;
            }else{
                return false;
            }
        } else {
            return false;
        }
    }
}

