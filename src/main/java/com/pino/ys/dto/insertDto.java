package com.pino.ys.dto;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class insertDto {
	private String sabun;
	private String join_day;
	private String retire_day;
	private String put_yn;
	private String name;
	private String reg_no;
	private String eng_name;
	private String phone;
	private String hp;
	private String carrier;
	private String pos_gbn_code;
	private String cmp_reg_no;
	private String cmp_reg_image;
	private String sex;
	private String years;
	private String email;
	private String zip;
	private String addr1;
	private String addr2;
	private String dept_code;
	private String join_gbn_code; 
	private String id;
	private String pwd; 
	private String salary;
	private String kosa_reg_yn;
	private String kosa_class_code;
	private String mil_yn;
	private String mil_level;
	private String mil_type;
	private String mil_startdate;
	private String mil_enddate;
	private String job_type;
	private String gart_level;
	private String self_intro;
	private String crm_name;
	private String profile_image;
	private MultipartFile profile_image_file;
    private MultipartFile carrier_image_file;
    private MultipartFile cmp_image_file;
    
    
    
    
    public String transferFile(MultipartFile file, String path) {
		if(file.getOriginalFilename()!="") {
			UUID uuid = UUID.randomUUID();
			String newName = uuid.toString()+"_"+file.getOriginalFilename();
			File copyFile=new File(path+newName); 
			try {
				file.transferTo(copyFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			return newName;
		}
		return "1";
	};
	
	
	public insertDto fileCheck(insertDto dto, String path) {
		MultipartFile cFile = dto.getCmp_image_file();
		MultipartFile caFile = dto.getCarrier_image_file();
		MultipartFile pFile = dto.getProfile_image_file();
		String cFileName = transferFile(cFile,path);
		String caFileName = transferFile(caFile,path);
		String pFileName = transferFile(pFile,path);
		if(cFileName!="1") {
			dto.setCmp_reg_image(cFileName);
		}else {
			dto.setCmp_reg_image("");
		};
		if(caFileName!="1") {
			dto.setCarrier(caFileName);
		}else {
			dto.setCarrier("");
		};
		if(pFileName!="1") {
			dto.setProfile_image(pFileName); 
		}else {
			dto.setProfile_image("");
		};
		return dto;
	}
	
}
