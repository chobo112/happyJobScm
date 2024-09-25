package kr.happyjob.study.sampletest.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.StringReader;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorker;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.tool.xml.css.CssFile;
import com.itextpdf.tool.xml.css.StyleAttrCSSResolver;
import com.itextpdf.tool.xml.html.CssAppliers;
import com.itextpdf.tool.xml.html.CssAppliersImpl;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.parser.XMLParser;
import com.itextpdf.tool.xml.pipeline.css.CSSResolver;
import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
import com.itextpdf.tool.xml.pipeline.end.PdfWriterPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;

import kr.happyjob.study.sampletest.service.SampletestNoticeService;
import kr.happyjob.study.common.comnUtils.ComnUtil;
import kr.happyjob.study.common.comnUtils.ExcelDownloadParam;
import kr.happyjob.study.common.comnUtils.ExcelDownloadView;
import kr.happyjob.study.sampletest.model.SamplenoticeModel;



@Controller
@RequestMapping("/sampletest/")
public class SampletestNoticeController {
   
   @Autowired
   SampletestNoticeService sampletestNoticeService;

   // Set logger
   private final Logger logger = LogManager.getLogger(this.getClass());

   // Get class name for logger
   private final String className = this.getClass().toString();
   
    // Root path for file upload 
	@Value("${fileUpload.rootPath}")
	private String rootPath;
	
	@Value("${fileUpload.virtualRootPath}")
	private String virtualRootPath;
	
	@Value("${fileUpload.noticePath}")
	private String noticePath;
   
	@Value("${fontdir}")
	private String fontdir;
	
	@Value("${pdffont}")
	private String pdffont;
	
	@Value("${pdfcss}")
	private String pdfcss;
	
   @RequestMapping("listnotice.do")
   @ResponseBody
   public Map<String, Object> listnotice(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".listnotice");
      logger.info("   - paramMap : " + paramMap);
      
      // 1 page : 0  2 page : 10   
      
      int currentpage = Integer.parseInt((String) paramMap.get("currentpage"));
      int pagesize = Integer.parseInt((String) paramMap.get("pagesize"));
      int startpoint = (currentpage - 1) * pagesize;
      
      paramMap.put("pagesize", pagesize);
      paramMap.put("startpoint", startpoint);
      
      
      Map<String, Object> returnmap = new HashMap<String, Object>();
      
      List<SamplenoticeModel> listdate = sampletestNoticeService.listnotice(paramMap);
      int totalcnt = sampletestNoticeService.totalcntnotice(paramMap);
      
      returnmap.put("listdate",listdate);
      returnmap.put("totalcnt",totalcnt);
      
      logger.info("+ End " + className + ".listnotice");

      return returnmap;
   }
     
   @RequestMapping("savenotice.do")
   @ResponseBody
   public Map<String, Object> savenotice(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".savenotice");
      logger.info("   - paramMap : " + paramMap);
      
      // 1 page : 0  2 page : 10   
      
      String action = (String) paramMap.get("action");
      int sqlreturn = 0;
      String resultmsg = "";
      
      
      paramMap.put("loginID",(String)session.getAttribute("loginId"));
      
      Map<String, Object> returnmap = new HashMap<String, Object>();
      
      if("I".equals(action)) {
    	  sqlreturn = sampletestNoticeService.insertnotice(paramMap);    	  
      } else if("U".equals(action)) {
    	  sqlreturn = sampletestNoticeService.updatenotice(paramMap);
      } else if("D".equals(action)) {
    	  sqlreturn = sampletestNoticeService.deletenotice(paramMap);
      } else {
    	  returnmap.put("result",-1);
          returnmap.put("resultmsg","잘못된 요청 입니다.");
          return returnmap;		
      }
      
      if("I".equals(action)) {
    	  if(sqlreturn >= 0) {
    	     resultmsg = "저장 되었습니다.";
    	  } else {
    		 resultmsg = "저장 실패 되었습니다.";
    	  }
      }
      
      if("U".equals(action)) {
    	  if(sqlreturn >= 0) {
    	     resultmsg = "수정 되었습니다.";
    	  } else {
    		 resultmsg = "수정 실패 되었습니다.";
    	  }
      }
      
      if("D".equals(action)) {
    	  if(sqlreturn >= 0) {
    	     resultmsg = "삭제 되었습니다.";
    	  } else {
    		 resultmsg = "식제 실패 되었습니다.";
    	  }
      }
      
      returnmap.put("result",sqlreturn);
      returnmap.put("resultmsg",resultmsg);
      
      logger.info("+ End " + className + ".savenotice");

      return returnmap;
   }  
   
   @RequestMapping("selectnotice.do")
   @ResponseBody
   public Map<String, Object> selectnotice(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".selectnotice");
      logger.info("   - paramMap : " + paramMap);
      
      
      paramMap.put("loginID",(String)session.getAttribute("loginId"));
      
      Map<String, Object> returnmap = new HashMap<String, Object>();      
      
      SamplenoticeModel sqlreturn = sampletestNoticeService.selectnotice(paramMap); 
      
      returnmap.put("result",sqlreturn);
      
      logger.info("+ End " + className + ".selectnotice");

      return returnmap;
   }  
   
   @RequestMapping("savenoticefile.do")
   @ResponseBody
   public Map<String, Object> savenoticefile(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".savenoticefile");
      logger.info("   - paramMap : " + paramMap);
      
      // 1 page : 0  2 page : 10   
      
      String action = (String) paramMap.get("action");
      int sqlreturn = 0;
      String resultmsg = "";
      
      
      paramMap.put("loginID",(String)session.getAttribute("loginId"));
      
      Map<String, Object> returnmap = new HashMap<String, Object>();
      
      if("I".equals(action)) {
    	  sqlreturn = sampletestNoticeService.insertnoticefile(paramMap,request);    	  
      } else if("U".equals(action)) {
    	  sqlreturn = sampletestNoticeService.updatenoticefile(paramMap,request);
      } else if("D".equals(action)) {
    	  sqlreturn = sampletestNoticeService.deletenoticefile(paramMap);
      } else {
    	  returnmap.put("result",-1);
          returnmap.put("resultmsg","잘못된 요청 입니다.");
          return returnmap;		
      }
      
      if("I".equals(action)) {
    	  if(sqlreturn >= 0) {
    	     resultmsg = "저장 되었습니다.";
    	  } else {
    		 resultmsg = "저장 실패 되었습니다.";
    	  }
      }
      
      if("U".equals(action)) {
    	  if(sqlreturn >= 0) {
    	     resultmsg = "수정 되었습니다.";
    	  } else {
    		 resultmsg = "수정 실패 되었습니다.";
    	  }
      }
      
      if("D".equals(action)) {
    	  if(sqlreturn >= 0) {
    	     resultmsg = "삭제 되었습니다.";
    	  } else {
    		 resultmsg = "식제 실패 되었습니다.";
    	  }
      }
      
      returnmap.put("result",sqlreturn);
      returnmap.put("resultmsg",resultmsg);
      
      logger.info("+ End " + className + ".savenoticefile");

      return returnmap;
   }  
   
   @RequestMapping("noticefileDown.do")
   public void noticefileDown(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".noticefileDown");
      logger.info("   - paramMap : " + paramMap);
      
      SamplenoticeModel sqlreturn = sampletestNoticeService.selectnotice(paramMap); 
      //sqlreturn.getFile_name()
      //sqlreturn.getPhygical_path()
      
	  byte fileByte[] = FileUtils.readFileToByteArray(new File(sqlreturn.getPhygical_path()));
		
	  response.setContentType("application/octet-stream");
	  response.setContentLength(fileByte.length);
	  response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(sqlreturn.getFile_name(),"UTF-8")+"\";");
	  response.setHeader("Content-Transfer-Encoding", "binary");
	  response.getOutputStream().write(fileByte); 
	  response.getOutputStream().flush();
	  response.getOutputStream().close();
      
      
      logger.info("+ End " + className + ".savenoticefile");

      return;
   }	   
	   
   
	@RequestMapping("/noticeexcelDown.do")
	public View responseStatExcel(ModelMap excelParams, @RequestParam Map<String, Object> paramMap) throws Exception {
		
		logger.info("+ Start " + className + ".responseStatExcel");
	    logger.info("   - paramMap : " + paramMap);
	      
		paramMap.put("startpoint", 0);
		paramMap.put("pagesize", sampletestNoticeService.totalcntnotice(paramMap));
		
		List<SamplenoticeModel> listdate = sampletestNoticeService.listnotice(paramMap);
		
		makenoticeexcel(excelParams, paramMap, listdate);
			
		return new ExcelDownloadView();
	}	
	
	private void makenoticeexcel(ModelMap excelParams, Map<String, Object> paramMap, List<SamplenoticeModel> resultList) {
		
		List<HashMap<String, Object>> results = new ArrayList<HashMap<String, Object>>();
		
		//n.ntc_no
        //, n.loginID
        //, n.ntc_title
        //, n.ntc_content
        //, DATE_FORMAT(n.ntc_regdate, '%Y-%m-%d') as ntc_regdate
        //, n.file_name
        //, n.logical_path
        //, n.phygical_path
        //, n.file_size
        //, n.file_ext
        //, ui.name as writer
        
		for(SamplenoticeModel each : resultList){
			HashMap<String, Object> result = new HashMap<String, Object>();
			if(each !=null ){				
				result.put("ntc_no",each.getNtc_no());
				result.put("loginID",ComnUtil.NVL(each.getLoginID()));
				result.put("ntc_title",each.getNtc_title());
				result.put("ntc_regdate",ComnUtil.NVL(each.getNtc_regdate())); 
				result.put("writer",ComnUtil.NVL(each.getWriter()));						
			}
			
			results.add(result);
		}
		   
		ExcelDownloadParam param = new ExcelDownloadParam()
				.setExcelParams(excelParams)
				.setList(results)
				.setFilePrefix("notice")
				.setTitle("공지사항 목록")
				.setDate((String)paramMap.get("ssdate"), (String)paramMap.get("sedate"))
				.setNames("번호","사용자ID","제목","작성일","작성자")
				.setCols("ntc_no","loginID","ntc_title","ntc_regdate","writer"); 
		
		ExcelDownloadView.template(param);
	}	
	
	@RequestMapping("/noticepdfDown.do")
	public void noticepdfDown( @RequestParam Map<String, Object> paramMap, Model model, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".noticepdfDown");
		logger.info("   - paramMap : " + paramMap);
		
		// 1. PDF
		// 2. 지정된 디렉토리에 PDF 저장
		// 3. PDF 화면 전달
		
		String SRC = rootPath + File.separator + noticePath + File.separator + "Noticepdf.pdf";  //  
		String DESC = "noticedesc.pdf";
		
		paramMap.put("startpoint", 0);
		paramMap.put("pagesize", sampletestNoticeService.totalcntnotice(paramMap));
		
		List<SamplenoticeModel> listdata = sampletestNoticeService.listnotice(paramMap);
		
		String cationhtml = "검색 조건    ";
		String innerhtml = "";
		
		if(!"".equals((String)paramMap.get("stitle")) 
		   || !"".equals((String)paramMap.get("ssdate"))
		   || !"".equals((String)paramMap.get("sedate")) ) {
			
			if(!"".equals((String)paramMap.get("stitle"))) {
				cationhtml += " 제목 : ";
				cationhtml += (String)paramMap.get("stitle");
			} 
	        
			if(!"".equals((String)paramMap.get("ssdate"))) {
				cationhtml += " 시작일자 : ";
				cationhtml += (String)paramMap.get("ssdate");
			}
			
	        if(!"".equals((String)paramMap.get("sedate"))) {
				cationhtml += " 종료일자 : ";
				cationhtml += (String)paramMap.get("sedate");
			}
		} else {
			cationhtml += "없음";
		}
		
		for(SamplenoticeModel item : listdata) {
			String itemhtml = "<tr>";
			   
			itemhtml += "<td style='align: center'>";
			itemhtml += String.valueOf(item.getNtc_no());
			itemhtml += "</td>";	
			
			itemhtml += "<td>";
			itemhtml += item.getNtc_title();
			itemhtml += "</td>";	

			itemhtml += "<td>";
			itemhtml += item.getWriter();
			itemhtml += "</td>";	
			
			itemhtml += "<td>";
			itemhtml += item.getNtc_regdate();
			itemhtml += "</td>";
			
			itemhtml += "</tr>";  
			
			innerhtml += itemhtml;
		}
		
		
		Document document = new Document(PageSize.A4, 50, 50, 50, 50); // 용지 및 여백 설정

		try {
			PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(SRC)); //현재상대경로에 pdf 생성
			writer.setInitialLeading(12.5f);
			
			document.open(); //생성된 파일을 오픈
			XMLWorkerHelper helper = XMLWorkerHelper.getInstance();

			// 사용할 CSS 를 준비한다.
			CSSResolver cssResolver = new StyleAttrCSSResolver();
			CssFile cssFile = null;
			try {
				cssFile = helper.getCSS(new FileInputStream(rootPath+ File.separator + fontdir + File.separator + pdfcss));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
			
			// HTML 과 폰트준비
			XMLWorkerFontProvider fontProvider = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);
			fontProvider.register(rootPath + File.separator + fontdir + File.separator + pdffont,"MalgunGothic"); // MalgunGothic 은 alias,
			CssAppliers cssAppliers = new CssAppliersImpl(fontProvider);

			HtmlPipelineContext htmlContext = new HtmlPipelineContext(cssAppliers);
			htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());

			// Pipelines
			PdfWriterPipeline pdf = new PdfWriterPipeline(document, writer);
			// Html의pipeline을 생성 (html 태그, pdf의 pipeline설정)
			HtmlPipeline html = new HtmlPipeline(htmlContext, pdf);
			// css의pipeline을 합친다.
			CssResolverPipeline css = new CssResolverPipeline(cssResolver, html);
			//Work 생성 pipeline 연결
			XMLWorker worker = new XMLWorker(css, true);
			//Xml 파서 생성(Html를 pdf로 변환)
			XMLParser xmlParser = new XMLParser(worker, Charset.forName("UTF-8"));

			// 폰트 설정에서 별칭으로 줬던 "MalgunGothic"을 html 안에 폰트로 지정한다.
			String htmlStr = "<html>"  
					       + "<head></head>"  
					       + "<body style=\"font-family:MalgunGothic;\">"  
			               + "<div style='align: center'>"
					       + "<h1 style='text-align: center'>공지사항 관리</h1>"
					       + "<table border=1 class='col'>"
					       + "<caption>"
					       + cationhtml
					       + "</caption>"
				           + "<thead>"   
				           + "<tr>"
				           + "<th style='width: 10%;text-align: center'>글번호</th>"
				           + "<th style='width: 30%;text-align: center'>제목</th>"
				           + "<th style='width: 15%;text-align: center'>작성자</th>"
				           + "<th style='width: 15%;text-align: center'>등록일</th>"
				           + "</tr>"
				           + "</thead>"
				           + "<tbody>"
				           + innerhtml
				           + "</tbody>"
				           + "</table>"
					       + "</div>"
			               + "</body></html>";
			

			
			//StringReader strReader = new StringReader(htmlStr);
			//xmlParser.parse(strReader);
			try (StringReader strReader = new StringReader(htmlStr)) {
				xmlParser.parse(strReader);
			}
			
			document.close();
			writer.close();
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
	        e.printStackTrace();
	    }
		
		byte fileByte[] = FileUtils.readFileToByteArray(new File(SRC));
		  
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode("Noticepdf.pdf","UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte); 
		response.getOutputStream().flush();
	    response.getOutputStream().close();
	    
	    File makefile = new File(SRC);
	    makefile.delete();
	    
		
		logger.info("+ End " + className + ".noticepdfDown");
		
		return;		

	}		
	
	
	
	
	
}