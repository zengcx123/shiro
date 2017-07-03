package com.lanyuan.util;

import com.lanyuan.entity.UserFormMap;
import org.apache.commons.collections.map.HashedMap;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by zeng on 2017/3/16.
 */
public class TapUtil {

    //获取订单号
    public static String getOrderNumber(){
        SimpleDateFormat simpleDateFormat;
        simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        Random random = new Random();
        int ranNum = (int) (random.nextDouble() * (99999 - 10000 +1)) + 10000;//5位随机数
        return simpleDateFormat.format(new Date()) + ranNum;
    }

    //获取编号
    public static String getNumber(String type){
        SimpleDateFormat simpleDateFormat;
        simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        Random random = new Random();
        int ranNum = (int) (random.nextDouble() * (99999 - 10000 +1)) + 10000;//5位随机数
        return type + simpleDateFormat.format(new Date()) + ranNum;
    }

    //获取用户中文名
    public static String getUserName(){
        // 获取request
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        // 通过工具类获取当前登录的bean
        UserFormMap userFormMap = (UserFormMap)Common.findUserSession(request);
        return userFormMap.get("userName").toString();
    }

    //获取用户id
    public static int getUserId(){
        // 获取request
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        // 通过工具类获取当前登录的bean
        UserFormMap userFormMap = (UserFormMap)Common.findUserSession(request);
        return Integer.valueOf(userFormMap.get("id").toString());
    }

    //list分页实现
    public static List<Map<String, Object>> getListPage(int pageNow,int pageSize,List<Map<String, Object>> list){
        List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
        if(list != null && list.size() > 0){
            int allCount = list.size();
            int pageCount = (allCount + pageSize-1) / pageSize;
            if(pageNow >= pageCount){
                pageNow = pageCount;
            }
            int start = (pageNow-1) * pageSize;
            int end = pageNow * pageSize;
            if(end >= allCount){
                end = allCount;
            }
            for(int i = start; i < end; i ++){
                result.add(list.get(i));
            }
        }
        return (result != null && result.size() > 0) ? result : null;
    }

    //输出excel
    public static void exportToExcel(HttpServletResponse response, List<Map<String, Object>> exportData1, List<Map<String, Object>> exportData2, List<?> lis1, List<?> lis2, String fileName, String company,String createDate1,String createDate2) {
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        try {
            ByteArrayOutputStream os = new ByteArrayOutputStream();
            TapUtil.createWorkBook(exportData1, exportData2, lis1, lis2, company,createDate1,createDate2).write(os);
            byte[] content = os.toByteArray();
            InputStream is = new ByteArrayInputStream(content);
            // 设置response参数，可以打开下载页面
            response.reset();
            response.setContentType("application/vnd.ms-excel;charset=utf-8");
            response.setHeader("Content-Disposition",
                    "attachment;filename=" + new String((fileName + ".xls").getBytes(), "iso-8859-1"));
            ServletOutputStream out = response.getOutputStream();
            bis = new BufferedInputStream(is);
            bos = new BufferedOutputStream(out);
            byte[] buff = new byte[2048];
            int bytesRead;
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (bis != null)
                    bis.close();
                if (bos != null)
                    bos.close();
            } catch (IOException e) {
            }

        }
    }

    //获取编号
    public static String getNumber(String createDate1,String createDate2){
        return createDate1.replace("-","") + "-" + createDate2.replace("-","");
    }

    //获取日期
    public static String getDate(){
        SimpleDateFormat simpleDateFormat;
        simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return simpleDateFormat.format(new Date());
    }

    //创建excel
    public static Workbook createWorkBook(List<Map<String, Object>> listMap1, List<Map<String, Object>> listMap2, List<?> list1, List<?> list2, String company,String createDate1,String createDate2) {
        // 创建excel工作簿
        Workbook wb = new HSSFWorkbook();
        // 创建第2个sheet（页），并命名
        Sheet sheet1 = wb.createSheet("按订单汇总");
        Sheet sheet2 = wb.createSheet("按产品汇总");

        //设置单元格风格，右对齐.
        CellStyle numberCs = wb.createCellStyle();
        numberCs.setAlignment(CellStyle.ALIGN_RIGHT);//右上角编号

//        numberCs.setBorderTop(CellStyle.BORDER_THIN);//上边框
//        numberCs.setBorderBottom(CellStyle.BORDER_THIN); //下边框
//        numberCs.setBorderLeft(CellStyle.BORDER_THIN);//左边框
//        numberCs.setBorderRight(CellStyle.BORDER_THIN);//右边框

        //设置字体:
        Font numberFont = wb.createFont();
        numberFont.setFontName("宋体");
        numberFont.setFontHeightInPoints((short) 10);//设置字体大小
//        font.setBoldweight(Font.BOLDWEIGHT_BOLD);//粗体显示

        numberCs.setFont(numberFont);//要用到的字体格式

        //创建第1行（编号）
        Row numberRow1 = sheet1.createRow((short) 0);
        Row numberRow2 = sheet2.createRow((short) 0);
        Cell numberCell;

        for (int i = 0; i < 15; i++) {
            numberCell = numberRow1.createCell(i);
            numberCell.setCellValue("编号：" + getNumber(createDate1,createDate2));
            numberCell.setCellStyle(numberCs);
//            sheet1.autoSizeColumn(i);//自动设宽
        }

        for (int i = 0; i < 17; i++) {
            numberCell = numberRow2.createCell(i);
            numberCell.setCellValue("编号：" + getNumber(createDate1,createDate2));
            numberCell.setCellStyle(numberCs);
        }

        //设置合并的标题头(注意：横向合并的时候，标题头单元格必须长度和内容单元格一致否则合并时会把其他标题头单元格内容挤掉)
        sheet1.addMergedRegion(new CellRangeAddress(0,0,0,17));//首行，末行，首列，末列
        sheet2.addMergedRegion(new CellRangeAddress(0,0,0,17));

        //设置单元格风格，剧中.（标题）
        CellStyle titleCs = wb.createCellStyle();
        titleCs.setAlignment(CellStyle.ALIGN_CENTER);//水平剧中
        titleCs.setVerticalAlignment(CellStyle.VERTICAL_CENTER);//垂直剧中

        //设置字体:
        Font titleFont = wb.createFont();
        titleFont.setFontName("宋体");
        titleFont.setFontHeightInPoints((short) 18);//设置字体大小

        titleCs.setFont(titleFont);//要用到的字体格式

        //创建第一行
        Row titleRow1 = sheet1.createRow((short) 1);
        Row titleRow2 = sheet2.createRow((short) 1);
        Cell titleCell;

        for (int i = 0; i < 15; i++) {//设置标题
            titleCell = titleRow1.createCell(i);
            titleCell.setCellValue("苏州安力外协订单-" + company + "汇总");
            titleCell.setCellStyle(titleCs);
        }

        for (int i = 0; i < 15; i++) {//设置标题
            titleCell = titleRow2.createCell(i);
            titleCell.setCellValue("苏州安力外协订单-" + company + "汇总");
            titleCell.setCellStyle(titleCs);
        }

        //设置合并的标题头(注意：横向合并的时候，标题头单元格必须长度和内容单元格一致否则合并时会把其他标题头单元格内容挤掉)
        sheet1.addMergedRegion(new CellRangeAddress(1,2,0,17));
        sheet2.addMergedRegion(new CellRangeAddress(1,2,0,17));

        // 手动设置列宽。第一个参数表示要为第几列设；，第二个参数表示列的宽度，n为列高的像素数。
        for(int i=1;i<4;i++){//第2列到第4列加宽
            sheet1.setColumnWidth((short) i, (short) (35.7 * 130));
            sheet2.setColumnWidth((short) i, (short) (35.7 * 130));
        }

        //最后一列放宽
        sheet1.setColumnWidth((short) 17, (short) (35.7 * 80));
        sheet2.setColumnWidth((short) 17, (short) (35.7 * 80));

        // 创建列名行
        Row row1 = sheet1.createRow((short) 3);
        Row row2 = sheet2.createRow((short) 3);

        // 创建两种单元格格式（列名，列值）
        CellStyle cs = wb.createCellStyle();
        CellStyle cs2 = wb.createCellStyle();

        // 创建两种字体
        Font f = wb.createFont();
        Font f2 = wb.createFont();

        // 创建第一种字体样式（用于列名）
        f.setFontHeightInPoints((short) 10);
        f.setColor(IndexedColors.BLACK.getIndex());
        f.setBoldweight(Font.BOLDWEIGHT_BOLD);

        // 创建第二种字体样式（用于值）
        f2.setFontHeightInPoints((short) 10);
        f2.setColor(IndexedColors.BLACK.getIndex());

        // 设置第一种单元格的样式（用于列名）
        cs.setFont(f);
        cs.setBorderLeft(CellStyle.BORDER_THIN);
        cs.setBorderRight(CellStyle.BORDER_THIN);
        cs.setBorderTop(CellStyle.BORDER_THIN);
        cs.setBorderBottom(CellStyle.BORDER_THIN);
        cs.setAlignment(CellStyle.ALIGN_CENTER);
        cs.setVerticalAlignment(CellStyle.VERTICAL_CENTER);

        // 设置第二种单元格的样式（用于值）
        cs2.setFont(f2);
        cs2.setBorderLeft(CellStyle.BORDER_THIN);
        cs2.setBorderRight(CellStyle.BORDER_THIN);
        cs2.setBorderTop(CellStyle.BORDER_THIN);
        cs2.setBorderBottom(CellStyle.BORDER_THIN);
        cs2.setAlignment(CellStyle.ALIGN_CENTER);
        cs2.setVerticalAlignment(CellStyle.VERTICAL_CENTER);

        //用于背景颜色
        CellStyle green = wb.createCellStyle();
        green.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        green.setFillForegroundColor(HSSFColor.GREEN.index);
        CellStyle red = wb.createCellStyle();
        red.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        red.setFillForegroundColor(HSSFColor.RED.index);
        green.setFont(f2);
        green.setBorderLeft(CellStyle.BORDER_THIN);
        green.setBorderRight(CellStyle.BORDER_THIN);
        green.setBorderTop(CellStyle.BORDER_THIN);
        green.setBorderBottom(CellStyle.BORDER_THIN);
        green.setAlignment(CellStyle.ALIGN_CENTER);
        green.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
        red.setFont(f2);
        red.setBorderLeft(CellStyle.BORDER_THIN);
        red.setBorderRight(CellStyle.BORDER_THIN);
        red.setBorderTop(CellStyle.BORDER_THIN);
        red.setBorderBottom(CellStyle.BORDER_THIN);
        red.setAlignment(CellStyle.ALIGN_CENTER);
        red.setVerticalAlignment(CellStyle.VERTICAL_CENTER);

        for(int i=0;i<listMap1.size();i++){
            if(Boolean.parseBoolean(listMap1.get(i).get("hide")+"")){
                listMap1.remove(listMap1.get(i));
            }
        }
        for(int i=0;i<listMap2.size();i++){
            if(Boolean.parseBoolean(listMap2.get(i).get("hide")+"")){
                listMap2.remove(listMap1.get(i));
            }
        }

        //设置列名
        for(int i=0;i<listMap1.size();i++){
            Cell cell = row1.createCell(i);
            cell.setCellValue(listMap1.get(i).get("name")+"");
            cell.setCellStyle(cs);
        }
        for(int i=0;i<listMap2.size();i++){
            Cell cell = row2.createCell(i);
            cell.setCellValue(listMap2.get(i).get("name")+"");
            cell.setCellStyle(cs);
        }

        //动态合并单元格,存放数据的list，开始
        List<Map<String, Object>> mapList1 = new ArrayList<Map<String, Object>>();
        List<Map<String, Object>> mapList2 = new ArrayList<Map<String, Object>>();

        Map<String, Object> map11 =(Map<String, Object>) list1.get(0);
        String value11 = map11.get(listMap1.get(1).get("colkey")) == null?" ": map11.get(listMap1.get(1).get("colkey")).toString();

        int firstRow1 = 4;
        int lastRow1 = 4;
        for (int i = 1; i < list1.size(); i++) {
            Map<String, Object> map =(Map<String, Object>) list1.get(i);
            String value = map.get(listMap1.get(1).get("colkey")) == null?" ": map.get(listMap1.get(1).get("colkey")).toString();

            Map<String,Object> map1 = new HashedMap();
            map1.put("firstRow",firstRow1);

            if(!value.equals(value11)){
                map1.put("lastRow",lastRow1 + (i - 1));
                mapList1.add(map1);
                firstRow1 = lastRow1 + i;
                map11 =(Map<String, Object>) list1.get(i);
                value11 = map11.get(listMap1.get(1).get("colkey")) == null?" ": map11.get(listMap1.get(1).get("colkey")).toString();
            }
        }

        Map<String,Object> map111 = new HashedMap();
        map111.put("firstRow",firstRow1);
        map111.put("lastRow",list1.size()+3);
        mapList1.add(map111);

        Map<String, Object> map22 =(Map<String, Object>) list2.get(0);
        String value22 = map22.get(listMap2.get(1).get("colkey")) == null?" ": map22.get(listMap2.get(1).get("colkey")).toString();

        int firstRow2 = 4;
        int lastRow2 = 4;
        for (int i = 1; i < list2.size(); i++) {
            Map<String, Object> map =(Map<String, Object>) list2.get(i);
            String value = map.get(listMap2.get(1).get("colkey")) == null?" ": map.get(listMap2.get(1).get("colkey")).toString();

            Map<String,Object> map1 = new HashedMap();
            map1.put("firstRow",firstRow2);

            if(!value.equals(value22)){
                map1.put("lastRow",lastRow2 + (i - 1));
                mapList2.add(map1);
                firstRow2 = lastRow2 + i;
                map22 =(Map<String, Object>) list2.get(i);
                value22 = map22.get(listMap2.get(1).get("colkey")) == null?" ": map22.get(listMap2.get(1).get("colkey")).toString();
            }
        }

        Map<String,Object> map222 = new HashedMap();
        map222.put("firstRow",firstRow2);
        map222.put("lastRow",list2.size()+3);
        mapList2.add(map222);
        //动态合并单元格,存放数据的list，结束

        //设置每行每列的值
        for (int i = 0; i < list1.size(); i++) {
            // Row 行,Cell 方格 , Row 和 Cell 都是从0开始计数的
            // 创建一行，在页sheet上
            Row row11 = sheet1.createRow(i+4);
            // 在row行上创建一个方格
            for(int j=0;j<listMap1.size();j++){
                Cell cell = row11.createCell(j);
                Map<String, Object> map =(Map<String, Object>) list1.get(i);
                String value = "";
                if(map.get(listMap1.get(j).get("colkey")) != null){
                    value = map.get(listMap1.get(j).get("colkey")).toString();
                    if(map.get(listMap1.get(j).get("colkey")).toString().equals("完成")){
                        cell.setCellValue(value);
                        cell.setCellStyle(green);
                    }else if(map.get(listMap1.get(j).get("colkey")).toString().equals("未完成")){
                        cell.setCellValue(value);
                        cell.setCellStyle(red);
                    }else{
                        cell.setCellValue(value);
                        cell.setCellStyle(cs2);
                    }
                }
            }
        }
        for (int i = 0; i < list2.size(); i++) {
            // Row 行,Cell 方格 , Row 和 Cell 都是从0开始计数的
            // 创建一行，在页sheet上
            Row row22 = sheet2.createRow(i+4);
            // 在row行上创建一个方格
            for(int j=0;j<listMap2.size();j++){
                Cell cell = row22.createCell(j);
                Map<String, Object> map =(Map<String, Object>) list2.get(i);
                String value = "";
                if(map.get(listMap2.get(j).get("colkey")) != null){
                    value = map.get(listMap2.get(j).get("colkey")).toString();
                    if(map.get(listMap2.get(j).get("colkey")).toString().equals("完成")){
                        cell.setCellValue(value);
                        cell.setCellStyle(green);
                    }else if(map.get(listMap2.get(j).get("colkey")).toString().equals("未完成")){
                        cell.setCellValue(value);
                        cell.setCellStyle(red);
                    }else{
                        cell.setCellValue(value);
                        cell.setCellStyle(cs2);
                    }
                }
            }
        }

        //动态合并单元格
        for(int i=0;i<mapList1.size();i++){
            int firstRow11 = Integer.valueOf(mapList1.get(i).get("firstRow").toString());
            int lastRow11 = Integer.valueOf(mapList1.get(i).get("lastRow").toString());
            sheet1.addMergedRegion(new CellRangeAddress(firstRow11,lastRow11,1,1));
        }
        for(int i=0;i<mapList2.size();i++){
            int firstRow22 = Integer.valueOf(mapList2.get(i).get("firstRow").toString());
            int lastRow22 = Integer.valueOf(mapList2.get(i).get("lastRow").toString());
            sheet2.addMergedRegion(new CellRangeAddress(firstRow22,lastRow22,1,1));
        }

        //追加制表、日期、审核、确认
        int lastRowNumber1 = sheet1.getLastRowNum();
        Row row11 = sheet1.createRow((short) lastRowNumber1+1);
        Cell cell11 = row11.createCell(0);
        cell11.setCellValue("制表：               日期:" + getDate() + "          审核：               确认：               ");

        int lastRowNumber2 = sheet2.getLastRowNum();
        Row row22 = sheet2.createRow((short) lastRowNumber1+1);
        Cell cell22 = row22.createCell(0);
        cell22.setCellValue("制表：               日期:" + getDate() + "          审核：               确认：               ");

        CellStyle lastCs = wb.createCellStyle();
        lastCs.setAlignment(CellStyle.ALIGN_LEFT);
        lastCs.setVerticalAlignment(CellStyle.VERTICAL_CENTER);

        cell11.setCellStyle(lastCs);
        sheet1.addMergedRegion(new CellRangeAddress(lastRowNumber1+1,lastRowNumber1+3,0,17));

        cell22.setCellStyle(lastCs);
        sheet2.addMergedRegion(new CellRangeAddress(lastRowNumber2+1,lastRowNumber2+3,0,17));

        return wb;
    }

    //获取头像路径
    public static String getPath(){
//        return "G:\\tomcat_8\\webapps\\tap\\headPic";
//        return "F:\\tomcat_7\\webapps\\tap\\headPic";
        return "D:\\service\\tomcat8_tap\\webapps\\tap\\headPic";
    }

    //保存图片到本地
    public static void savePic(InputStream inputStream, String path, String fileName) {
        OutputStream os = null;
        try {
            // 1.保存到临时文件
            // 1K的数据缓冲
            byte[] bs = new byte[1024];
            // 读取到的数据长度
            int len;
            // 输出的文件流保存到本地文件

            File tempFile = new File(path);
            if (!tempFile.exists()) {
                tempFile.mkdirs();
            }
            os = new FileOutputStream(tempFile.getPath() + File.separator + fileName);
            // 开始读取
            while ((len = inputStream.read(bs)) != -1) {
                os.write(bs, 0, len);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 完毕，关闭所有链接
            try {
                os.close();
                inputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
