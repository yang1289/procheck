package procheck.model;

import javax.persistence.Entity;
import java.io.Serializable;

/**
 * Created by Administrator on 2017/3/21.
 */

public class DataFormat implements Serializable{
    private String filename;
    private String filepath;

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }
}
