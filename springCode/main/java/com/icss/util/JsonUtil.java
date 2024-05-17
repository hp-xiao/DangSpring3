package com.icss.util;

public class JsonUtil {
	
	/**
	 * Datagrid用于翻页的json串格式
	 * {"total":2,"rows":[{"uname":"u1","sno":"s001","pwd":"123","role":1},
	 *                    {"uname":"u2","sno":"s002","pwd":"123","role":2}]}
	 * @param total
	 * @param rows
	 * @return
	 */
	public static String getDatagridJSON(int total,String rows){
		
		String json = "{\"total\":" + total + ",\"rows\":";
		if(rows != null){
			json += rows;
		}
		json += "}";
		
		return json;
		
	}

}
