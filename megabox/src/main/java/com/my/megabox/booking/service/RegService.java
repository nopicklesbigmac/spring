package com.my.megabox.booking.service;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.megabox.booking.dto.MemberDTO;
import com.my.megabox.booking.repository.IMemberDAO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class RegService {

	@Autowired private IMemberDAO dao;
	
	public Boolean certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		String api_key = "NCSSFUXBFE4DG43X";
	    String api_secret = "BDEP6BVTK6WXDB0KJUXUKKNX0ZHFE1QQ";
	    Message coolsms = new Message(api_key, api_secret);
	    

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", userPhoneNumber);    // ������ȭ��ȣ
	    params.put("from", "01023381814");    // �߽���ȭ��ȣ
	    params.put("type", "SMS");
	    params.put("text", "[MEGABOX] ������ȣ��" + "["+randomNumber+"]" + "�Դϴ�."); // ���� ���� �Է�
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        return true;
	      } catch (CoolsmsException e) {
	    	  return false;
	      }
	}
	
	public int idDoubleCheck(String id) {
		
		return dao.selectId(id);
		
	}
	
	public boolean register(MemberDTO dto) {
		
		int num = dao.register(dto);
		if(num==1) {
			return true;
		}else return false;
	}
}
