package models

import (
	"github.com/astaxie/beego/orm"
    "fmt"
)

type Material struct {
	material_id string
	user_id string
	text string
	media_type int
}

func GetMaterialById(material_id string) Material{
	u := Material{material_id:material_id}
	o := orm.NewOrm()
	o.Using("default")
	err := o.Read(&u)
	if err == orm.ErrNoRows {
		   fmt.Println("查询不到")
	} else if err == orm.ErrMissPK {
		   fmt.Println("找不到主键")
	}
	return u
}

func init() {
	// 需要在init中注册定义的model
	orm.RegisterModel(new(Material))
}