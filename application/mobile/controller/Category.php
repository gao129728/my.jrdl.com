<?php
namespace app\mobile\controller;
use app\mobile\model\BaseModel;
use app\mobile\model\ArticleModel;
use app\mobile\model\MessageModel;
use think\Db;

class Category extends Base
{

    public function _initialize()
    {

        parent::_initialize();


    }

    public function index()
    {
        $articleModel = new ArticleModel();
        $BaseModel = new BaseModel();
        $id = (int)input('param.id');
        $cate = $articleModel->getOneCate(['id' => $id]);
        if (!$cate) {
            $this->error('参数错误');
        }
        $cate_arr = array_reverse($this->get_parent_cate($id));
        $navCur = $cate_arr[0]['id'];  //一级id
        $childCnt = $articleModel->getCateCnt(['parent_id' => $id]);
        if ($childCnt == 0) {
            $cateCur = $cate;           //当前id
        } else {
            $cate_arr = array_merge($cate_arr, $this->get_childs_cate($id));
            $cateCur = end($cate_arr);   //当前id
        }

        $current_title = $this->config['web_site_title'];

        $current_title = $cateCur['name'] . ' - ' . $current_title;

        $web_site_keyword = empty($cateCur['keyword']) ? $this->config['web_site_keyword'] : $cateCur['keyword'];
        $web_site_description = empty($cateCur['description']) ? $this->config['web_site_description'] : $cateCur['description'];
        $web_site_title = empty($cateCur['seo_title']) ? $current_title : $cateCur['seo_title'];
        $map_list['cate_id'] = $cateCur['id'];
        $map_list['status'] = 1;

        if($cateCur['info_state'] == 2||$cateCur['info_state'] == 5){
            $limit=6;
        }else if($cateCur['info_state'] == 3){
            $limit=8;
        }else if($cateCur['info_state'] == 4){
            $limit=6;
        }

        if($cateCur['info_state'] == 0 || $cateCur['info_state'] == 1|| $cateCur['info_state'] == 6){
            // $cateParam = $cateCur['cateParam'];
            $lists = $articleModel->getOneArticle($map_list);
        }else if($cateCur['info_state'] == 4){
            $lists = $articleModel->getArticleList($map_list);
        }else if($cateCur['info_state'] == 5){
            $lists = $articleModel->getArticleByWhere($map_list,$limit);
            foreach($lists as &$vf){

                $vf['url']=getDetailUrl($vf['id'],$vf['website']);
            }
        }else{
            //$cateParam = explode('|', $cateCur['cateParam']);
            //$count = $articleModel->getArticleCount($map_list);//计算总页面
            $lists = $articleModel->getArticleByWhere($map_list,$limit);
            foreach($lists as &$vf){
                $vf['content']=leftstr_html($vf['content'],50);
            }
        }



        /*
         * 内页banner
         * */
        $inside_banner = '';
        if (!empty($cateCur['wap_photo'])) $inside_banner = $cateCur['wap_photo'];
        if($inside_banner){
            $banner_img=$inside_banner;
        }else{
            if($cate_arr[0]['wap_photo']){
                $banner_img=$cate_arr[0]['wap_photo'];
            }else{
                $adbanner=$BaseModel->getAdverOne(['ad_position_id'=>27]);
                $banner_img=$adbanner['photo'];
            }
        }

        $this->assign('banner_img', $banner_img);

        $sub_menu = $this->get_sub_menu($cate_arr);
        $this->assign('sub_menu', $sub_menu);

        $this->assign('cate_arr', $cate_arr);
        $this->assign([
            'web_site_title' => $web_site_title,
            'web_site_keyword' => $web_site_keyword,
            'web_site_description' => $web_site_description,
            'navCur' => $navCur,
            'navCate' => $cate_arr[0]
        ]);

        $this->assign('cate', $cateCur);

        $this->assign('lists', $lists);

        return $this->fetch();
    }

    public function detail()
    {
        $articleModel = new ArticleModel();
        $BaseModel = new BaseModel();
        $id=input('param.id');
        $info=$articleModel->getOneArticle(['id'=>$id]);
        if(!$info){
            $this->error('参数错误');
        }


        $cate = $articleModel->getOneCate(['id' => $info['cate_id']]);
        if (!$cate) {
            $this->error('参数错误');
        }
        $cate_arr = array_reverse($this->get_parent_cate($info['cate_id']));
        $navCur = $cate_arr[0]['id'];  //一级id
        $childCnt = $articleModel->getCateCnt(['parent_id' => $info['cate_id']]);
        if ($childCnt == 0) {
            $cateCur = $cate;           //当前id
        } else {
            $cate_arr = array_merge($cate_arr, $this->get_childs_cate($info['cate_id']));
            $cateCur = end($cate_arr);   //当前id
        }

        $current_title = $this->config['web_site_title'];

        $current_title =$info['title'].' - '.$cateCur['name'] . ' - ' . $current_title;

        $web_site_keyword = empty($cateCur['keyword']) ? $this->config['web_site_keyword'] : $cateCur['keyword'];
        $web_site_description = empty($cateCur['description']) ? $this->config['web_site_description'] : $cateCur['description'];
        $web_site_title = empty($cateCur['seo_title']) ? $current_title : $cateCur['seo_title'];

        /*
         * 内页banner
         * */
        $inside_banner = '';
        if (!empty($cateCur['wap_photo'])) $inside_banner = $cateCur['wap_photo'];
        if($inside_banner){
            $banner_img=$inside_banner;
        }else{
            if($cate_arr[0]['wap_photo']){
                $banner_img=$cate_arr[0]['wap_photo'];
            }else{
                $adbanner=$BaseModel->getAdverOne(['ad_position_id'=>27]);
                $banner_img=$adbanner['photo'];
            }
        }

        $this->assign('banner_img', $banner_img);

        $sub_menu = $this->get_sub_menu($cate_arr);
        $this->assign('sub_menu', $sub_menu);

        $page=$this->getPage($id);
        $this->assign('info',$info);

        $map['id']=$id;
        $map['views']=$info['views']+1;
        $articleModel->updateArticle($map);

        $this->assign('page',$page);
        $this->assign('cate', $cateCur);

        $this->assign([
            'web_site_title' => $web_site_title,
            'web_site_keyword' => $web_site_keyword,
            'web_site_description' => $web_site_description,
            'navCur' => $navCur,
            'navCate' => $cate_arr[0]
        ]);
        return $this->fetch();
    }




    /*上一页 下一页*/
    public function getPage($cid){
        $artic=new ArticleModel();
        $cate_id=$artic->getOneArticle(['id'=>$cid]);
        $zgInfo=$artic->getArticleList(['cate_id'=> $cate_id['cate_id']]);
        foreach ($zgInfo as &$vo){
            $vo['url']=url('mobile/category/detail',['id'=>$vo['id']]);
        }

        $voListCnt = count($zgInfo);
        if ($voListCnt < 1) {
            $voListCnt = -1;
        }

        for ($k = 0; $k < $voListCnt; $k++) {
            if ($zgInfo[$k]['id'] == $cid){
                if ($k < $voListCnt) {
                    $result['next_id']	= $zgInfo[$k + 1]['id'];
                    $result['next_title']	= $zgInfo[$k + 1]['title'];
                    $result['next_url']= url('mobile/category/detail',['id'=> $result['next_id']]);
                } else {
                    $result['next_id']	= 0;
                }

                if ($k > 0) {
                    $result['prev_id']	= $zgInfo[$k - 1]['id'];
                    $result['prev_title']	= $zgInfo[$k - 1]['title'];
                    $result['prev_url']	= url('mobile/category/detail',['id'=>$result['prev_id']]);;
                } else {
                    $result['prev_id']	= 0;
                }
            }
        }

        return $result;

    }

    /*根据id来进行判断是一级的  还是二级
    */
    public function getNavId($cid){
        $artic=new ArticleModel();
        $cate=$artic->getOneCate(['id'=>$cid]);
        if(!$cate){
            $this->error('参数错误');
        }
        if($cate['parent_id']==0){                     //$cid  如果是一级
            $result['fid']=$cate['id'];
            $result['fname']=$cate['name'];
            $childId=$artic->getOneCate(['parent_id'=> $result['fid']]);   //获取父亲id下面  id最小的分类  做当前的二级分类
            $result['secondId']=$childId['id'];
            $result['secondname']=$childId['name'];
        }else{                                  //$cid  为二级分类ID
            $finfo=$artic->getOneCate(['id'=>$cate['parent_id']]);
            $result['fid']=$cate['parent_id'];
            $result['fname']=$finfo['name'];
            $result['secondId']=$cate['id'];
            $result['secondname']=$cate['name'];
        }

        $result['cateList']=$artic->getCateList(['parent_id'=>$result['fid']]);  //获取所有的fid  下面的  二级分类
        foreach ($result['cateList'] as &$v){
            $v['url']=url('mobile/category/index',['id'=>$v['id']]);
        }

        return $result;


    }


    public function get_parent_cate($cid)
    {
        $arr = [];
        $articleModel = new ArticleModel();
        $cate = $articleModel->getOneCate(['id' => $cid]);
        if ($cate) {
            $cate['child'] = $articleModel->getCateList(['parent_id' => $cid]);
            $arr[] = $cate;
            $arr = array_merge($arr, $this->get_parent_cate($cate['parent_id']));
        }
        return $arr;
    }

    public function get_childs_cate($cid)
    {
        $arr = [];
        $articleModel = new ArticleModel();
        $cate = $articleModel->getOneCate(['parent_id' => $cid, 'status'=>1]);
        if ($cate) {
            $cate['child'] = $articleModel->getCateList(['parent_id' => $cate['id']]);
            $arr[] = $cate;
            $arr = array_merge($arr, $this->get_childs_cate($cate['id']));
        }
        return $arr;
    }

    public function get_sub_menu($category)
    {
        if($category && is_array($category)){
            $lvl = count($category) - 1;
            if($lvl == 0){
                $category[0]['isCurrent'] = 1;
                $sub_menu = $category;
            }else {
                for ($i = $lvl; $i >= 0; $i--) {
                    if ($category[$i]['child']) {
                        foreach ($category[$i]['child'] as $k => $v) {
                            $v['url'] = getCateUrl($v['id'], $v['website'], $v['catedir']);
                            $v['isCurrent'] = 0;
                            $v['child'] = [];
                            if ($v['id'] == $category[$i + 1]['id']) {
                                $v['isCurrent'] = 1;
                                if ($category[$i + 1]['child']) $v['child'] = $category[$i + 1]['child'];
                            }
                            $category[$i]['child'][$k] = $v;
                        }
                    }
                }
                $sub_menu = $category[0]['child'];
            }
            return $sub_menu;
        }else{
            return false;
        }
    }

    public function check_cate_auth($cate_id)
    {
        if($this->config['web_site_member'] == 1){
            $map[]=["exp","FIND_IN_SET($cate_id,group_cate)"];
            $map['status'] = 1;
            $group_cate_arr = Db::name('member_group')->where($map)->column('group_cate');
            if($group_cate_arr){
                $member = $this->isLogin();
                if(!$member){
                    $this->error('您还没有登录，请登录后查看相关内容',url('mobile/member/login'));
                }elseif(!in_array($member['group_id'], $group_cate_arr)){
                    $this->error('会员没有权限，无法查看相关内容');
                }
            }
        }
    }

}
