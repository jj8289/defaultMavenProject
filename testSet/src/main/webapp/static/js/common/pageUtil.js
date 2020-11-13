"use strict";

(function($){

	$.pageUtil = new pageUtil();
	
	function pageUtil() {

		function paging(funcName, pageNum, pageSize, total) {
	
			if (total < 1)
				return "";
	
			var ret = "";
			var PAGEBLOCK = 5;
			var totalPages = Math.floor((total - 1) / pageSize) + 1;
	
			var firstPage = Math.floor((pageNum - 1) / PAGEBLOCK) * PAGEBLOCK + 1;
			if (firstPage <= 0) 
				firstPage = 1;
	
			var lastPage = firstPage - 1 + PAGEBLOCK;
			if (lastPage > totalPages)
				lastPage = totalPages;
			
			if (firstPage > PAGEBLOCK) {
				ret += "<a title=\"이전\" class=\"page-prev\" href=\"javascript:"+funcName+"(" +(firstPage - 1)+ ")\"></a>";
			} 
			ret += "<ol>";
			for (var i = firstPage; i <= lastPage; i++) {
				if (pageNum == i)
					ret += "<li><a title=\"" + i + "\" class=\"active\" href=\"#none\">" + i + "</a></li>";
				else
					ret += "<li><a title=\"" + i + "\" href=\"javascript:"+funcName+"(" +i+ ")\">" + i + "</a></li>";
			}
			ret += "</ol>";
			if (lastPage < totalPages) {
				ret += "<a title=\"다음\" class=\"page-next\" href=\"javascript:"+funcName+"(" +(lastPage + 1)+ ")\"></a>";    
			} 
	
			return ret;
		} 

		return {
			paging : paging
		}
	
	}

})(jQuery);