package procheck.util;

import java.util.List;

public class ImagesModel {
    private List<String> images;

    public ImagesModel(List<String> images) {
        this.images = images;
    }

    public ImagesModel() {
    }

    public List<String> getImages() {
        return images;
    }

    public void setImages(List<String> images) {
        this.images = images;
    }
}

