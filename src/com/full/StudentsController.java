package com.full;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.FilterPredicate;

@Controller
public class StudentsController {

	DatastoreService storeData = DatastoreServiceFactory.getDatastoreService();
	Query q = new Query("Students");

	@RequestMapping(value = "/studentsignup", method = RequestMethod.POST)
	public String addDatas(HttpServletRequest req, ModelMap model) {
		try {
			String rollNo = req.getParameter("rollno");
			if (!CheckUser.checkValidUser(rollNo) && req.getParameter("password").length() != 0) {
				Entity stdObj = new Entity("Students", rollNo);
				stdObj.setProperty("Student Name", req.getParameter("name"));
				stdObj.setProperty("Student RollNo", rollNo);
				stdObj.setProperty("Student Password", req.getParameter("password"));
				stdObj.setProperty("Student Address", req.getParameter("address"));
				storeData.put(stdObj);
				return "create";
			} else {
				return "erroradd";
			}
		} catch (Exception e) {
			model.addAttribute("retrylink", "signup.jsp");
			return "idempty";
		}
	}

	@RequestMapping(value = "/logincheck", method = RequestMethod.GET)
	public @ResponseBody String update(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		try {
			String rollNo = req.getParameter("rollNo");
			String password = req.getParameter("password");
			if (CheckUser.checkValidUser(rollNo)) {
				Entity result = CheckUser.studentEntity(rollNo);
				String UserPassword = (String) result.getProperty("Student Password");
				if (UserPassword.equals(password)) {
					resp.getWriter().print("success");
				}
			}
		} catch (Exception e) {
			resp.getWriter().print("empty");
		}
		return null;
	}

	@RequestMapping(value = "/studentprofile", method = RequestMethod.GET)
	public String viewInduvidualDetails(HttpServletRequest req, ModelMap model) {
		String rollno = req.getParameter("rollNo");
		Entity result = CheckUser.studentEntity(rollno);
		model.addAttribute("InduvidualStudent", result);
		return "showinduvidualdetails";
	}

	@RequestMapping(value = "/uploadquestion", method = RequestMethod.POST)
	public String uploadQuestion(HttpServletRequest req, ModelMap model) {
		try {
			String subject = req.getParameter("subjects");
			Entity adminObj = new Entity("Questions", subject);

			adminObj.setProperty("Subject Name", subject);
			adminObj.setProperty("Question", req.getParameter("question"));
			adminObj.setProperty("Test Date", req.getParameter("testDate"));
			storeData.put(adminObj);
			return "questionRespose";
		} catch (Exception e) {
			model.addAttribute("retrylink", "uploadquestion.jsp");
			return "idempty";
		}
	}

	@RequestMapping(value = "/updatestudentmark", method = RequestMethod.POST)
	public String updateStudentMark(HttpServletRequest req, ModelMap model) {

		String markUpdate_RollNo = req.getParameter("stdrollno");

		Entity markUpdateObj = new Entity("studentsMark", markUpdate_RollNo);

		try {
			markUpdateObj.setProperty("Student RollNo", markUpdate_RollNo);
			markUpdateObj.setProperty("Tamil", req.getParameter("tamil"));
			markUpdateObj.setProperty("English", req.getParameter("english"));
			markUpdateObj.setProperty("Maths", req.getParameter("maths"));
			markUpdateObj.setProperty("Science", req.getParameter("science"));
			markUpdateObj.setProperty("Social Science", req.getParameter("socialscience"));

			storeData.put(markUpdateObj);
			return "markupdateresponse";
		} catch (Exception e) {
			model.addAttribute("retrylink", "updatemark.jsp");
			return "idempty";
		}
	}

	@RequestMapping(value = "/viewquestions", method = RequestMethod.GET)
	public String viewQuestion(ModelMap model) {
		Query questionQuery = new Query("Questions");
		List<Entity> questions = storeData.prepare(questionQuery).asList(FetchOptions.Builder.withLimit(10));
		model.addAttribute("Questions", questions);
		return "displayquestions";
	}

	@RequestMapping(value = "/viewallstudentmark", method = RequestMethod.GET)
	public String viewStudentmark(ModelMap model) {
		Query studentsMarkQuery = new Query("studentsMark");
		List<Entity> allStudentMarkDetails = storeData.prepare(studentsMarkQuery).asList(FetchOptions.Builder.withLimit(10));
		model.addAttribute("studentsMarks", allStudentMarkDetails);
		return "displayallstudentmarks";
	}

	@RequestMapping(value = "/induvidualstudentmark", method = RequestMethod.GET)
	public String induvidualStudentMark(HttpServletRequest req, ModelMap model) {
		DatastoreService storeData1 = DatastoreServiceFactory.getDatastoreService();
		String rollno = req.getParameter("rollNo");
		Query induvidualStudent = new Query("studentsMark");

			induvidualStudent.setFilter(new FilterPredicate("Student RollNo", FilterOperator.EQUAL, rollno));
			PreparedQuery pq = storeData1.prepare(induvidualStudent);
			Entity result = pq.asSingleEntity();
			model.addAttribute("InduvidualStudentMark", result);
			return "showinduvidualmarks";
	}

	@RequestMapping(value = "/admincheck", method = RequestMethod.GET)
	public @ResponseBody String admincheck(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String adminPass = req.getParameter("adminpass");
		if (adminPass.equals("admin")) {
			resp.getWriter().print("success");
		}
		return null;
	}

	@RequestMapping(value = "/check", method = RequestMethod.GET)
	public @ResponseBody String checkUser(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		Query validRollNo = q.setFilter(new FilterPredicate("Student RollNo", FilterOperator.EQUAL, req.getParameter("rollNo"))).setKeysOnly();
		Entity currentEntity = storeData.prepare(validRollNo).asSingleEntity();
		if (currentEntity != null) {
			resp.getWriter().print("success");
		}
		return null;
	}
}
