package controllers

import (
	"beegoApiFrame/models"
	// "encoding/json"

	"github.com/astaxie/beego"
)

type MaterialController struct {
	beego.Controller
}

// @Title 获得一个素材
// @Description 返回某素材数据
// @Param      id            path   string    true          "The key for staticblock"
// @Success 200 {object} models.Material
// @router /:id [get]
func (u *MaterialController) GetById() {
	id := u.GetString(":id")
	s := models.GetMaterialById(id)
	u.Data["json"] = s
	u.ServeJSON()
}