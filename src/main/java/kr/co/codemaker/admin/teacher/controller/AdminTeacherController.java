package kr.co.codemaker.admin.teacher.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminTeacherController {

	@RequestMapping(path="/admin/selectAllTeacher")
	public String selectAllTeacherView() {
		return "adminPage/admin/teacher/selectTeacherInfo";
	}
}
