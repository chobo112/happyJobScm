package kr.happyjob.study.common.comnUtils;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartFile;

public class FileUtilMultipartFile {
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	private MultipartFile[] multipartFiles;

	// root file path
	private String rootFilePath;

	private String virtualrootPath;

	private String itemFilePath;

	// 이미지 파일 허용 확장자
	@Value("${image.allow.ext}")
	private String allowExt;

	public void setMultipartFile(MultipartFile[] multipartFile) {
		this.multipartFiles = multipartFiles;
	}

	public void setRootFilePath(String rootFilePath) {
		this.rootFilePath = rootFilePath;
	}

	public void setVirtualrootPath(String virtualrootPath) {
		this.virtualrootPath = virtualrootPath;
	}

	public void setItemFilePath(String itemFilePath) {
		this.itemFilePath = itemFilePath;
	}

	public void setAllowExt(String allowExt) {
		this.allowExt = allowExt;
	}

	public FileUtilMultipartFile(MultipartFile[] files, String rootFilePath, String virtualrootPath,
			String itemFilePath) {
		this.multipartFiles = files;
		this.rootFilePath = rootFilePath;
		this.virtualrootPath = virtualrootPath;
		this.itemFilePath = itemFilePath;
	}

	public Map<String, Object> uploadFiles() throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		if (multipartFiles.length > 0) {
			for (MultipartFile multipartFile : multipartFiles) {
				logger.info("   - file : " + multipartFile.getOriginalFilename());
				logger.info("   - file : " + multipartFile.getName());
				logger.info("   - file : " + multipartFile.getSize());
				logger.info("   - file : " + multipartFile.getContentType());

				String id = UUID.randomUUID().toString();

				String fileNm = multipartFile.getOriginalFilename();
				String fileExtension = fileNm.substring(fileNm.lastIndexOf(".") + 1);
				String fileNmUuid = fileNm.substring(0, fileNm.lastIndexOf(".")) + id;
				String fileLoc = rootFilePath + "\\" + itemFilePath + fileNmUuid + "." + fileExtension;
				String vrFileLoc = virtualrootPath + "\\" + itemFilePath + fileNmUuid + "." + fileExtension;

				logger.info("virtualrootPath : " + virtualrootPath);
				logger.info("itemFilePath : " + itemFilePath);
				logger.info("fileNmUuid : " + fileNmUuid);
				logger.info("fileExtension : " + fileExtension);
				logger.info("물리경로 : " + fileLoc);
				logger.info("논리경로 : " + vrFileLoc);

				String fileSize = Long.toString(multipartFile.getSize());

				returnMap.put("file_nm", fileNm);
				returnMap.put("file_size", fileSize);
				returnMap.put("file_loc", fileLoc);
				returnMap.put("vrfile_loc", vrFileLoc);
				returnMap.put("fileExtension", fileExtension);
				returnMap.put("file_nm_uuid", fileNmUuid);

				File orgFile = new File(fileLoc);
				multipartFile.transferTo(orgFile);

			}
		}

		return returnMap;
	}
}
