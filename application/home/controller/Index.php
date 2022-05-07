<?php

namespace app\home\controller;

use app\home\model\IndexModel;
use app\home\model\BaseModel;
use app\home\model\ArticleModel;
use think\Db;

class Index extends Base
{
    public function index()
    {


        $BaseModel = new BaseModel();
        $Article = new ArticleModel();

        /****PCbanner***/
        $banner = $BaseModel->getAdverList(['ad_position_id' => 1]);

        /*关于我们*/
        $aboutus = $Article->getOneArticle(['cate_id'=>12]);

        /*最新动态*/
        $news_lists = $Article->getArticleList(['cate_id'=>39]);

        /*环境服务*/
        $service = $Article->getCateList(['parent_id'=>4]);
        foreach ($service as &$v){
            $v['pics'] = $Article->getOneCatePic(['article_id'=>$v['id']]);
        }

        /*投资者关系*/
        $contact = $Article->getArticleList(['cate_id'=>23]);

        /*案例*/
        $cate_ids = Db::name('article_cate')->where(['parent_id'=>4])->column('id');
        $case = $Article->getArticleList(['cate_id'=>['in',$cate_ids]]);




        $this->assign([
            'web_site_title'  => $this->config['web_site_title'],
            'web_site_keyword' => $this->config['web_site_keyword'],
            'web_site_description' => $this->config['web_site_description'],
            'navCur' => 'index',
            'banner' => $banner,
            'aboutus' => $aboutus,
            'news_lists' => $news_lists,
            'service' => $service,
            'contact' => $contact,
            'case' => $case,

        ]);
        return $this->fetch();
    }

    public function get_child_cate($cid, $lvl = 0)
    {
        $arr = [];
        $indexModel = new IndexModel();
        $cate = $indexModel->getCateId(['parent_id' => $cid]);
        if (count($cate) > 0) {
            $arr = $cate;
            foreach ($cate as $v) {
                $arr = array_merge($arr, $this->get_child_cate($v, $lvl + 1));
            }
        }
        if ($lvl == 0) array_push($arr, $cid);
        return $arr;
    }


    public function getData(){
        $param=input('param.');
        $where['status']=1;
        $ids=$this->get_child_cate(4);
        $where['cate_id']=['in',$ids];
        if ($param['area']){
            $where['area'] = $param['area'];
        }
        if ($param['type']){
            $where['type'] = $param['type'];
        }
        $lists = Db::name('article')->where($where)->order('isTop desc, sortnum desc')->select();
        return json(['code'=>1,'data'=>$lists]);
    }
}
