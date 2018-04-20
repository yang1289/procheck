package com.froala.editor.image;

import com.froala.editor.file.FileOptions;

/**
 * Image Options used for uploading.
 * 
 * @author florin@froala.com
 */
public class ImageOptions extends FileOptions {

	/**
	 * Init default image upload settings.
	 */
	@Override
	protected void initDefault() {
		setValidation(new ImageValidation());
	}

	/**
	 * Image resize options.
	 *
	 * @author florin@froala.com
	 *
	 */
	public class ResizeOptions {

		private int newWidth;

		public int getNewWidth() {
			return newWidth;
		}

		public void setNewWidth(int newWidth) {
			this.newWidth = newWidth;
		}

		private int newHeight;

		public int getNewHeight() {
			return newHeight;
		}

		public void setNewHeight(int newHeight) {
			this.newHeight = newHeight;
		}

		private boolean keepAspectRatio;

		public boolean getKeepAspectRatio() {
			return keepAspectRatio;
		}

		public void setKeepAspectRatio(boolean keepAspectRatio) {
			this.keepAspectRatio = keepAspectRatio;
		}
	}

	/**
	 * Options for resizing an image.
	 */
	private ResizeOptions resizeOptions;

	/**
	 * Get the options for resizing an image.
	 *
	 * @return
	 */
	public ResizeOptions getResizeOptions() {
		return resizeOptions;
	}

	/**
	 * Set the options for resizing an image.
	 *
	 * @param resizeOptions
	 */
	public void setResizeOptions(ResizeOptions resizeOptions) {
		this.resizeOptions = resizeOptions;
	}

	/**
	 * Set the options for resizing an image.
	 *
	 * @param newWidth
	 * @param newHeight
	 * @param keepAspectRatio
	 */
	public void setResize(int newWidth, int newHeight, boolean keepAspectRatio) {

		this.resizeOptions = new ResizeOptions();
		resizeOptions.setNewWidth(newWidth);
		resizeOptions.setNewHeight(newHeight);
		resizeOptions.setKeepAspectRatio(keepAspectRatio);
	}

	/**
	 * Constructor. Uses default options: - fieldname "file" - validation
	 * default ImageValidation. To change them, use getters and setters.
	 */
	public ImageOptions() {
		super();
	}

}
