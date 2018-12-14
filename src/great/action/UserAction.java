package great.action;



import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import great.entity.Page;
import great.entity.Study;
import great.entity.Transfer;
import great.entity.User;
import great.service.StudyService;
import great.service.TransferService;
import great.service.UserService;


@Controller("userAction")
@RequestMapping("/user")
public class UserAction implements Serializable{
	
//	private static final long serialVersionUID = 1L;
	@Autowired
	private UserService userservice;
	@Autowired
	private TransferService transferservice;
	@Autowired
	private StudyService studyservice;
	@Autowired
	private User user;
//	private String userName;
//	private String userPwd;
//	private InputStream is;
	private String check;
	private List<Study> study=new ArrayList<Study>();
//	//�ϴ��ļ�
//	private File upload;
//	private String uploadContentType;
//	private String uploadFileName;
//	private Transfer transfer;
//	//�����ļ�
//	private String fileName;
//	private InputStream fileIs;
//	
	@RequestMapping(value = "/login.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody int login(HttpServletRequest req,User user) {
		HttpSession session=req.getSession();
//		String keycode=(String)session.getAttribute("keyCode");
		User loginuser=new User();
		loginuser.setUserName(user.getUserName());
		loginuser.setUserPwd(user.getUserPwd());
		User users=userservice.login(loginuser);
		if(users!=null) {
			session.setAttribute("user", users);
			return 1;
		}else {
			return 0;
		}
	}
	@RequestMapping("/toregister.action")
	public ModelAndView toregister() {
		ModelAndView md=new ModelAndView();
		study=studyservice.query();
		md.addObject("study", study);
		md.setViewName("/front/register");
		return md;
	}
	//ajax��ʽ
	@RequestMapping(value = "/register.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody int register(User user) {
		boolean result=userservice.register(user);
		if(result) {
			return 1;
		}else {
			return 0;
		}
	}
	@RequestMapping(value = "/reset.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody int reset(String userName,String userPwd) {
		User user=new User();
		user.setUserName(userName);
		user.setUserPwd(userPwd);
		boolean result=userservice.reset(user);
		if(result) {
			return 1;
		}else {
			return 0;
		}
	}
	
	@RequestMapping("/translist.action")
	public ModelAndView translist() {
		ModelAndView md=new ModelAndView();
		Transfer transfer=new Transfer();
		Page pages=transferservice.findRecords(null, transfer);
		md.addObject("pages", pages);
		md.setViewName("/front/translist");
		return md;
		
	}
	//ajax��ʽ
	@RequestMapping(value = "/transsearch.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public @ResponseBody Page transsearch(String transName,String num) {
		Transfer transfer=new Transfer();
		if(transName!=null&&!transName.equals("")) {
			transfer.setTransName(transName);
		}
		Page pages=transferservice.findRecords(num, transfer);
		return pages;
	}
//	
//	public String namecheck() {
//		User newuser=new User();
//		newuser.setUserName(userName);
//		boolean result=userservice.namecheck(newuser);
//		if(result) {
//			return SUCCESS;
//		}else {
//		return ERROR;
//		}
//	}
//	/*public String image() {
//		Map<String,BufferedImage> imageb = ImageUtil.createImage();
//		////�õ���֤��
//		String code = imageb.keySet().iterator().next();
//		sessionMap.put("keyCode", code);
//		//�õ�ͼƬ
//		BufferedImage image = imageb.get(code);
//		try {
//		is=ImageUtil.getInputStream(image);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return SUCCESS;
//	}
//	*/
//	public String upload() {
//		String path=ServletActionContext.getServletContext().getRealPath("/upload");
//		File file=new File(path);
//		String fileName=null;
//		if(transfer.getTransName()!=null&&!transfer.getTransName().equals("")) {
//			fileName=transfer.getTransName();
//		}else {
//			fileName=uploadFileName.substring(0,uploadFileName.lastIndexOf("."));
//		}
//		String fileType=uploadFileName.substring(uploadFileName.lastIndexOf(".")+1);
//		if(!file.exists()) {
//			file.mkdirs();//����Ŀ¼
//		}
//		try {
//			FileUtils.copyFile(upload, new File(path,fileName+"."+fileType));
//			transfer.setTransName(fileName);
//			User user1=(User)sessionMap.get("users");
//			transfer.setTransUser(user1.getUserName());
//			transfer.setTransType(fileType);
//			transfer.setTransUrl(path+"\\"+fileName+"."+fileType);
//			transferservice.upload(transfer);
////			String[] fileName1=uploadFileName.split("\\.");
////			String fileName=fileName1[0];
////			String filetype=fileName1[1];
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return "upload";
//	}
//	public String download() {
//		fileName="readme.txt";
//		fileIs=ServletActionContext.getServletContext().getResourceAsStream("/upload/"+fileName);
//		return "download";
//	}
//	
//	
//	public String getUserName() {
//		return userName;
//	}
//	public void setUserName(String userName) {
//		this.userName = userName;
//	}
//	public String getUserPwd() {
//		return userPwd;
//	}
//	public void setUserPwd(String userPwd) {
//		this.userPwd = userPwd;
//	}
//	public User getUser() {
//		return user;
//	}
//	public void setUser(User user) {
//		this.user = user;
//	}
//	public Map<String, Object> getTranslist() {
//		return translist;
//	}
//	public void setTranslist(Map<String, Object> translist) {
//		this.translist = translist;
//	}
//	
//	
//	public InputStream getIs() {
//		return is;
//	}
//	public void setIs(InputStream is) {
//		this.is = is;
//	}
//	
//	public String getCheck() {
//		return check;
//	}
//	public void setCheck(String check) {
//		this.check = check;
//	}
	public List<Study> getStudy() {
		return study;
	}
	public void setStudy(List<Study> study) {
		this.study = study;
	}
//	
//	
//	
//	public File getUpload() {
//		return upload;
//	}
//	public void setUpload(File upload) {
//		this.upload = upload;
//	}
//	public String getUploadContentType() {
//		return uploadContentType;
//	}
//	public void setUploadContentType(String uploadContentType) {
//		this.uploadContentType = uploadContentType;
//	}
//	public String getUploadFileName() {
//		return uploadFileName;
//	}
//	public void setUploadFileName(String uploadFileName) {
//		this.uploadFileName = uploadFileName;
//	}
//	public String getFileName() {
//		return fileName;
//	}
//	public void setFileName(String fileName) {
//		this.fileName = fileName;
//	}
//	public InputStream getFileIs() {
//		return fileIs;
//	}
//	public void setFileIs(InputStream fileIs) {
//		this.fileIs = fileIs;
//	}
//	@Override
//	public String toString() {
//		return "UserAction [userName=" + userName + ", userPwd=" + userPwd + ", user=" + user + "]";
//	}
//	
	
	
}
