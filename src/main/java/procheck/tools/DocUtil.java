package procheck.tools;

/**
 * Created by Administrator on 2017/3/12.
 */
import org.apache.poi.poifs.filesystem.DirectoryEntry;
import org.apache.poi.poifs.filesystem.DocumentEntry;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.xwpf.usermodel.*;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.*;
import procheck.model.Project;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.math.BigInteger;
import java.util.List;
import java.util.Map;

public class DocUtil {
    public void createDoc(){
        XWPFDocument doc = new XWPFDocument();

        XWPFParagraph p1 = doc.createParagraph();
        p1.setAlignment(ParagraphAlignment.CENTER);
        p1.setBorderBottom(Borders.DOUBLE);
        p1.setBorderTop(Borders.DOUBLE);

        p1.setBorderRight(Borders.DOUBLE);
        p1.setBorderLeft(Borders.DOUBLE);
        p1.setBorderBetween(Borders.SINGLE);

        p1.setVerticalAlignment(TextAlignment.TOP);

        XWPFRun r1 = p1.createRun();
        r1.setBold(true);
        r1.setText("The quick brown fox");
        r1.setBold(true);
        r1.setFontFamily("Courier");
        r1.setUnderline(UnderlinePatterns.DOT_DOT_DASH);
        r1.setTextPosition(100);

        XWPFParagraph p2 = doc.createParagraph();
        p2.setAlignment(ParagraphAlignment.RIGHT);

        //BORDERS
        p2.setBorderBottom(Borders.DOUBLE);
        p2.setBorderTop(Borders.DOUBLE);
        p2.setBorderRight(Borders.DOUBLE);
        p2.setBorderLeft(Borders.DOUBLE);
        p2.setBorderBetween(Borders.SINGLE);

        XWPFRun r2 = p2.createRun();
        r2.setText("jumped over the lazy dog");
        r2.setStrikeThrough(true);
        r2.setFontSize(20);

        XWPFRun r3 = p2.createRun();
        r3.setText("and went away");
        r3.setStrikeThrough(true);
        r3.setFontSize(20);
        r3.setSubscript(VerticalAlign.SUPERSCRIPT);


        XWPFParagraph p3 = doc.createParagraph();
        p3.setWordWrapped(true);
        p3.setPageBreak(true);

        //p3.setAlignment(ParagraphAlignment.DISTRIBUTE);
        p3.setAlignment(ParagraphAlignment.BOTH);
        p3.setSpacingBetween(15, LineSpacingRule.EXACT);

        p3.setIndentationFirstLine(600);


        XWPFRun r4 = p3.createRun();
        r4.setTextPosition(20);
        r4.setText("To be, or not to be: that is the question: "
                + "Whether 'tis nobler in the mind to suffer "
                + "The slings and arrows of outrageous fortune, "
                + "Or to take arms against a sea of troubles, "
                + "And by opposing end them? To die: to sleep; ");
        r4.addBreak(BreakType.PAGE);
        r4.setText("No more; and by a sleep to say we end "
                + "The heart-ache and the thousand natural shocks "
                + "That flesh is heir to, 'tis a consummation "
                + "Devoutly to be wish'd. To die, to sleep; "
                + "To sleep: perchance to dream: ay, there's the rub; "
                + ".......");
        r4.setItalic(true);
//This would imply that this break shall be treated as a simple line break, and break the line after that word:

        XWPFRun r5 = p3.createRun();
        r5.setTextPosition(10);
        r5.setText("For in that sleep of death what dreams may come");
        r5.addCarriageReturn();
        r5.setText("When we have shuffled off this mortal coil,"
                + "Must give us pause: there's the respect"
                + "That makes calamity of so long life;");
        r5.addBreak();
        r5.setText("For who would bear the whips and scorns of time,"
                + "The oppressor's wrong, the proud man's contumely,");

        r5.addBreak(BreakClear.ALL);
        r5.setText("The pangs of despised love, the law's delay,"
                + "The insolence of office and the spurns" + ".......");

        FileOutputStream out = null;
        try {
            out = new FileOutputStream("simple.docx");
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        try {
            doc.write(out);
            out.close();
            doc.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public void createApply(Map map) throws IOException {
        XWPFDocument doc=new XWPFDocument();
        try {
            XWPFTable table=doc.createTable();
            int length=map.size();
            for(int i=0;i<map.size();i++){
                List list=(List) map.get("tr_"+i);
                System.out.print("tr-td size:======"+list.size());
                for(int k=0;k<list.size();k++){
                    System.out.print("td:====="+list.get(k).toString());
                }
                System.out.println();

            }
            try {
                OutputStream out=new FileOutputStream("yang.docx");
                try {
                    doc.write(out);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }
        }finally {
               doc.close();
        }
    }
    public static void createSimpleTable() throws Exception {
        XWPFDocument doc = new XWPFDocument();

        try {
            XWPFTable table = doc.createTable(3, 3);

            table.getRow(1).getCell(1).setText("EXAMPLE OF TABLE");

            // table cells have a list of paragraphs; there is an initial
            // paragraph created when the cell is created. If you create a
            // paragraph in the document to put in the cell, it will also
            // appear in the document following the table, which is probably
            // not the desired result.
            XWPFParagraph p1 = table.getRow(0).getCell(0).getParagraphs().get(0);

            XWPFRun r1 = p1.createRun();
            r1.setBold(true);
            r1.setText("The quick brown fox");
            r1.setItalic(true);
            r1.setFontFamily("Courier");
            r1.setUnderline(UnderlinePatterns.DOT_DOT_DASH);
            r1.setTextPosition(100);

            table.getRow(2).getCell(2).setText("only text");

            OutputStream out = new FileOutputStream("simpleTable.docx");
            try {
                doc.write(out);
            } finally {
                out.close();
            }
        } finally {
            doc.close();
        }
    }

    public static void createStyledTable() throws Exception {
        // Create a new document from scratch
        XWPFDocument doc = new XWPFDocument();

        try {
            // -- OR --
            // open an existing empty document with styles already defined
            //XWPFDocument doc = new XWPFDocument(new FileInputStream("base_document.docx"));

            // Create a new table with 6 rows and 3 columns
            int nRows = 6;
            int nCols = 3;
            XWPFTable table = doc.createTable(nRows, nCols);

            // Set the table style. If the style is not defined, the table style
            // will become "Normal".
            CTTblPr tblPr = table.getCTTbl().getTblPr();
            CTString styleStr = tblPr.addNewTblStyle();
            styleStr.setVal("StyledTable");

            // Get a list of the rows in the table
            List<XWPFTableRow> rows = table.getRows();
            int rowCt = 0;
            int colCt = 0;
            for (XWPFTableRow row : rows) {
                // get table row properties (trPr)
                CTTrPr trPr = row.getCtRow().addNewTrPr();
                // set row height; units = twentieth of a point, 360 = 0.25"
                CTHeight ht = trPr.addNewTrHeight();
                ht.setVal(BigInteger.valueOf(360));

                // get the cells in this row
                List<XWPFTableCell> cells = row.getTableCells();
                // add content to each cell
                for (XWPFTableCell cell : cells) {
                    // get a table cell properties element (tcPr)
                    CTTcPr tcpr = cell.getCTTc().addNewTcPr();
                    // set vertical alignment to "center"
                    CTVerticalJc va = tcpr.addNewVAlign();
                    va.setVal(STVerticalJc.CENTER);

                    // create cell color element
                    CTShd ctshd = tcpr.addNewShd();
                    ctshd.setColor("auto");
                    ctshd.setVal(STShd.CLEAR);
                    if (rowCt == 0) {
                        // header row
                        ctshd.setFill("A7BFDE");
                    } else if (rowCt % 2 == 0) {
                        // even row
                        ctshd.setFill("D3DFEE");
                    } else {
                        // odd row
                        ctshd.setFill("EDF2F8");
                    }

                    // get 1st paragraph in cell's paragraph list
                    XWPFParagraph para = cell.getParagraphs().get(0);
                    // create a run to contain the content
                    XWPFRun rh = para.createRun();
                    // style cell as desired
                    if (colCt == nCols - 1) {
                        // last column is 10pt Courier
                        rh.setFontSize(10);
                        rh.setFontFamily("Courier");
                    }
                    if (rowCt == 0) {
                        // header row
                        rh.setText("header row, col " + colCt);
                        rh.setBold(true);
                        para.setAlignment(ParagraphAlignment.CENTER);
                    } else {
                        // other rows
                        rh.setText("row " + rowCt + ", col " + colCt);
                        para.setAlignment(ParagraphAlignment.LEFT);
                    }
                    colCt++;
                } // for cell
                colCt = 0;
                rowCt++;
            } // for row

            // write the file
            OutputStream out = new FileOutputStream("styledTable.docx");
            try {
                doc.write(out);
            } finally {
                out.close();
            }
        } finally {
            doc.close();
        }
    }

    public void createWord(Project project, HttpServletRequest request, HttpServletResponse response){
        try {
            //word内容
            String content="<html><body>"+project.getProjectInfo()+"</body></html>";
            byte b[] = content.getBytes("utf-8");  //这里是必须要设置编码的，不然导出中文就会乱码。
            ByteArrayInputStream bais = new ByteArrayInputStream(b);//将字节数组包装到流中
                /*
                * 关键地方
                * 生成word格式
                */
            POIFSFileSystem poifs = new POIFSFileSystem();
            DirectoryEntry directory = poifs.getRoot();
            DocumentEntry documentEntry = directory.createDocument("WordDocument", bais);
            //输出文件
            String fileName=project.getProjectName();
            request.setCharacterEncoding("utf-8");
            response.setContentType("application/msword");//导出word格式
            response.addHeader("Content-Disposition", "attachment;filename=" +
                    new String( (fileName + ".doc").getBytes(),
                            "iso-8859-1"));

            OutputStream ostream = response.getOutputStream();
            poifs.writeFilesystem(ostream);
            bais.close();
            ostream.close();
        }catch(Exception e){
          e.printStackTrace();
        }
    }

    public void createWordX(Project project, HttpServletRequest request, HttpServletResponse response){
        String content="<html><body>"+project.getProjectInfo()+"</body></html>";
        XWPFDocument doc = new XWPFDocument();
        XWPFParagraph citiaoP = doc.createParagraph();
        XWPFRun citiaoR = citiaoP.createRun();
        citiaoR.setText(content);
        String outPath="project.docx";
        try {
            FileOutputStream out = new FileOutputStream(outPath);
            doc.write(out);
            out.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
//        File file = new File(outPath);
//        response.setHeader("Content-Type", "application/msword");
//        String fileName = WebUtil.encodeDownloadFileName(file.getName());
//        response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
//        WebUtil.writeFileToResponse(response, file);

    }


}
