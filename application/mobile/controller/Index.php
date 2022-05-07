<?php
namespace app\mobile\controller;
use app\mobile\model\IndexModel;
use app\mobile\model\BaseModel;
use app\mobile\model\ArticleModel;
use think\Db;
class Index extends Base
{
    public function index(){

        $BaseModel = new BaseModel();
        $Article = new ArticleModel();
        $banner=$BaseModel->getAdverList(['ad_position_id'=>26]);


        /*****guanyuwomen****/
        $aboutus=$Article->getOneArticle(['cate_id'=>9]);

        /*****guanyuwomen****/
        $ywly=$Article->getArticleList(['cate_id'=>12],5);
        foreach($ywly as &$v){
            $v['url']=getDetailUrl($v['id'],$v['website']);
        }
        /****律师团队***/
        $team=$Article->getArticleList(['cate_id'=>13],8);
        foreach($team as &$v){
            $v['url']=getDetailUrl($v['id'],$v['website']);
        }

        /****律师新闻***/
        $newas=$Article->getArticleList(['cate_id'=>14],3);
        foreach($newas as &$v){
            $v['url']=getDetailUrl($v['id'],$v['website']);
        }


        $this->assign([
            'web_site_title'  => $this->config['web_site_title'],
            'web_site_keyword' => $this->config['web_site_keyword'],
            'web_site_description' => $this->config['web_site_description'],
            'navCur' => 'index',
            'banner'=>$banner,
            'aboutus'=>$aboutus,
            'ywly'=>$ywly,
            'team'=>$team,
            'newas'=>$newas,
        ]);

        return $this->fetch();
    }

    public function get_child_cate($cid, $lvl=0)
    {
        $arr = [];
        $indexModel = new IndexModel();
        $cate = $indexModel->getCateId(['parent_id' => $cid]);
        if (count($cate) > 0) {
            $arr = $cate;
            foreach($cate as $v){
                $arr = array_merge($arr, $this->get_child_cate($v, $lvl+1));
            }
        }
        if($lvl == 0) array_push($arr, $cid);
        return $arr;
    }

}
