package admin.book.web.servlet;

import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.ImageIcon;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import cn.itcast.commons.CommonUtils;
import book.domain.Book;
import book.service.BookService;
import category.domain.Category;
import category.service.CategoryService;

public class AdminAddBookServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//��������
		FileItemFactory factory = new DiskFileItemFactory();
		//����������
		ServletFileUpload sfu = new ServletFileUpload(factory);
		sfu.setFileSizeMax(80 * 1024);//����ͼƬ�ϴ���С

		List<FileItem> fileItemList = null;
		try {
			fileItemList = sfu.parseRequest(request);
		} catch (FileUploadException e) {
			error("�ϴ����ļ�����80kb", request, response);
			return;
		}

		Map<String,Object> map = new HashMap<String,Object>();
		for(FileItem fileItem : fileItemList) {
			if(fileItem.isFormField()) {
				map.put(fileItem.getFieldName(), fileItem.getString("UTF-8"));
			}
		}
		Book book = CommonUtils.toBean(map, Book.class);
		Category category = CommonUtils.toBean(map, Category.class);
		book.setCategory(category);

		FileItem fileItem = fileItemList.get(1);
		String filename = fileItem.getName();

		int index = filename.lastIndexOf("\\");
		if(index != -1) {
			filename = filename.substring(index + 1);
		}
		
		filename = CommonUtils.uuid() + "_" + filename;

		if(!filename.toLowerCase().endsWith(".jpg")) {
			error("�ϴ�ͼƬ�ĸ�ʽ����ȷ", request, response);
			return;
		}
		//У��ͼƬ�ߴ�
		String savepath = this.getServletContext().getRealPath("/book_img");

		File destFile = new File(savepath, filename);

		try {
			fileItem.write(destFile);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		ImageIcon icon = new ImageIcon(destFile.getAbsolutePath());

		Image image = icon.getImage();

		if(image.getWidth(null) > 350 || image.getHeight(null) > 350) {
			error("�ϴ���ͼƬ�����ߴ�350*350", request, response);
			destFile.delete();
			return;
		}
		
		book.setImage_w("book_img/" + filename);
		

		fileItem = fileItemList.get(2);
		filename = fileItem.getName();

		index = filename.lastIndexOf("\\");
		if(index != -1) {
			filename = filename.substring(index + 1);
		}

		filename = CommonUtils.uuid() + "_" + filename;

		if(!filename.toLowerCase().endsWith(".jpg")) {
			error("", request, response);
			return;
		}

		savepath = this.getServletContext().getRealPath("/book_img");

		destFile = new File(savepath, filename);

		try {
			fileItem.write(destFile);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		icon = new ImageIcon(destFile.getAbsolutePath());

		image = icon.getImage();

		if(image.getWidth(null) > 350 || image.getHeight(null) > 350) {
			error("", request, response);
			destFile.delete();
			return;
		}
		
		book.setImage_b("book_img/" + filename);		
		

		book.setBid(CommonUtils.uuid());
		BookService bookService = new BookService();
		bookService.add(book);
		
		request.setAttribute("msg", "���ͼ��ɹ�");
		request.getRequestDispatcher("/adminjsps/msg.jsp").forward(request, response);

	}
	
	private void error(String msg, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("/adminjsps/admin/book/add.jsp").
				forward(request, response);
	}

}
