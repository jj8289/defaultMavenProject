package kr.co.jj.company.controller;

import org.json.JSONException;
import org.json.JSONObject;
import org.json.XML;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.jj.user.controller.UserController;

@Controller
public class CompanyController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	//@Autowired
	//private UserService userService;
	
	@GetMapping("/company/join")
	public String join(Model model) {
		parsingXML();
		return "company/join";
	}
	
	public void parsingXML() {
		int PRETTY_PRINT_INDENT_FACTOR = 4;
	    String TEST_XML_STRING =
	        "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n" + 
	        "<Hospital>\r\n" + 
	        "  <head>\r\n" + 
	        "    <list_total_count>443</list_total_count>\r\n" + 
	        "    <RESULT>\r\n" + 
	        "      <CODE>INFO-000</CODE>\r\n" + 
	        "      <MESSAGE>정상 처리되었습니다.</MESSAGE>\r\n" + 
	        "    </RESULT>\r\n" + 
	        "    <api_version>1.0v</api_version>\r\n" + 
	        "  </head>\r\n" + 
	        "  <row>\r\n" + 
	        "    <SIGUN_CD>41110</SIGUN_CD>\r\n" + 
	        "    <SIGUN_NM>수원시</SIGUN_NM>\r\n" + 
	        "    <BIZPLC_NM>대한민국주석병원</BIZPLC_NM>\r\n" + 
	        "    <LICENSG_DE>20091102</LICENSG_DE>\r\n" + 
	        "    <BSN_STATE_NM>폐업 등</BSN_STATE_NM>\r\n" + 
	        "    <CLSBIZ_DE>20151012</CLSBIZ_DE>\r\n" + 
	        "    <LOCPLC_AR/>\r\n" + 
	        "    <GENRL_AMBLNC_CNT>0</GENRL_AMBLNC_CNT>\r\n" + 
	        "    <SPECL_AMBLNC_CNT>0</SPECL_AMBLNC_CNT>\r\n" + 
	        "    <SICKBD_CNT>117</SICKBD_CNT>\r\n" + 
	        "    <EASING_MEDCARE_CHARGE_DEPT_NM/>\r\n" + 
	        "    <EASING_MEDCARE_APPONT_FORM><![CDATA[]]></EASING_MEDCARE_APPONT_FORM>\r\n" + 
	        "    <MEDCARE_INST_ASORTMT_NM/>\r\n" + 
	        "    <MEDSTAF_CNT>10</MEDSTAF_CNT>\r\n" + 
	        "    <HOSPTLRM_CNT>33</HOSPTLRM_CNT>\r\n" + 
	        "    <TREAT_SBJECT_CD_INFO>105 106 101 111 122</TREAT_SBJECT_CD_INFO>\r\n" + 
	        "    <TREAT_SBJECT_CONT>가정의학과, 소아청소년과, 내과, 신경외과, 정형외과</TREAT_SBJECT_CONT>\r\n" + 
	        "    <TOT_AR>6386.78</TOT_AR>\r\n" + 
	        "    <TOT_PSN_CNT/>\r\n" + 
	        "    <FIRST_APPONT_DE/>\r\n" + 
	        "    <PERMISN_SICKBD_CNT>0</PERMISN_SICKBD_CNT>\r\n" + 
	        "    <REFINE_LOTNO_ADDR>경기도 수원시 장안구 연무동 260번지 20호</REFINE_LOTNO_ADDR>\r\n" + 
	        "    <REFINE_ROADNM_ADDR>경기도 수원시 장안구 창룡대로 159 (연무동)</REFINE_ROADNM_ADDR>\r\n" + 
	        "    <REFINE_ZIP_CD>440240</REFINE_ZIP_CD>\r\n" + 
	        "    <REFINE_WGS84_LOGT>127.0275572811</REFINE_WGS84_LOGT>\r\n" + 
	        "    <REFINE_WGS84_LAT>37.2917938226</REFINE_WGS84_LAT>\r\n" + 
	        "  </row>\r\n" + 
	        "  <row>\r\n" + 
	        "    <SIGUN_CD>41110</SIGUN_CD>\r\n" + 
	        "    <SIGUN_NM>수원시</SIGUN_NM>\r\n" + 
	        "    <BIZPLC_NM>아주다남병원</BIZPLC_NM>\r\n" + 
	        "    <LICENSG_DE>20111021</LICENSG_DE>\r\n" + 
	        "    <BSN_STATE_NM>운영중</BSN_STATE_NM>\r\n" + 
	        "    <CLSBIZ_DE/>\r\n" + 
	        "    <LOCPLC_AR/>\r\n" + 
	        "    <GENRL_AMBLNC_CNT>0</GENRL_AMBLNC_CNT>\r\n" + 
	        "    <SPECL_AMBLNC_CNT>0</SPECL_AMBLNC_CNT>\r\n" + 
	        "    <SICKBD_CNT>159</SICKBD_CNT>\r\n" + 
	        "    <EASING_MEDCARE_CHARGE_DEPT_NM/>\r\n" + 
	        "    <EASING_MEDCARE_APPONT_FORM><![CDATA[]]></EASING_MEDCARE_APPONT_FORM>\r\n" + 
	        "    <MEDCARE_INST_ASORTMT_NM/>\r\n" + 
	        "    <MEDSTAF_CNT>10</MEDSTAF_CNT>\r\n" + 
	        "    <HOSPTLRM_CNT>18</HOSPTLRM_CNT>\r\n" + 
	        "    <TREAT_SBJECT_CD_INFO>103 120 122</TREAT_SBJECT_CD_INFO>\r\n" + 
	        "    <TREAT_SBJECT_CONT>가정의학과, 재활의학과, 정신건강의학과</TREAT_SBJECT_CONT>\r\n" + 
	        "    <TOT_AR>1884.32</TOT_AR>\r\n" + 
	        "    <TOT_PSN_CNT/>\r\n" + 
	        "    <FIRST_APPONT_DE/>\r\n" + 
	        "    <PERMISN_SICKBD_CNT>0</PERMISN_SICKBD_CNT>\r\n" + 
	        "    <REFINE_LOTNO_ADDR>경기도 수원시 장안구 정자3동 874번지 2호 롯데프라자 4층</REFINE_LOTNO_ADDR>\r\n" + 
	        "    <REFINE_ROADNM_ADDR>경기도 수원시 장안구 정자천로 187 (정자동, 롯데프라자 4층)</REFINE_ROADNM_ADDR>\r\n" + 
	        "    <REFINE_ZIP_CD>440841</REFINE_ZIP_CD>\r\n" + 
	        "    <REFINE_WGS84_LOGT>126.9953932038</REFINE_WGS84_LOGT>\r\n" + 
	        "    <REFINE_WGS84_LAT>37.2964814842</REFINE_WGS84_LAT>\r\n" + 
	        "  </row>\r\n" + 
	        "  <row>\r\n" + 
	        "    <SIGUN_CD>41110</SIGUN_CD>\r\n" + 
	        "    <SIGUN_NM>수원시</SIGUN_NM>\r\n" + 
	        "    <BIZPLC_NM>수원우노병원</BIZPLC_NM>\r\n" + 
	        "    <LICENSG_DE>20111114</LICENSG_DE>\r\n" + 
	        "    <BSN_STATE_NM>운영중</BSN_STATE_NM>\r\n" + 
	        "    <CLSBIZ_DE/>\r\n" + 
	        "    <LOCPLC_AR/>\r\n" + 
	        "    <GENRL_AMBLNC_CNT>0</GENRL_AMBLNC_CNT>\r\n" + 
	        "    <SPECL_AMBLNC_CNT>0</SPECL_AMBLNC_CNT>\r\n" + 
	        "    <SICKBD_CNT>115</SICKBD_CNT>\r\n" + 
	        "    <EASING_MEDCARE_CHARGE_DEPT_NM/>\r\n" + 
	        "    <EASING_MEDCARE_APPONT_FORM><![CDATA[]]></EASING_MEDCARE_APPONT_FORM>\r\n" + 
	        "    <MEDCARE_INST_ASORTMT_NM/>\r\n" + 
	        "    <MEDSTAF_CNT>5</MEDSTAF_CNT>\r\n" + 
	        "    <HOSPTLRM_CNT>23</HOSPTLRM_CNT>\r\n" + 
	        "    <TREAT_SBJECT_CD_INFO>113 111 103 101</TREAT_SBJECT_CD_INFO>\r\n" + 
	        "    <TREAT_SBJECT_CONT>내과, 정신건강의학과, 소아청소년과, 이비인후과</TREAT_SBJECT_CONT>\r\n" + 
	        "    <TOT_AR>1574.66</TOT_AR>\r\n" + 
	        "    <TOT_PSN_CNT/>\r\n" + 
	        "    <FIRST_APPONT_DE/>\r\n" + 
	        "    <PERMISN_SICKBD_CNT>0</PERMISN_SICKBD_CNT>\r\n" + 
	        "    <REFINE_LOTNO_ADDR>경기도 수원시 권선구 권선동 987번지 3호</REFINE_LOTNO_ADDR>\r\n" + 
	        "    <REFINE_ROADNM_ADDR>경기도 수원시 권선구 장다리로 94 (권선동)</REFINE_ROADNM_ADDR>\r\n" + 
	        "    <REFINE_ZIP_CD>441821</REFINE_ZIP_CD>\r\n" + 
	        "    <REFINE_WGS84_LOGT>127.0215606605</REFINE_WGS84_LOGT>\r\n" + 
	        "    <REFINE_WGS84_LAT>37.2584568956</REFINE_WGS84_LAT>\r\n" + 
	        "  </row>\r\n" + 
	        "  <row>\r\n" + 
	        "    <SIGUN_CD>41110</SIGUN_CD>\r\n" + 
	        "    <SIGUN_NM>수원시</SIGUN_NM>\r\n" + 
	        "    <BIZPLC_NM>윈산부인과병원</BIZPLC_NM>\r\n" + 
	        "    <LICENSG_DE>20111226</LICENSG_DE>\r\n" + 
	        "    <BSN_STATE_NM>운영중</BSN_STATE_NM>\r\n" + 
	        "    <CLSBIZ_DE/>\r\n" + 
	        "    <LOCPLC_AR/>\r\n" + 
	        "    <GENRL_AMBLNC_CNT>0</GENRL_AMBLNC_CNT>\r\n" + 
	        "    <SPECL_AMBLNC_CNT>0</SPECL_AMBLNC_CNT>\r\n" + 
	        "    <SICKBD_CNT>31</SICKBD_CNT>\r\n" + 
	        "    <EASING_MEDCARE_CHARGE_DEPT_NM/>\r\n" + 
	        "    <EASING_MEDCARE_APPONT_FORM><![CDATA[]]></EASING_MEDCARE_APPONT_FORM>\r\n" + 
	        "    <MEDCARE_INST_ASORTMT_NM/>\r\n" + 
	        "    <MEDSTAF_CNT>32</MEDSTAF_CNT>\r\n" + 
	        "    <HOSPTLRM_CNT>19</HOSPTLRM_CNT>\r\n" + 
	        "    <TREAT_SBJECT_CD_INFO>109 110 111 116</TREAT_SBJECT_CD_INFO>\r\n" + 
	        "    <TREAT_SBJECT_CONT>영상의학과, 소아청소년과, 산부인과, 마취통증의학과</TREAT_SBJECT_CONT>\r\n" + 
	        "    <TOT_AR>2855.78</TOT_AR>\r\n" + 
	        "    <TOT_PSN_CNT/>\r\n" + 
	        "    <FIRST_APPONT_DE/>\r\n" + 
	        "    <PERMISN_SICKBD_CNT>0</PERMISN_SICKBD_CNT>\r\n" + 
	        "    <REFINE_LOTNO_ADDR>경기도 수원시 영통구 영통동 946-2번지 윈 산부인과</REFINE_LOTNO_ADDR>\r\n" + 
	        "    <REFINE_ROADNM_ADDR>경기도 수원시 영통구 봉영로1759번길 32 (영통동, 윈 산부인과)</REFINE_ROADNM_ADDR>\r\n" + 
	        "    <REFINE_ZIP_CD>16712</REFINE_ZIP_CD>\r\n" + 
	        "    <REFINE_WGS84_LOGT>127.0809643438</REFINE_WGS84_LOGT>\r\n" + 
	        "    <REFINE_WGS84_LAT>37.2665959546</REFINE_WGS84_LAT>\r\n" + 
	        "  </row>\r\n" + 
	        "  <row>\r\n" + 
	        "    <SIGUN_CD>41110</SIGUN_CD>\r\n" + 
	        "    <SIGUN_NM>수원시</SIGUN_NM>\r\n" + 
	        "    <BIZPLC_NM>서울성모안과병원</BIZPLC_NM>\r\n" + 
	        "    <LICENSG_DE>20120102</LICENSG_DE>\r\n" + 
	        "    <BSN_STATE_NM>운영중</BSN_STATE_NM>\r\n" + 
	        "    <CLSBIZ_DE/>\r\n" + 
	        "    <LOCPLC_AR/>\r\n" + 
	        "    <GENRL_AMBLNC_CNT>0</GENRL_AMBLNC_CNT>\r\n" + 
	        "    <SPECL_AMBLNC_CNT>0</SPECL_AMBLNC_CNT>\r\n" + 
	        "    <SICKBD_CNT>30</SICKBD_CNT>\r\n" + 
	        "    <EASING_MEDCARE_CHARGE_DEPT_NM/>\r\n" + 
	        "    <EASING_MEDCARE_APPONT_FORM><![CDATA[]]></EASING_MEDCARE_APPONT_FORM>\r\n" + 
	        "    <MEDCARE_INST_ASORTMT_NM/>\r\n" + 
	        "    <MEDSTAF_CNT>18</MEDSTAF_CNT>\r\n" + 
	        "    <HOSPTLRM_CNT>8</HOSPTLRM_CNT>\r\n" + 
	        "    <TREAT_SBJECT_CD_INFO>112</TREAT_SBJECT_CD_INFO>\r\n" + 
	        "    <TREAT_SBJECT_CONT>안과</TREAT_SBJECT_CONT>\r\n" + 
	        "    <TOT_AR>1697.61</TOT_AR>\r\n" + 
	        "    <TOT_PSN_CNT/>\r\n" + 
	        "    <FIRST_APPONT_DE/>\r\n" + 
	        "    <PERMISN_SICKBD_CNT>0</PERMISN_SICKBD_CNT>\r\n" + 
	        "    <REFINE_LOTNO_ADDR>경기도 수원시 영통구 원천동 79번지 5호</REFINE_LOTNO_ADDR>\r\n" + 
	        "    <REFINE_ROADNM_ADDR>경기도 수원시 영통구 중부대로271번길 4 (원천동)</REFINE_ROADNM_ADDR>\r\n" + 
	        "    <REFINE_ZIP_CD>443821</REFINE_ZIP_CD>\r\n" + 
	        "    <REFINE_WGS84_LOGT>127.0458396391</REFINE_WGS84_LOGT>\r\n" + 
	        "    <REFINE_WGS84_LAT>37.2744618630</REFINE_WGS84_LAT>\r\n" + 
	        "  </row>\r\n" + 
	        "</Hospital>";
		
		try {
            JSONObject xmlJSONObj = XML.toJSONObject(TEST_XML_STRING);
            String jsonPrettyPrintString = xmlJSONObj.toString(PRETTY_PRINT_INDENT_FACTOR);
            System.out.println(jsonPrettyPrintString);
        } catch (JSONException je) {
            System.out.println(je.toString());
        }
	}
}