package edu.numberone.studystar.servlet;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class IdentifyingCodeServlet
 */
@WebServlet("/IdentifyingCodeServlet")
public class IdentifyingCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdentifyingCodeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int width=84;
		int height=38;
		
		//�ڴ�ͼ��
		BufferedImage image=new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		
		//����
//		Graphics g=image.getGraphics();
		Graphics2D g = image.createGraphics();
		
		//ָ���߿���ɫ
		g.setColor(Color.black);
		
		//��ͼ��߿�
		g.drawRect(0,0, width, height);
		
		//�����εı���ɫ��
		//�趨������ɫ��
		g.setColor(Color.white);
		g.fillRect(1, 1, width-2, height-2);
		
		Random random =new Random();
		
		g.setFont(new Font("9dh5b",Font.BOLD+Font.ITALIC,25));
		
		// ��������,���ѡ������,������8������
//	    Font font = new Font((new String[] { "Arial", "Arial Black",
//	        "Arial Italic", "Courier New", "Courier New Bold Italic",
//	        "Courier New Italic", "Franklin Gothic Medium",
//	        "Franklin Gothic Medium Italic" })[random.nextInt(8)],
//	        Font.PLAIN, 25);
		// ����������ص���(�߿�)
	     g.setStroke(new BasicStroke((float)(Math.random()),
	     BasicStroke.CAP_BUTT, BasicStroke.JOIN_BEVEL));
//	    g.setFont(font);
		
		//�������
		//��������ĸ����������ҳ��
		
		
		g.setColor(Color.gray);
		//���10��������
		for(int i=0;i<10;i++){
			g.drawLine(random.nextInt(width), random.nextInt(height), random.nextInt(width), random.nextInt(height));
		}
		
	
		//�趨������ɫ��
//		g.setColor(Color.RED);
		//����������ɫ��Χ��
		int red =random.nextInt(255);
		int green =random.nextInt(250);
		int blue=random.nextInt(250);
		
		/*
		//�����ĸ���������������ҳ��
		for(int i=0;i<4;++i){
			int n=random.nextInt(10);
			//����ͼƬ��	
			g.drawString(n+"", 20+20*i, 20);
		}
		*/
		
		//��������ĸ�����ĺ���
//		String s="һ������ʮȫʮ��������ɫdgfdyryrrw";
		String s="1234567890ABCDEFGHIGKLMNOKQRSTUVWSYZabcdefghigklmnopqrstuvwsyz";
		//������ת��ΪUnicode ����
//		s ="\u4E00\u4E3E\u4E24\u5F97\u5341\u5168\u5341\u7F8E\u4E94\u989C\u516D\u8272dgfdyryrrw";
		
		StringBuffer sb=new StringBuffer();
		
		
		for(int i=0;i<4;i++){
			//���û��������ɫ��
//			g.setColor(new Color(red,green,blue));
			g.setColor(new Color(random.nextInt(255), random.nextInt(160), random.nextInt(160)));
			
			 // ��תͼ��
		      int degree = (random.nextInt(20) - 10) % 360;
		      double ang = degree * 0.0174532925; // ���Ƕ�תΪ����
		      g.rotate(ang, width / 2, height / 2);
			
			char c=s.charAt(random.nextInt(s.length()));
			
			sb.append(c);
			
			int flag=random.nextBoolean()? 1 :-1;   //�������������

			g.drawString(c+"", 20*i + flag*random.nextInt(3), 30+flag*random.nextInt(3));
		}
		
		//����֤��ת��ΪСд
		String sblowcass=sb.toString().toLowerCase();
		//����֤��ת��ΪΪ��д
		String sbupcass=sb.toString().toUpperCase();
		
		
		//����֤����session
		HttpSession session=request.getSession();
		session.setAttribute("scode", sb.toString());
		//session.setAttribute("scode1", sblowcass);
		//session.setAttribute("scode2", sbupcass);
		
		//���߿ͻ��˲�Ҫ����ͼ��,����ˢ��ͼƬ�޷�����      ����һ������js����ͼƬ��ַ����������������htmlҳ��js����
		response.setHeader("Exprise", -1 + "");
		response.setHeader("Cache-control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		
		
		//��ͼƬ����ͻ���:
		ImageIO.write(image, "jpg", response.getOutputStream());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
