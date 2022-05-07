<?phpnamespace app\mobile\model;use think\Model;use think\Db;class IndexModel extends Model{    /**     * [获取信息列表]     */    public function getArticleList($map, $limits=null, $type=0)    {        $table = config('database.prefix').'article_cate';            $result = Db::name('article')->alias('a')->field('a.*')->join($table.' b', 'a.cate_id = b.id', 'LEFT')->where($map)->where('a.status',1)->limit($limits)->order('a.isTop desc, a.sortnum desc, a.id desc')->select();            if($result){                foreach($result as $key => $val){                    $result[$key]['url'] = getDetailUrl($val['id'],$val['website'],'');                }            }        return $result;    }    /**     * [根据分类id获取分类信息]     */    public function getOneCate($id)    {        return Db::name('article_cate')->where('id',$id)->order('orderby asc, id asc')->find();    }    /**     * [获取分类ID]     */    public function getCateId($map)    {        return Db::name('article_cate')->where($map)->column('id');    }}