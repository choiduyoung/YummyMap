/**
 @author 유태희
 @since 2020.06.12
 	이 인터페이스는 차트에 관련된 인터페이스 입니다 
*/
package com.yummymap.mmy.Service.chart;

import java.util.ArrayList;

import com.yummymap.mmy.vo.admin.ChartCntVO;
import com.yummymap.mmy.vo.admin.ResCntVO;

public interface ChartService {
	public ChartCntVO infoChart();
	
	public ArrayList<ResCntVO> resChart();
	
	public ArrayList<ChartCntVO> clientCnt();
	
}
