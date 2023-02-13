	function chart_pdf(file_name){		
		
	    // 페이지의 크기를 구한다.
	    var reportPageHeight = $('#container').innerHeight();
	    var reportPageWidth = $('#container').innerWidth();

	    // 캔버스 개체를 만든다.
	    var pdfCanvas = $('<canvas />').attr({
	        id: "canvaspdf",
	        width: reportPageWidth,
	        height: reportPageHeight
	      });

	    // 캔버스 포지션을 정한다.
	    var pdfctx = $(pdfCanvas)[0].getContext('2d');
	    var pdfctxX = 0;
	    var pdfctxY = 0;
	    var buffer = 100;

	      // for each chart.js chart
	    $("canvas").each(function(index) {
	      // 차트의 크기를 구한다.
	      var canvasHeight = $(this).innerHeight();
	      var canvasWidth = $(this).innerWidth();

	      // 새로운 캔버스 안에 넣는다.
	      pdfctx.drawImage($(this)[0], pdfctxX, pdfctxY, canvasWidth, canvasHeight);
	      pdfctxX += canvasWidth + buffer;

	      if (index % 2 === 1) {
	        pdfctxX = 0;
	        pdfctxY += canvasHeight + buffer;
	      }
	    });

	    // pdf 객체를 생성하여 넣는다.
	    var pdf = new jsPDF('l', 'pt', [reportPageWidth, reportPageHeight]);
	    pdf.addImage($(pdfCanvas)[0], 'PNG', 0, 0);
		
		
	    pdf.save(file_name+'_'+moment().format('YYYY-MM-DD HH:mm:ss')+'.pdf');
	}

	function excelFileExport(file_name, table_id) {
	    // step 1. workbook 생성
	    let wb = XLSX.utils.book_new();
	    
	    // step 2. 시트 만들기
	    let newWorksheet = excelHandler.getWorksheet(table_id);
	    let border = {
                top: { style: "thin", color: { argb: "000" } },
                left: { style: "thin", color: { argb: "000" } },
                right: { style: "thin", color: { argb: "000" } },
                bottom: { style: "thin", color: { argb: "000" } },
            };
	    newWorksheet["A2"].s = {
			font: {
//				name: "Calibri",
				sz: 24,
				bold: true,
//				color: { rgb: "FFFFAA00" },
			},
			alignment:{horizontal:"center"}
		};
	    newWorksheet["A4"].s = {
			font: { sz: 13 },
			alignment:{horizontal:"right"}
		};
	    newWorksheet["A5"].s = {
			font: { sz: 12 },
			alignment:{horizontal:"center"},
			fill: { fgColor: { rgb: "E9E9E9" } },
			border:border
		};
	    newWorksheet["B5"].s = {
			font: { sz: 12 },
			alignment:{horizontal:"center"},
			fill: { fgColor: { rgb: "E9E9E9" } },
			border:border
		};
	    newWorksheet['!cols'][0] = {wch:40};
	    newWorksheet['!cols'][1] = {wch:40};
		newWorksheet['!rows'][7] = {border:border};
		var range = XLSX.utils.decode_range(newWorksheet['!ref']);
		for (let rowNum = range.s.r; rowNum <= range.e.r; rowNum++) {
		    // Example: Get second cell in each row, i.e. Column "B"
//		    console.log(XLSX.utils.encode_cell({r: rowNum, c: 1}) +"===="+rowNum);
		    if(rowNum>4){
				newWorksheet[XLSX.utils.encode_cell({r: rowNum, c: 0})].s = {border:border}
				newWorksheet[XLSX.utils.encode_cell({r: rowNum, c: 1})].s = {border:border}
			}
//		    const secondCell = newWorksheet[XLSX.utils.encode_cell({r: rowNum, c: 1})];
		    // NOTE: secondCell is undefined if it does not exist (i.e. if its empty)
//		    console.log(secondCell); // secondCell.v contains the value, i.e. string or number
		}
//		return;
	    // step 3. workbook에 새로만든 워크시트에 이름을 주고 붙인다.
	    XLSX.utils.book_append_sheet(wb, newWorksheet, excelHandler.getSheetName());


	    // step 4. 엑셀 파일 만들기
	    let wbout = XLSX.write(wb, {bookType:'xlsx',  type: 'binary', cellStyles: true });

	    // step 5. 엑셀 파일 내보내기
	    saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), excelHandler.getExcelFileName(file_name));

	}

	const excelHandler = {
	    getExcelFileName : function(file_name){
	        return file_name+'_'+moment().format('YYYY-MM-DD HH:mm:ss')+'.xlsx';
	    },
	    getSheetName : function(){
	        return 'sheet';
	    },
	    getExcelData : function(table_id){
	        return document.getElementById(table_id);
	    },
	    getWorksheet : function(table_id){
	        return XLSX.utils.table_to_sheet(this.getExcelData(table_id), {dateNF:'yyyy-mm-dd hh:mm'});
	    }
	}

	function s2ab(s) {
	    let buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
	    let view = new Uint8Array(buf);  //create uint8array as viewer
	    for (let i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF; //convert to octet
	    return buf;
	}